import 'package:flutter/material.dart';
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
          return Stepper(
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
            onStepCancel: () => context.read<CreateCardCubit>().onStepCancel(),
            controlsBuilder: (context, details) {
              return _ControlsBuilder(details: details);
            },
            steps: [
              _buildStep1(context, state),
              _buildStep2(context, state),
              _buildStep3(context, state),
            ],
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
            onValueChange: (value) =>
                context.read<CreateCardCubit>().onCardNameChanged(value),
          ),
          const SizedBox(height: AppSpacing.x4),
          _CardholderDropdown(),
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
        textInputType: TextInputType.number,
        onValueChange: (value) =>
            context.read<CreateCardCubit>().onBalanceChanged(value),
        // errorText: state.balance.displayError?.message,
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
        children: [
          const AppText.bodyMedium('Select a Card Color'),
          const SizedBox(height: AppSpacing.x2),
          AppColorPicker(
            pickerColor: Color(state.cardColor.value ?? 0),
            onColorChanged: (color) => context
                .read<CreateCardCubit>()
                .onCardColorChanged(color.toARGB32()),
          ),
          if (state.cardColor.displayError != null)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.x2),
              child: AppText.bodySmall(
                state.cardColor.displayError!.message,
                color: Theme.of(context).colorScheme.error,
              ),
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

class _CardholderDropdown extends StatelessWidget {
  final List<String> _cardholders = ['Alice', 'Bob', 'Charlie', 'David'];

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CreateCardCubit>().state;

    return DropdownButtonFormField<String>(
      value: state.cardholder.value.isNotEmpty ? state.cardholder.value : null,
      decoration: InputDecoration(
        labelText: 'Cardholder',
        errorText: state.cardholder.displayError?.message,
        border: const OutlineInputBorder(),
      ),
      items: _cardholders.map((String value) {
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
    );
  }
}
