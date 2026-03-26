import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ipl_app_flutter26/UI/user_view/ProfileScreen.dart';

import '../theams_color/AppColors.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const ContestScreen(),
    const Center(child: Text("Live Contests", style: TextStyle(color: Colors.white))),
    const Center(child: Text("Wallet", style: TextStyle(color: Colors.white))),
    const ProfileScreen(),
  ];
  String selectedlebel = "All Contests";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_deep_blue,
      appBar: AppBar(
        backgroundColor: AppColors.color_deep_blue_appbar,
        elevation: 0,
        title:  Text(selectedlebel,style: TextStyle(color: Colors.white),),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.color_deep_blue_statusbar, // background color
            statusBarIconBrightness: Brightness.light, // Android icons
            statusBarBrightness: Brightness.dark, // iOS icons
          )
      ),
      body: SafeArea(
        child: screens[currentIndex],
      ),
      bottomNavigationBar: SafeArea(
        child: _bottomNav(),
      ),
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
            if(index==0){
              selectedlebel = "All Contests";
            }
            if(index==1){
              selectedlebel = "Live Contests";
            }
            if(index==2){
              selectedlebel = "Wallet";
            }
            if(index==3){
              selectedlebel = "Profile";
            }
            //selectedlebel="";
          });
        },
        backgroundColor: Colors.transparent,
        selectedItemColor: Color(0xFFF42A49),
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: "Contests",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
class ContestScreen extends StatelessWidget {
  const ContestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1A2A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: [
              _contestCard(
                teamA: "CSK",
                teamB: "RR",
                prize: "₹120",
                fee: "₹50",
                spots: "1 / 2",
                time: "06:43",
                gradient: AppColors.borderGradientContestCSK,
              ),
              _contestCard(
                teamA: "MI",
                teamB: "RCB",
                prize: "₹10 LAKHS",
                fee: "₹100",
                spots: "9100 / 15000",
                time: "2h 15m",
                gradient: AppColors.borderGradientContestMI,
              ),
              _contestCard(
                teamA: "CSK",
                teamB: "RR",
                prize: "₹900",
                fee: "₹500",
                spots: "1 / 2",
                time: "06:43",
                gradient: AppColors.borderGradientContestCSK,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contestCard({
    required String teamA,
    required String teamB,
    required String prize,
    required String fee,
    required String spots,
    required String time,
    required List<Color> gradient,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(2), // Border thickness
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradient),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF13263A),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            /// LEFT SIDE
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TEAM ROW
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: gradient),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _teamCircle(teamA),
                        const SizedBox(width: 6),
                        const Text("VS",
                            style: TextStyle(color: Colors.white)),
                        const SizedBox(width: 6),
                        _teamCircle(teamB),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "$teamA vs $teamB - Match Winner H2H",
                    style: const TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      const Icon(Icons.access_time,
                          size: 14, color: Colors.red),
                      const SizedBox(width: 5),
                      Text("Starts in: $time",
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),

                  const SizedBox(height: 8),

                  /// PROGRESS BAR
                  LinearProgressIndicator(
                    value: 0.5,
                    backgroundColor: Colors.white12,
                    valueColor:
                    AlwaysStoppedAnimation<Color>(gradient.first),
                  ),

                  const SizedBox(height: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Spots Filled: $spots",
                          style:
                          const TextStyle(color: Colors.white60)),
                      const Text("1 Spot Left",
                          style:
                          TextStyle(color: Colors.orangeAccent)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            /// RIGHT SIDE
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text("Total Prize Pool:",
                    style: TextStyle(color: Colors.white60)),
                Text(prize,
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),

                const SizedBox(height: 10),

                Text("Entry Fee: $fee",
                    style: const TextStyle(color: Colors.white)),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "JOIN NOW",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _teamCircle(String team) {
    return CircleAvatar(
      radius: 14,
      backgroundColor: Colors.white,
      child: Text(
        team,
        style: const TextStyle(
            fontSize: 10, color: Colors.black),
      ),
    );
  }

}

