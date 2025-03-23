import 'package:codelabtestfinal/otp_verification_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileController = TextEditingController();
  bool isError = false;
  bool isValid = false;
  String errorMessage = "";

  void validateMobile() {
    String inputNumber = _mobileController.text.trim();

    if (inputNumber.length != 11) {
      setState(() {
        isError = true;
        errorMessage = 'Mobile number must be 11 digits';
      });
      return;
    }

    // Validate if the input matches any user in the dummy JSON
    final user = dummyUsers.firstWhere(
      (user) => user['mobile'] == inputNumber,
      orElse: () => {},
    );

    if (user.isNotEmpty) {
      setState(() {
        isError = false;
        errorMessage = '';
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OTPVerificationScreen(userData: user),
        ),
      );
    } else {
      setState(() {
        isError = true;
        errorMessage = 'Please enter a valid mobile number saved in our records';
      });
    }
  }

  void _validateInput(String value) {
    setState(() {
      if (value.trim().length == 11) {
        isError = false;
        isValid = true;
      } else {
        isError = true;
        isValid = false;
        errorMessage = "Please enter correct number";
      }
    });
  }

  // Dummy JSON data
  final List<Map<String, dynamic>> dummyUsers = [
    {"id": 1, "name": "Faizan", "mobile": "03217996173", "otp": "123456"},
    {"id": 2, "name": "Ali", "mobile": "03134714008", "otp": "654321"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6DAED),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/login_bg.png',
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/login_bottom_image.png',
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 180),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: double.infinity,
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFE8EBF6),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 8,
                          color: const Color(0xFFE8EBF6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    'assets/images/login_card_image.png',
                                    width: double.infinity,
                                    height: 180,
                                    fit: BoxFit.fill,
                                  ),
                                  const Positioned(
                                    left: 24,
                                    right: 24,
                                    top: 24,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Login your account',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Please use your employee id provided by your organization to log in.',
                                          style: TextStyle(fontSize: 12, color: Color(0xFFE1E5E8)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                                      child: Text.rich(
                                        TextSpan(
                                          text: 'Employee ID',
                                          style: TextStyle(fontSize: 13, color: Colors.black),
                                          children: [
                                            TextSpan(
                                              text: ' *',
                                              style: TextStyle(color: Colors.red),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 36),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      onChanged: _validateInput,
                                      controller: _mobileController,
                                      keyboardType: TextInputType.text,
                                      style: const TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                        hintText: '09007860123',
                                        hintStyle: const TextStyle(
                                          color: Color(0x14151A0D),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white24,
                                        isDense: true,
                                        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color: isError ? Colors.red : const Color(0x14151A0D),
                                            width: 1,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color: isError ? Colors.red : const Color(0x14151A0D),
                                            width: 1,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color: isError ? Colors.red : const Color(0x14151A0D),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    if (isError)
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Icons.error_outline, color: Colors.red, size: 18),
                                              const SizedBox(width: 6),
                                              Expanded(
                                                child: Text(
                                                  errorMessage,
                                                  style: const TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                        ],
                                      ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 40,
                                      child: ElevatedButton.icon(
                                        onPressed: validateMobile,
                                        icon: Icon(
                                          Icons.login,
                                          color: isValid ? Colors.white : Colors.grey[500],
                                          size: 18,
                                        ),
                                        label: Text(
                                          'Login',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: isValid ? Colors.white : Colors.grey[500],
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: isValid ? const Color(0xFF02243F) : const Color(0xFFD1D5E6),
                                          padding: const EdgeInsets.symmetric(horizontal: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
