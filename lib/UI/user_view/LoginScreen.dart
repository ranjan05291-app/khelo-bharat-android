// import 'package:flutter/material.dart';

// import '../dashboard/DashboardPage.dart';
// import '../theams_color/AppColors.dart';
// import 'RegisterScreen.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.color_deep_blue,
//       body: SafeArea(
//         child: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF020024), Color(0xFF090979), Color(0xFF000000)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: Center(
//             child: SingleChildScrollView(
//               child: Container(
//                 padding: const EdgeInsets.all(20),
//                 margin: const EdgeInsets.symmetric(horizontal: 20),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(color: Colors.blueAccent, width: 1.5),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.blueAccent,
//                       blurRadius: 20,
//                       spreadRadius: 1,
//                     ),
//                   ],
//                   gradient: const LinearGradient(
//                     colors: [Color(0xFF0F2027), Color(0xFF203A43)],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     /// 🔥 LOGO ADDED HERE
//                     Center(
//                       child: Image.asset(
//                         "assets/logo.png", // apna logo yaha add karo
//                         height: 100,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Center(
//                       child: Text(
//                         "Login Screen",
//                         style: TextStyle(
//                           fontSize: 24,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 25),

//                     const Text(
//                       "Mobile / Email",
//                       style: TextStyle(color: Colors.white70),
//                     ),
//                     const SizedBox(height: 8),
//                     _buildTextField("Mobile/Email"),

//                     const SizedBox(height: 20),

//                     const Text(
//                       "Password",
//                       style: TextStyle(color: Colors.white70),
//                     ),
//                     const SizedBox(height: 8),
//                     _buildTextField("Password", isPassword: true),

//                     const SizedBox(height: 30),

//                     Center(
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Colors.greenAccent,
//                               blurRadius: 15,
//                               spreadRadius: 1,
//                             ),
//                           ],
//                         ),
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.green,
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 50,
//                               vertical: 14,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const DashboardPage(),
//                               ),
//                             );
//                           },
//                           child: const Text(
//                             "LOGIN",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Center(
//                       child: TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const RegisterScreen(),
//                             ),
//                           );
//                         },
//                         child: const Text(
//                           "Don't have an account? Register",
//                           style: TextStyle(color: Colors.white70),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(String hint, {bool isPassword = false}) {
//     return TextField(
//       obscureText: isPassword,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: const TextStyle(color: Colors.white38),
//         filled: true,
//         fillColor: Colors.black26,
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 12,
//           vertical: 14,
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(color: Colors.blueAccent),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(color: Colors.cyanAccent),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:ipl_app_flutter26/UI/dashboard/DashboardPage.dart';
import 'package:ipl_app_flutter26/res/network_keys.dart';
import 'package:ipl_app_flutter26/utils/routes/routes_name.dart';
import 'package:ipl_app_flutter26/utils/utils.dart';
import 'package:ipl_app_flutter26/view_model/login_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theams_color/AppColors.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  final LoginViewViewModel _viewModel = LoginViewViewModel();

  @override
  void dispose() {
    mobileController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_deep_blue,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF020024), Color(0xFF090979), Color(0xFF000000)],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blueAccent),
                  ),
                  child: Column(
                    children: [
                      Image.asset("assets/logo.png", height: 100),

                      const SizedBox(height: 20),

                      /// Mobile / Email
                      _buildTextField(
                        controller: mobileController,
                        hint: "Mobile/Email",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter mobile or email";
                          }

                          // Email check
                          if (value.contains("@")) {
                            final emailRegex = RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            );
                            if (!emailRegex.hasMatch(value)) {
                              return "Enter valid email";
                            }
                          } else {
                            // Mobile check
                            if (value.length != 10) {
                              return "Enter valid 10-digit mobile";
                            }
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      /// Password
                      _buildTextField(
                        controller: passwordController,
                        hint: "Password",
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter password";
                          }
                          if (value.length < 6) {
                            return "Password must be 6+ chars";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 30),

                      /// LOGIN BUTTON
                      isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: loginApi,
                              child: const Text("LOGIN"),
                            ),

                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text("Register"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38),
        filled: true,
        fillColor: Colors.black26,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void loginApi() async {
    final userId = mobileController.text.trim();
    final password = passwordController.text.trim();

    if (userId.isEmpty || password.isEmpty) {
      Utils.flushBarMessage('Please enter both User Id and Password', context);
      return;
    }

    setState(() => isLoading = true);

    final data = {NetworkKeys.mobile: userId, NetworkKeys.password: password};

    final result = await _viewModel.fetchLoginApi(data);

    setState(() => isLoading = false);

    if (result != null && result.success == true) {
      final prefs = await SharedPreferences.getInstance();

      final user = result.data!.user!;
      final token = result.data!.token!;

      /// ✅ Save Login Status
      await prefs.setBool("isLogin", true);

      /// ✅ Save Token
      await prefs.setString("token", token);

      /// ✅ Save User Data
      await prefs.setInt("user_id", user.id ?? 0);
      await prefs.setString("user_name", user.name ?? "");
      await prefs.setString("user_mobile", user.mobile ?? "");
      await prefs.setString("user_email", user.email ?? "");
      await prefs.setString("referral_code", user.referralCode ?? "");

      /// ✅ Optional fields
      await prefs.setInt("wallet_balance", user.walletBalance ?? 0);
      await prefs.setInt("play_coin", user.playCoin ?? 0);

      await Utils.flushBarMessage('Login successful', context, true);

      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );
      }
    } else {
      Utils.flushBarMessage(
        result?.message!.toString() ?? 'Login failed',
        context,
      );
    }
  }

  void showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
