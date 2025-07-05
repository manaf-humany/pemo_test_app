import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:pemo_test_project/features/manage_cards/manage_cards.dart';
import 'package:pemo_test_project/features/transactions/presentation/pages/transactions_page.dart';
import 'package:pemo_test_project/injection_container.dart';

/// HomePage is the main screen of the application.
/// It uses a [PageView] to display [TransactionsPage] and [CardsListPage] pages and an
/// [AnimatedBottomNavigationBar] for navigation.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// The index of the currently active page.
  int _activeIndex = 0;

  /// Controller for the [PageView].
  late final PageController _pageController;

  /// List of pages to be displayed in the [PageView].
  final _pages = <Widget>[
    const TransactionsPage(),
    const CardsListPage(),
  ];

  /// List of navigation items for the [AnimatedBottomNavigationBar].
  /// Each item is a record containing an [IconData] and a [String] label.
  final _navItems = <({IconData icon, String label})>[
    (icon: Icons.list_alt_rounded, label: 'Transactions'),
    (icon: Icons.credit_card_rounded, label: 'Cards'),
  ];

  @override
  void initState() {
    super.initState();
    // Initialize the PageController.
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
    // Dispose the PageController when the widget is disposed.
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.color.greyScaffoldBGColor,
      body: BlocProvider(
        // Provided here since we need it in the CardsListPage and CreateCardPage
        create: (context) => sl<CardsListCubit>()..loadCards(),
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _activeIndex = index);
          },
          children: _pages,
        ),
      ),
      floatingActionButton: _buildCreateCardFAB(context, theme),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBNB(theme),
    );
  }

  /// Builds the [AnimatedBottomNavigationBar].
  AnimatedBottomNavigationBar _buildBNB(AppTheme theme) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: _navItems.length,
      tabBuilder: (int index, bool isActive) {
        final item = _navItems[index];
        final color =
            isActive ? theme.color.primaryColor : theme.color.borderColor;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSpacing.x1,
          children: [
            Icon(
              item.icon,
              size: AppSpacing.x6,
              color: color,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x2),
              child: AppText.bodySmall(
                item.label,
                color: color,
                maxLines: 1,
              ),
            ),
          ],
        );
      },
      activeIndex: _activeIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: AppRadius.x4,
      rightCornerRadius: AppRadius.x4,
      onTap: (index) {
        setState(() => _activeIndex = index);
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      },
      backgroundColor: theme.color.surfaceColor,
      shadow: BoxShadow(
        color: theme.color.borderColor.withValues(alpha: .3),
        spreadRadius: 2,
        blurRadius: 8,
      ),
    );
  }

  /// Builds the FloatingActionButton for creating a new card.
  FloatingActionButton _buildCreateCardFAB(
    BuildContext context,
    AppTheme theme,
  ) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor:
          AppTheme.of(context).color.primaryColor.withValues(alpha: .5),
      child: Icon(
        Icons.add_card_rounded,
        color: theme.color.surfaceColor,
      ),
      onPressed: () {
        // Navigate to CreateCardPage. Consider using a router if you have one.
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const CreateCardPage()),
        );
      },
    );
  }
}
