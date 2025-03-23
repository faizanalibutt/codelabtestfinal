import 'package:codelabtestfinal/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  final Map<String, dynamic> userData;
  const OTPVerificationScreen({super.key, required this.userData});

  @override
  OTPVerificationScreenState createState() => OTPVerificationScreenState();
}

class OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final Map<String, dynamic> dashboardData = {
    "user": {
      "userCode": "U12345",
      "name": "Faizan Ali",
      "email": "faizan.ali@example.com",
      "company": "Tech Innovations Ltd.",
      "platform": "Mobile App",
      "profileImage": "assets/images/user.png"
    },
    "keyFunctions": [
      {"title": "Request", "icon": "assets/images/icon1.png"},
      {"title": "Complain", "icon": "assets/images/icon2.png"},
      {"title": "Salary Slip", "icon": "assets/images/icon3.png"},
      {"title": "Chat", "icon": "assets/images/icon4.png"},
      {"title": "Loan Balance", "icon": "assets/images/icon5.png"},
      {"title": "Asset Acceptance", "icon": "assets/images/icon6.png"},
      {"title": "Update Information", "icon": "assets/images/icon7.png"},
      {"title": "Emergency Contact", "icon": "assets/images/icon8.png"},
    ],
    "banner": {
      "image": "assets/images/banner.png",
      "title": "Special Announcement",
      "description": "We are launching a new feature next week. Stay tuned!",
      "datePosted": "23/03/2025"
    },
    "bottomImage": "assets/images/bottom_image.png"
  };

  final TextEditingController otpController = TextEditingController();
  bool isError = false;
  bool isValid = true;
  String errorMessage = "";

  void verifyOTP() {
    if (otpController.text == widget.userData['otp'].toString()) {
      setState(() {
        isError = false;
        isValid = true;
        errorMessage = '';
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(dashboardData: dashboardData),
        ),
      );
    } else {
      setState(() {
        isError = true;
        isValid = false;
        errorMessage = 'Please enter correct otp code';
      });
    }
  }

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
                                  Positioned(
                                    left: 24,
                                    right: 24,
                                    top: 24,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Just one more step',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          "We’ve sent a code to your number ${widget.userData['mobile'] ?? ''}",
                                          style: const TextStyle(fontSize: 12, color: Color(0xFFE1E5E8)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 0),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Please check your inbox and insert the code below to sign in.',
                                            style: TextStyle(fontSize: 13, color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 36),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // PIN Code Field
                                    Visibility(
                                      visible: false,
                                      child: PinCodeTextField(
                                        appContext: context,
                                        length: 4,
                                        keyboardType: TextInputType.number,
                                        animationType: AnimationType.fade,
                                        pinTheme: PinTheme(
                                          shape: PinCodeFieldShape.box,
                                          borderRadius: BorderRadius.circular(4),
                                          fieldHeight: 40, // Smaller height
                                          fieldWidth: 40, // Smaller width for 6 digits
                                          activeColor: const Color(0xFF02243F),
                                          inactiveColor: Colors.grey,
                                          selectedColor: Colors.black,
                                          activeFillColor: Colors.white,
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            isError = false;
                                            isValid = true;
                                            errorMessage = '';
                                          });
                                        },
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Spacing adjustment
                                      ),
                                    ),
                                    PinCodeTextField(
                                      length: 6,
                                      obscureText: false,
                                      animationType: AnimationType.fade,
                                      pinTheme: PinTheme(
                                        shape: PinCodeFieldShape.box,
                                        borderRadius: BorderRadius.circular(5),
                                        fieldHeight: 50,
                                        fieldWidth: 40,
                                        activeFillColor: Colors.white,
                                        activeColor: const Color(0xFF02243F),
                                        inactiveColor: Colors.grey,
                                        selectedColor: Colors.black,
                                      ),
                                      animationDuration: const Duration(milliseconds: 300),
                                      enableActiveFill: true,
                                      controller: otpController,
                                      onCompleted: (v) {},
                                      onChanged: (value) {
                                        setState(() {
                                          isError = false;
                                          isValid = true;
                                          errorMessage = '';
                                        });
                                      },
                                      beforeTextPaste: (text) {
                                        return true;
                                      },
                                      appContext: context,
                                    ),
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
                                        onPressed: verifyOTP,
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
