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

class _HomePageState extends State<HomePage> {
  int _activeIndex = 0;
  late final PageController _pageController;

  final _pages = <Widget>[
    const TransactionsPage(),
    const CreateCardPage(),
    const CardsListPage(),
  ];

  final _navIcons = <IconData>[
    Icons.list_alt_rounded,
    Icons.add_card_rounded,
    Icons.credit_card_rounded,
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
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _activeIndex = index);
        },
        children: _pages,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: _navIcons,
        activeIndex: _activeIndex,
        gapLocation: GapLocation.none,
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
        activeColor: AppTheme.of(context).color.primaryColor,
        inactiveColor: AppTheme.of(context).color.borderColor,
        backgroundColor: AppTheme.of(context).color.surfaceColor,
      ),
    );
  }
}
