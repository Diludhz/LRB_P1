import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p1/utils/Colors.dart';
import 'package:p1/utils/Logo_Icon.dart';

import 'package:p1/Pages/Other/Login_Page.dart';
import 'package:p1/Auth/Signup_Page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(
                margin: const EdgeInsets.all(22),
                height: 56,
                width: 386,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 1,
                      blurStyle: BlurStyle.outer,
                      color: AppColors.greylight,
                      spreadRadius: 1,
                    )
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(125)),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: TabBar(
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: const EdgeInsets.only(
                    top: 8,
                    left: 4,
                    right: 4,
                    bottom: 8,
                  ),
                  indicatorColor: Colors.transparent,
                  controller: _tabController,
                  labelColor: Theme.of(context).colorScheme.secondary,
                  unselectedLabelColor: const Color.fromARGB(255, 75, 87, 135),
                  indicator: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('Login',
                            style: GoogleFonts.almarai(
                                fontSize: 17, fontWeight: FontWeight.w700)),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('Sign Up',
                            style: GoogleFonts.almarai(
                                fontSize: 17, fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [LoginPage(), SignupPage()],
              ),
            ),
          ],
        ),
        floatingActionButton: floatingActionButton(context));
  }
}
