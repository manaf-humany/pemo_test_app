import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pemo_test_component/pemo_test_component.dart';
import 'package:pemo_test_project/features/manage_cards/manage_cards.dart';
import 'package:pemo_test_project/features/transactions/presentation/pages/transactions_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int _activeIndex = 0;
  late final PageController _pageController;

  final _pages = <Widget>[
    const TransactionsPage(),
    const CardsListPage(),
  ];

  final _navItems = <({IconData icon, String label})>[
    (icon: Icons.list_alt_rounded, label: 'Transactions'),
    (icon: Icons.credit_card_rounded, label: 'Cards'),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = AppTheme.of(context);
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _activeIndex = index);
        },
        children: _pages,
      ),
      floatingActionButton: _buildCreateCardFAB(context, theme),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBNB(theme),
    );
  }

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

  FloatingActionButton _buildCreateCardFAB(
    BuildContext context,
    AppTheme theme,
  ) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: AppTheme.of(context).color.greenColor,
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

  @override
  bool get wantKeepAlive => true;
}
