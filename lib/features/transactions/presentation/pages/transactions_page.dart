import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:pemo_test_project/features/transaction_details/presentation/pages/transaction_details_page.dart';
import 'package:pemo_test_project/features/transactions/domain/entities/transaction_item.dart';
import 'package:pemo_test_project/features/transactions/presentation/cubit/transaction_cubit.dart';
import 'package:pemo_test_project/features/transactions/presentation/cubit/transaction_state.dart';
import 'package:pemo_test_project/features/transactions/presentation/widgets/transaction_item_widget.dart';
import 'package:pemo_test_project/injection_container.dart';

/// A page that displays a list of transactions with advanced UI features.
///
/// This page uses a [TransactionCubit] to fetch and manage the state of the
/// transactions. It includes a search bar, a summary card, and a list of
/// transactions grouped by date with animations.
class TransactionsPage extends StatefulWidget {
  /// Creates a [TransactionsPage].
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  final TextEditingController _searchController = TextEditingController();
  List<TransactionItemEntity> _allTransactions = [];
  List<TransactionItemEntity> _filteredTransactions = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterTransactions);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterTransactions);
    _searchController.dispose();
    super.dispose();
  }

  void _filterTransactions() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredTransactions = _allTransactions.where((transaction) {
        final nameMatch = transaction.name.toLowerCase().contains(query);
        final merchantMatch = transaction.merchant.toLowerCase().contains(
              query,
            );
        return nameMatch || merchantMatch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<TransactionCubit>()..fetchTransactions(),
        child: BlocConsumer<TransactionCubit, TransactionState>(
          listener: (context, state) {
            state.whenOrNull(
              loaded: (transactions) {
                setState(() {
                  _allTransactions = transactions;
                  _filteredTransactions = transactions;
                });
              },
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => _buildLoadingSkeleton(),
              loading: () => _buildLoadingSkeleton(),
              loaded: (transactions) => _buildLoadedContent(context),
              error: (message) => _buildErrorWidget(message, context),
            );
          },
        ),
      ),
    );
  }

  /// Builds the main content view when transactions are loaded.
  Widget _buildLoadedContent(BuildContext context) {
    final groupedTransactions = _groupTransactionsByDate(_filteredTransactions);

    return AppRefreshIndicator(
      onRefresh: () async =>
          context.read<TransactionCubit>().fetchTransactions(),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Transactions'),
            pinned: true,
            elevation: 0,
            floating: true,
          ),
          _buildSummaryCardSliver(),
          _buildSearchBarSliver(),
          if (_filteredTransactions.isEmpty &&
              _searchController.text.isNotEmpty)
            _buildEmptyStateSliver()
          else
            ...groupedTransactions.entries.map((entry) {
              return SliverMainAxisGroup(
                slivers: [
                  _buildDateHeaderSliver(entry.key),
                  _buildTransactionListSliver(entry.value),
                ],
              );
            }),
        ],
      ),
    );
  }

  /// Groups transactions by date for display.
  Map<String, List<TransactionItemEntity>> _groupTransactionsByDate(
    List<TransactionItemEntity> transactions,
  ) {
    final Map<String, List<TransactionItemEntity>> data = {};
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    for (final transaction in transactions) {
      // Assuming the timestamp is in seconds, convert to a local DateTime.
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
      if (data[key] == null) {
        data[key] = [];
      }
      data[key]!.add(transaction);
    }
    return data;
  }

  /// Builds a sliver for the summary card.
  Widget _buildSummaryCardSliver() {
    // Placeholder summary data
    final totalSpent = _allTransactions
        .where((t) => t.billingAmount > 0)
        .fold<double>(0, (sum, t) => sum + t.billingAmount.abs());

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.x4,
          AppSpacing.x4,
          AppSpacing.x4,
          0,
        ),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.x4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.x4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.bodyMedium(
                  'Total Spent This Month',
                  color: AppTheme.of(context).color.secondTextColor,
                ),
                AppSpacing.h2,
                AppText.headingMedium('\$${totalSpent.toStringAsFixed(2)}'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds a sliver for the search bar.
  Widget _buildSearchBarSliver() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.x4),
        child: AppTextField(
          controller: _searchController,
          hint: 'Search transactions...',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  /// Builds a sliver for the date header.
  Widget _buildDateHeaderSliver(String date) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppSpacing.x4,
          right: AppSpacing.x4,
          top: AppSpacing.x2,
          bottom: AppSpacing.x2,
        ),
        child: AppText.bodyLargeStrong(date),
      ),
    );
  }

  /// Builds a sliver list of animated transaction items.
  Widget _buildTransactionListSliver(List<TransactionItemEntity> transactions) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final transaction = transactions[index];
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: TransactionItemWidget(
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
            ),
          );
        },
        childCount: transactions.length,
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

  /// Builds the error widget.
  Widget _buildErrorWidget(String message, BuildContext context) {
    return Center(
      child: AppErrorWidget(
        errorMessage: message,
        onRetryPressed: () =>
            context.read<TransactionCubit>().fetchTransactions(),
      ),
    );
  }

  /// Builds the skeleton loading widget.
  Widget _buildLoadingSkeleton() {
    return SkeletonLoadingWidget(
      enabled: true,
      child: ListView.builder(
        padding: const EdgeInsets.all(AppSpacing.x4),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.x4),
            child: TransactionItemWidget(
              transaction: TransactionItemEntity(
                id: '1',
                name: 'Placeholder Transaction',
                date: 1739259074,
                merchant: 'Placeholder Merchant',
                billingAmount: 100.00,
                image: '',
                billingCurrency: 'USD',
              ),
            ),
          );
        },
      ),
    );
  }
}
