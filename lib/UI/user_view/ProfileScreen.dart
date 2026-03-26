import 'package:flutter/material.dart';
import 'package:ipl_app_flutter26/UI/user_view/LoginScreen.dart';
// import 'login_page.dart'; // apna login page import karo

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String userName = "Ranjan Kumar";
  String email = "ranjan@email.com";
  int walletBalance = 1250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1A2A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// PROFILE HEADER
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF13263A),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/profile.png"),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            email,
                            style: const TextStyle(color: Colors.white60),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// WALLET CARD
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFA726), Color(0xFFFF7043)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF13263A),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Wallet Balance",
                              style: TextStyle(color: Colors.white60)),
                          const SizedBox(height: 5),
                          Text("₹$walletBalance",
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          _addBalance();
                        },
                        child: const Text("Add Balance"),
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// SETTINGS LIST
              Expanded(
                child: ListView(
                  children: [
                    _menuItem(Icons.person, "Edit Profile"),
                    _menuItem(Icons.history, "My Contests"),
                    _menuItem(Icons.account_balance_wallet, "Transaction History"),
                    _menuItem(Icons.settings, "Settings"),
                    _menuItem(Icons.help, "Help & Support"),
                    _menuItem(Icons.logout, "Logout", isLogout: true),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// ADD BALANCE FUNCTION (Demo)
  void _addBalance() {
    setState(() {
      walletBalance += 100;
    });
  }

  /// MENU ITEM
  Widget _menuItem(IconData icon, String title, {bool isLogout = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isLogout
              ? [Colors.red, Colors.deepOrange]
              : [Color(0xFF00C6FF), Color(0xFF0072FF)],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          if (isLogout) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false,
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("$title Clicked")),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFF13263A),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Row(
            children: [
              Icon(icon, color: isLogout ? Colors.red : Colors.white),
              const SizedBox(width: 12),
              Expanded(
                child: Text(title,
                    style: TextStyle(
                        color: isLogout ? Colors.red : Colors.white)),
              ),
              const Icon(Icons.arrow_forward_ios,
                  size: 14, color: Colors.white54)
            ],
          ),
        ),
      ),
    );
  }
}
