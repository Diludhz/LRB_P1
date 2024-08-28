import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p1/Auth/Email_Page.dart';
import 'package:p1/Auth/Phone_Page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 20),
            child: Text(
              "Welcome",
              style: GoogleFonts.almarai(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27, top: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _onTabSelected(0),
                  child: Column(
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          color: _currentIndex == 0
                              ? Theme.of(context).colorScheme.surface
                              : Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      if (_currentIndex == 0)
                        Container(
                          width: 30,
                          height: 2,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () => _onTabSelected(1),
                  child: Column(
                    children: [
                      Text(
                        'Phone',
                        style: TextStyle(
                          color: _currentIndex == 1
                              ? Theme.of(context).colorScheme.surface
                              : Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      if (_currentIndex == 1)
                        Container(
                          width: 30,
                          height: 2,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: [const EmailPage(), PhonePage()],
            ),
          ),
        ],
      ),
    );
  }
}
