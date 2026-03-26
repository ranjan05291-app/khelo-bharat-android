import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JoinScreen extends StatelessWidget {
  const JoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070B1F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Join Contest"),
      ),
      body: const Center(
        child: Text("Payment + Join UI Here",
            style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
