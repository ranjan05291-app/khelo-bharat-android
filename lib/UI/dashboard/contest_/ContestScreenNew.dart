import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;

  final List<String> tabs = ["All", "Upcoming", "Live", "Completed"];

  final List<Map<String, dynamic>> contests = [
    {
      "teamA": "CSK",
      "teamB": "RR",
      "type": "Upcoming",
      "prize": 100,
      "entry": 82,
      "spots": "2/2",
      "status": "Full"
    },
    {
      "teamA": "CSK",
      "teamB": "RR",
      "type": "Upcoming",
      "prize": 100,
      "entry": 50,
      "spots": "1/2",
      "status": "Open"
    },
    {
      "teamA": "MI",
      "teamB": "RCB",
      "type": "Live",
      "prize": 200,
      "entry": 100,
      "spots": "1/2",
      "status": "Open"
    },
    {
      "teamA": "KKR",
      "teamB": "DC",
      "type": "Completed",
      "prize": 300,
      "entry": 150,
      "spots": "2/2",
      "status": "Closed"
    },
  ];

  List<Map<String, dynamic>> getFiltered() {
    if (selectedTab == 0) return contests;
    return contests.where((e) => e["type"] == tabs[selectedTab]).toList();
  }

  @override
  Widget build(BuildContext context) {
    final data = getFiltered();

    return Scaffold(
      backgroundColor: const Color(0xFF0B1023),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Hey, Ranjan 👋",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text("Ready to win today?",
                          style: TextStyle(color: Colors.white54))
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Column(
                      children: [
                        Text("💰 Wallet",
                            style:
                            TextStyle(color: Colors.white54, fontSize: 12)),
                        Text("₹0.00",
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),

              /// BANNER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xFFFF6A3D), Color(0xFF7B3FF2)]),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("🏆 IPL 2026 Mega Contest",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text("Win big with every match. Join now!",
                            style: TextStyle(color: Colors.white70))
                      ],
                    ),
                    Icon(Icons.sports_cricket,
                        color: Colors.white, size: 30)
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// TABS
              Row(
                children: List.generate(tabs.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedTab == index
                            ? Colors.orange
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white24),
                      ),
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          color: selectedTab == index
                              ? Colors.white
                              : Colors.white54,
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              /// LIST
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF141A33),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          /// TYPE
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(item["type"],
                                style: const TextStyle(color: Colors.blue)),
                          ),

                          const SizedBox(height: 10),

                          /// TEAM
                          Row(
                            children: [
                              _teamBox(item["teamA"], Colors.orange),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text("VS",
                                    style: TextStyle(color: Colors.white54)),
                              ),
                              _teamBox(item["teamB"], Colors.purple),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text("Prize Pool",
                                      style: TextStyle(color: Colors.white54)),
                                  Text("₹${item["prize"]}",
                                      style: const TextStyle(
                                          color: Colors.amber,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),

                          const SizedBox(height: 10),

                          /// ENTRY
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Starts in Started",
                                  style: TextStyle(color: Colors.white38)),
                              Text("Entry: ₹${item["entry"]}",
                                  style:
                                  const TextStyle(color: Colors.white70))
                            ],
                          ),

                          const SizedBox(height: 10),

                          /// PROGRESS
                          LinearProgressIndicator(
                            value: item["spots"] == "2/2" ? 1 : 0.5,
                            backgroundColor: Colors.white12,
                            color: Colors.red,
                          ),

                          const SizedBox(height: 5),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(item["spots"],
                                  style:
                                  const TextStyle(color: Colors.white54)),
                              Text(item["status"],
                                  style: const TextStyle(color: Colors.red))
                            ],
                          ),

                          const SizedBox(height: 10),

                          /// BUTTON
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: item["status"] == "Full"
                                  ? Colors.grey
                                  : Colors.orange,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              item["status"] == "Full"
                                  ? "Joining Closed"
                                  : "Join Now",
                              style: const TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _teamBox(String name, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10)),
      child: Text(name,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}
