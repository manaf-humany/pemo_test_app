import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:pemo_test_project/features/currency/currency.dart';
import 'package:pemo_test_project/features/transaction_details/presentation/pages/transaction_details_page.dart';
import 'package:pemo_test_project/features/transactions/domain/entities/transaction_item.dart';
import 'package:pemo_test_project/features/transactions/presentation/cubit/transaction_cubit.dart';
import 'package:pemo_test_project/features/transactions/presentation/cubit/transaction_state.dart';
import 'package:pemo_test_project/features/transactions/presentation/widgets/transaction_item_widget.dart';
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
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const AppText.headingMedium('Transactions'),
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppTheme.of(context).color.primaryColor,
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.x4,
                  AppSpacing.x4,
                  AppSpacing.x4,
                  0,
                ),
                child: AppText.bodyLarge(date, fontWeight: FontWeight.bold),
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
    return SkeletonLoadingWidget(
      enabled: true,
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(), // Disable scrolling for skeleton
        slivers: [
          // The TotalSpentCard will show its own skeleton state
          const SliverToBoxAdapter(child: TotalSpentCard()),
          // Placeholder for the search bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.x4,
                AppSpacing.x4,
                AppSpacing.x4,
                0,
              ),
              child: Container(
                height: 56, // Standard height for a text field
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.x2),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.x4)),
          // Placeholder for the transaction list
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // This Padding mimics the spacing of the real list items
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x4)
                      .copyWith(bottom: AppSpacing.x4),
                  child: TransactionItemWidget(
                    transaction: TransactionItemEntity(
                      id: '1',
                      name: 'Placeholder Transaction',
                      date: 1739259074,
                      merchant: 'Placeholder Merchant',
                      billingAmount: 100.00,
                      image: 'https://via.placeholder.com/150',
                      billingCurrency: 'USD',
                    ),
                  ),
                );
              },
              childCount: 8,
            ),
          ),
        ],
      ),
    );
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
