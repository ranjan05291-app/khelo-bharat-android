import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class JoinContestScreen extends StatefulWidget {
  const JoinContestScreen({super.key});

  @override
  State<JoinContestScreen> createState() => _JoinContestScreenState();
}

class _JoinContestScreenState extends State<JoinContestScreen> {
  String selectedTeam = "";
  File? screenshot;

  Future<void> pickImage() async {
    final picked =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        screenshot = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020B2C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Join Contest"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔥 Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color(0xFF0F1C5C), Color(0xFF050B2C)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 15,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text("Contest Description",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),

                  const SizedBox(height: 8),

                  const Text(
                    "Who will win the match?",
                    style: TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 15),

                  const Text("CSK vs RR",
                      style:
                      TextStyle(color: Colors.white, fontSize: 18)),

                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Join Fee: ₹50",
                          style: TextStyle(color: Colors.white)),
                      Text("Win: ₹120",
                          style: TextStyle(color: Colors.greenAccent)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 💳 QR Payment
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF0A1545),
              ),
              child: Column(
                children: [
                  const Text("Make Payment",
                      style: TextStyle(color: Colors.white)),

                  const SizedBox(height: 10),

                  // 👉 QR Image (server se ayega)
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(child: Text("QR")),
                  ),

                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: pickImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: const Text("Upload Screenshot"),
                  ),

                  if (screenshot != null) ...[
                    const SizedBox(height: 10),
                    Image.file(screenshot!, height: 100),
                  ]
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🎯 Team Select
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF0A1545),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text("Select Team",
                      style: TextStyle(color: Colors.white)),

                  RadioListTile(
                    value: "A",
                    groupValue: selectedTeam,
                    onChanged: (val) {
                      setState(() {
                        selectedTeam = val!;
                      });
                    },
                    title: const Text("Team A",
                        style: TextStyle(color: Colors.white)),
                  ),

                  RadioListTile(
                    value: "B",
                    groupValue: selectedTeam,
                    onChanged: (val) {
                      setState(() {
                        selectedTeam = val!;
                      });
                    },
                    title: const Text("Team B",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 🚀 Join Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (screenshot == null || selectedTeam.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Complete all fields")),
                    );
                  } else {
                    // 👉 API call yaha hoga
                    print("Joined Successfully");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text("Join Now",
                    style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
