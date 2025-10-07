import 'package:flutter/material.dart';
import 'package:petcure_delivery_app/core/theme/app_palette.dart';
import 'package:petcure_delivery_app/modules/home_module/widgets/orders_today_widget.dart';
import 'package:petcure_delivery_app/modules/home_module/widgets/profile_widget.dart';
import 'package:petcure_delivery_app/modules/login_module/view/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  static route() => MaterialPageRoute(builder: (context) => HomePage());
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;

  final PageController _pageController = PageController();

  late List<Widget> _appBodies;

  @override
  void initState() {
    _appBodies = [OrdersTodayWidget(), ProfileWidget()];
    super.initState();
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(context, LoginPage.route(), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PetCure'),
        titleTextStyle: const TextStyle(
          color: AppPalette.firstColor,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: AppPalette.secondColor,
          backgroundColor: AppPalette.fourthColor,
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData?>((states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(
                color: AppPalette.fourthColor,
              ); // Icon color for selected item
            }
            return IconThemeData(
              color: AppPalette.firstColor,
            ); // Icon color for unselected items
          }),
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
            if (states.contains(WidgetState.selected)) {
              return TextStyle(
                color: AppPalette.firstColor, // Text color for selected item
                fontWeight: FontWeight.bold,
              );
            }
            return const TextStyle(
              color: AppPalette.firstColor, // Text color for unselected items
              fontWeight: FontWeight.normal,
            );
          }),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          },
          selectedIndex: _currentPageIndex,
          // labelBehavior: ,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.vaccines), label: "Booking"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        children: _appBodies,
      ),
      drawer: Drawer(
        backgroundColor: AppPalette.fourthColor,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppPalette.firstColor),
              child: Text(
                'PetCure',
                style: TextStyle(
                  color: AppPalette.fourthColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: AppPalette.firstColor),
              title: const Text(
                'Log out',
                style: TextStyle(
                  color: AppPalette.firstColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: _logout,
            ),
          ],
        ),
      ),
    );
  }
}
