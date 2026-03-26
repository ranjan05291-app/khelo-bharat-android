import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070B1F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔙 Header
              Row(
                children: const [
                  Icon(Icons.arrow_back, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "My Wallet",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),

              const SizedBox(height: 20),

              // 💰 Balance Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFF6A3D),
                      Color(0xFF8E44AD),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: const [
                    Text("Total Balance",
                        style: TextStyle(color: Colors.white70)),
                    SizedBox(height: 10),
                    Text("₹0.00",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 15),

                    // 🎮 Coins
                    Chip(
                      backgroundColor: Colors.white24,
                      label: Text("🪙 Play Coins: 0",
                          style: TextStyle(color: Colors.white)),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ⚡ Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _actionBox(
                    color: Colors.green,
                    icon: Icons.account_balance_wallet,
                    title: "Add Money",
                  ),
                  _actionBox(
                    color: Colors.blue,
                    icon: Icons.currency_exchange,
                    title: "Withdraw",
                  ),
                  _actionBox(
                    color: Colors.deepPurple,
                    icon: Icons.receipt_long,
                    title: "History",
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const Text(
                "Recent Transactions",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              // 📄 Transactions
              _transactionTile(
                icon: Icons.call_made,
                title: "Withdrawal",
                subtitle: "Withdrawal approved - upi: ranjan05291@ybl",
                date: "26 Mar, 06:11 AM",
                amount: "-₹100.00",
                isDebit: true,
              ),

              _transactionTile(
                icon: Icons.call_received,
                title: "Deposit",
                subtitle: "Deposit approved - UTR:",
                date: "25 Mar, 03:41 AM",
                amount: "+₹100.00",
                isDebit: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔘 Action Box
  Widget _actionBox({
    required Color color,
    required IconData icon,
    required String title,
  }) {
    return Container(
      width: 105,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 8),
          Text(title,
              style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  // 📑 Transaction Tile
  Widget _transactionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required String date,
    required String amount,
    required bool isDebit,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFF12172E),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white10,
            child: Icon(icon,
                color: isDebit ? Colors.red : Colors.green),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 4),
                Text(date,
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 11)),
              ],
            ),
          ),

          Text(
            amount,
            style: TextStyle(
              color: isDebit ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
