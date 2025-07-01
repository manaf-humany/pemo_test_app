import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:pemo_test_project/features/features.dart';
import 'package:pemo_test_project/injection_container.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<TransactionCubit>()..fetchTransactions(),
        ),
        BlocProvider(
          create: (_) => sl<CurrencyCubit>(),
        ),
      ],
      child: const _TransactionsView(),
    );
  }
}

class _TransactionsView extends StatefulWidget {
  const _TransactionsView();

  @override
  State<_TransactionsView> createState() => _TransactionsViewState();
}

class _TransactionsViewState extends State<_TransactionsView> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  // Holds the full, unfiltered list of transactions from the cubit.
  List<TransactionItemEntity> _allTransactions = [];
  // Holds the filtered and grouped transactions for display.
  Map<String, List<TransactionItemEntity>> _groupedTransactions = {};

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      final filteredTransactions =
          _getFilteredTransactions(_searchController.text);
      _groupedTransactions = _groupTransactionsByDate(filteredTransactions);
    });
  }

  List<TransactionItemEntity> _getFilteredTransactions(String query) {
    if (query.isEmpty) {
      return _allTransactions;
    }

    final queryLower = query.toLowerCase();
    return _allTransactions.where((TransactionItemEntity transaction) {
      return transaction.name.toLowerCase().contains(queryLower) ||
          transaction.billingCurrency.toString().contains(queryLower);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).color.greyScaffoldBGColor,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppPrimaryAppBar _buildAppBar() {
    return AppPrimaryAppBar(
      title: 'Transactions',
    );
  }

  Widget _buildBody() {
    return BlocListener<TransactionCubit, TransactionState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
          loaded: (transactions) {
            setState(() {
              // When transactions are loaded, store the full list.
              _allTransactions = transactions;
              // Apply the current search filter to the new list.
              final filteredTransactions =
                  _getFilteredTransactions(_searchController.text);
              _groupedTransactions =
                  _groupTransactionsByDate(filteredTransactions);
              // The total spent is always calculated on the full list.
              context.read<CurrencyCubit>().calculateTotalSpent(transactions);
            });
          },
        );
      },
      child: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          return state.when(
            initial: () => _buildLoadingSkeleton(),
            loading: () => _buildLoadingSkeleton(),
            loaded: (transactions) {
              if (transactions.isEmpty) {
                return _buildEmptyStateSliver();
              }
              return RefreshIndicator(
                onRefresh: () async {
                  // On refresh, clear search and fetch transactions.
                  _searchController.clear();
                  await context.read<TransactionCubit>().fetchTransactions();
                },
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    _buildSummaryCardSliver(),
                    _buildSearchSliver(),
                    if (_groupedTransactions.isEmpty)
                      _buildEmptyStateSliver()
                    else
                      _buildTransactionListSliver(),
                  ],
                ),
              );
            },
            error: (message) => Center(
              child: AppErrorWidget(
                errorMessage: message,
                onRetryPressed: () {
                  _searchController.clear();
                  context.read<TransactionCubit>().fetchTransactions();
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchSliver() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.x4,
          AppSpacing.x4,
          AppSpacing.x4,
          0,
        ),
        child: AppTextField(
          controller: _searchController,
          hint: 'Search by name or currency',
        ),
      ),
    );
  }

  Widget _buildSummaryCardSliver() {
    return const SliverToBoxAdapter(child: TotalSpentCard());
  }

  Widget _buildTransactionListSliver() {
    final sortedDates = _groupedTransactions.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final date = sortedDates[index];
          final transactions = _groupedTransactions[date]!;
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50,
              child: FadeInAnimation(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        AppSpacing.x4,
                        AppSpacing.x4,
                        AppSpacing.x4,
                        0,
                      ),
                      child: AppText.bodyMedium(
                        date,
                        color: AppTheme.of(context).color.secondTextColor,
                      ),
                    ),
                    ...transactions.map(
                      (transaction) => TransactionItemWidget(
                        transaction: transaction,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => TransactionDetailsPage(
                                transactionId: transaction.id,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(height: 1),
                  ],
                ),
              ),
            ),
          );
        },
        childCount: sortedDates.length,
      ),
    );
  }

  Map<String, List<TransactionItemEntity>> _groupTransactionsByDate(
    List<TransactionItemEntity> transactions,
  ) {
    final grouped = <String, List<TransactionItemEntity>>{};
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    for (final transaction in transactions) {
      final dateTime =
          DateTime.fromMillisecondsSinceEpoch(transaction.date * 1000);

      final transactionDate = DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
      );

      String key;
      if (transactionDate == today) {
        key = 'Today';
      } else if (transactionDate == yesterday) {
        key = 'Yesterday';
      } else {
        key = DateFormat('MMMM d, yyyy').format(dateTime);
      }
      if (grouped[key] == null) {
        grouped[key] = [];
      }
      grouped[key]!.add(transaction);
    }
    return grouped;
  }

  /// Builds the skeleton loading widget.
  Widget _buildLoadingSkeleton() {
    return TransactionsLoadingWidget();
  }

  /// Builds a sliver for the empty state message.
  Widget _buildEmptyStateSliver() {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: AppEmptyWidget(
        title: 'No Matching Transactions',
        content: 'Try adjusting your search or pull down to refresh.',
      ),
    );
  }
}
