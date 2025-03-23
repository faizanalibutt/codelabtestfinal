import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashboardScreen extends StatelessWidget {
  final Map<String, dynamic> dashboardData;

  const DashboardScreen({super.key, required this.dashboardData});

  @override
  Widget build(BuildContext context) {
    final user = dashboardData['user'];
    final List keyFunctions = dashboardData['keyFunctions'];
    final banner = dashboardData['banner'];

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF02243F), // Blue status bar
        statusBarIconBrightness: Brightness.light, // White icons
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Image and Info
              Stack(
                children: [
                  // Background Image sets the height naturally
                  Image.asset(
                    'assets/images/user_bg.png',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    // Preserves the original image height and ratio
                  ),

                  // Your content over the background
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8), // Optional: for slight rounded corners
                              image: const DecorationImage(
                                image: AssetImage('assets/images/user.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${user['userCode']}", style: const TextStyle(fontSize: 16, color: Colors.white70)),
                                Text("${user['name']}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                                Text("${user['email']}", style: const TextStyle(fontSize: 16, color: Colors.white70)),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      // White Line Divider
                      Container(
                        height: .5,
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      const SizedBox(height: 16),
                      // Company Info
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Company: ',
                                    style: TextStyle(color: Colors.white70, fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: '${user['company'] ?? ''}', // Safely access company name
                                    style: const TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Platform: ',
                                    style: TextStyle(color: Colors.white70, fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: '${user['platform'] ?? ''}', // Safely access company name
                                    style: const TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 0),
                            padding: const EdgeInsets.only(top: 16),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Text("Key Functions", style: TextStyle(fontSize: 20, color: Color(0xFF14151A))),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  height: 200, // Adjust this height based on your rows
                                  child: GridView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      childAspectRatio: 1,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 8,
                                    ),
                                    itemCount: keyFunctions.length,
                                    itemBuilder: (context, index) {
                                      var item = keyFunctions[index];
                                      return Column(
                                        children: [
                                          Image.asset(item['icon'], width: 50, height: 50),
                                          const SizedBox(height: 4),
                                          Text(
                                            item['title'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 12, color: Colors.black45),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Text("Announcment", style: TextStyle(fontSize: 20, color: Color(0xFF14151A))),
                                ),
                                const SizedBox(height: 8),
                                // Banner Section
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 10,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8), // Optional rounded corners
                                        ),
                                        clipBehavior: Clip.hardEdge, // Ensures content respects borderRadius
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            // Background Image clipped properly
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(8),
                                              child: Image.asset(
                                                'assets/images/tell_bg.png', // Background image
                                                width: 100,
                                                height: 200,
                                                fit: BoxFit.cover,
                                              ),
                                            ),

                                            // User Image Centered
                                            Image.asset(
                                              'assets/images/tell.png', // User profile image
                                              width: 60,
                                              height: 60,
                                              fit: BoxFit.cover,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(banner['title'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                            const SizedBox(height: 8),
                                            Text(banner['description'], style: const TextStyle(fontSize: 14, color: Colors.black54)),
                                            const SizedBox(height: 8),
                                            Text("Posted on: ${banner['datePosted']}", style: const TextStyle(color: Colors.grey, fontSize: 12)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Image.asset(
                                  'assets/images/bottom_image.png',
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
