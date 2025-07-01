import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:pemo_test_project/features/manage_cards/manage_cards.dart';
import 'package:pemo_test_project/injection_container.dart';

/// A page for creating a new card via a multi-step form.
class CreateCardPage extends StatelessWidget {
  const CreateCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CreateCardCubit>(),
      child: Scaffold(
        backgroundColor: AppTheme.of(context).color.greyScaffoldBGColor,
        appBar: AppPrimaryAppBar(
          title: 'Create a New Card',
        ),
        body: const _CreateCardForm(),
      ),
    );
  }
}

class _CreateCardForm extends StatelessWidget {
  const _CreateCardForm();

  bool _isStepComplete(int step, CreateCardState state) {
    switch (step) {
      case 0:
        return state.cardName.isValid && state.cardholder.isValid;
      case 1:
        return state.balance.isValid;
      case 2:
        return state.cardColor.isValid;
      default:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateCardCubit, CreateCardState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: AppText.bodyMedium('Card created successfully!'),
              ),
            );
          Navigator.of(context)
              .pop(true); // Pop with a result to indicate success
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: AppText.bodyMedium(
                  state.errorMessage ?? 'An error occurred',
                ),
              ),
            );
        }
      },
      child: BlocBuilder<CreateCardCubit, CreateCardState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Stepper(
                  currentStep: state.currentStep,
                  onStepTapped: (step) {
                    bool isTappable = true;
                    for (var i = 0; i < step; i++) {
                      if (!_isStepComplete(i, state)) {
                        isTappable = false;
                        break;
                      }
                    }
                    if (isTappable) {
                      context.read<CreateCardCubit>().onStepTapped(step);
                    }
                  },
                  onStepContinue: () =>
                      context.read<CreateCardCubit>().onStepContinue(),
                  onStepCancel: () =>
                      context.read<CreateCardCubit>().onStepCancel(),
                  controlsBuilder: (context, details) {
                    return _ControlsBuilder(details: details);
                  },
                  steps: [
                    _buildStep1(context, state),
                    _buildStep2(context, state),
                    _buildStep3(context, state),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.x4),
                  child: _CardPreview(state: state),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Step _buildStep1(BuildContext context, CreateCardState state) {
    return Step(
      title: const AppText.bodyLarge('Details'),
      isActive: state.currentStep >= 0,
      state: state.currentStep > 0 ? StepState.complete : StepState.indexed,
      content: Column(
        children: [
          AppTextField(
            labelText: 'Card Name',
            hint: 'e.g., My Personal Card',
            onValueChange: (value) =>
                context.read<CreateCardCubit>().onCardNameChanged(value),
          ),
          const SizedBox(height: AppSpacing.x4),
          AppDropdownButton<String>(
            labelText: 'Cardholder',
            hintText: 'Select a cardholder',
            value: state.cardholder.value.isNotEmpty
                ? state.cardholder.value
                : null,
            errorText: state.cardholder.displayError?.message,
            items: ['Alice', 'Bob', 'Charlie', 'David'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: AppText.bodyMedium(value),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                context.read<CreateCardCubit>().onCardholderChanged(value);
              }
            },
          ),
        ],
      ),
    );
  }

  Step _buildStep2(BuildContext context, CreateCardState state) {
    return Step(
      title: const AppText.bodyLarge('Balance'),
      isActive: state.currentStep >= 1,
      state: state.currentStep > 1 ? StepState.complete : StepState.indexed,
      content: AppTextField(
        labelText: 'Initial Balance',
        hint: 'e.g., 500',
        textInputType: TextInputType.number,
        inputFormatters: [
          _BalanceRangeTextInputFormatter(),
        ],
        onValueChange: (value) =>
            context.read<CreateCardCubit>().onBalanceChanged(value),
      ),
    );
  }

  Step _buildStep3(BuildContext context, CreateCardState state) {
    return Step(
      title: const AppText.bodyLarge('Appearance'),
      isActive: state.currentStep >= 2,
      state: state.currentStep > 2 ? StepState.complete : StepState.indexed,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpacing.x2,
        children: [
          const AppText.bodyMedium('Select a Card Color'),
          AppColorPicker(
            pickerColor: Color(
              context.read<CreateCardCubit>().state.cardColor.value ?? 0,
            ),
            onColorChanged: (color) {
              context
                  .read<CreateCardCubit>()
                  .onCardColorChanged(color.toARGB32());
            },
          ),
          if (state.cardColor.displayError != null)
            AppText.bodySmall(
              state.cardColor.displayError!.message,
              color: Theme.of(context).colorScheme.error,
            ),
        ],
      ),
    );
  }
}

class _ControlsBuilder extends StatelessWidget {
  const _ControlsBuilder({required this.details});

  final ControlsDetails details;

  bool _isStepValid(CreateCardState state) {
    switch (state.currentStep) {
      case 0:
        return state.cardName.isValid && state.cardholder.isValid;
      case 1:
        return state.balance.isValid;
      case 2:
        return state.cardColor.isValid;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CreateCardCubit>().state;
    final isLastStep = state.currentStep == 2;
    final isStepValid = _isStepValid(state);

    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.x4),
      child: Row(
        children: [
          Expanded(
            child: AppMainButton(
              title: isLastStep ? 'Submit' : 'Continue',
              onTap: isStepValid
                  ? (isLastStep
                      ? context.read<CreateCardCubit>().onFormSubmitted
                      : details.onStepContinue)
                  : null,
              showProgress: state.status.isInProgress,
            ),
          ),
          if (state.currentStep != 0) const SizedBox(width: AppSpacing.x2),
          if (state.currentStep != 0)
            Expanded(
              child: AppMainButton(
                title: 'Back',
                onTap: details.onStepCancel,
              ),
            ),
        ],
      ),
    );
  }
}

class _BalanceRangeTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (digitsOnly.isEmpty) {
      return const TextEditingValue();
    }

    final number = int.tryParse(digitsOnly);
    if (number == null || number > 1000) {
      return oldValue;
    }

    return TextEditingValue(
      text: digitsOnly,
      selection: TextSelection.collapsed(offset: digitsOnly.length),
    );
  }
}

class _CardPreview extends StatelessWidget {
  const _CardPreview({required this.state});

  final CreateCardState state;

  @override
  Widget build(BuildContext context) {
    final card = CardEntity(
      id: 'preview',
      cardName:
          state.cardName.value.isNotEmpty ? state.cardName.value : 'Card Name',
      cardholderName: state.cardholder.value.isNotEmpty
          ? state.cardholder.value
          : 'Cardholder Name',
      balance: int.tryParse(state.balance.value) ?? 0,
      cardColor: state.cardColor.value ?? Colors.grey.toARGB32(),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppText.headingMedium('Card Preview'),
        const SizedBox(height: AppSpacing.x4),
        CardItemWidget(card: card),
      ],
    );
  }
}
