import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ipl_app_flutter26/UI/dashboard/contest_/ContestScreenNew.dart';
import 'package:ipl_app_flutter26/UI/user_view/ProfileScreen.dart';
import 'package:ipl_app_flutter26/UI/wallet_/WalletScreen.dart';

import '../theams_color/AppColors.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const Center(
      child: Text("Live Contests", style: TextStyle(color: Colors.white)),
    ),
    const WalletScreen(), //this is demo purpose only..
    const ProfileScreen(),
  ];
  String selectedlebel = "All Contests";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_deep_blue,
      /*appBar: AppBar(
        backgroundColor: AppColors.color_deep_blue_appbar,
        elevation: 0,
        title: Text(selectedlebel, style: TextStyle(color: Colors.white)),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor:
              AppColors.color_deep_blue_statusbar, // background color
          statusBarIconBrightness: Brightness.light, // Android icons
          statusBarBrightness: Brightness.dark, // iOS icons
        ),
      ),*/
      body: SafeArea(child: screens[currentIndex]),
      bottomNavigationBar: SafeArea(child: _bottomNav()),
    );
  }

  Widget _bottomNav() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.color_deep_blue_appbar,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
           /* if (index == 0) {
              selectedlebel = "All Contests";
            }
            if (index == 1) {
              selectedlebel = "Live Contests";
            }
            if (index == 2) {
              selectedlebel = "Wallet";
            }
            if (index == 3) {
              selectedlebel = "Profile";
            }*/
            //selectedlebel="";
          });
        },
        backgroundColor: Colors.transparent,
        selectedItemColor: Color(0xFFF42A49),
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: "Contests",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: "Wallet",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}


