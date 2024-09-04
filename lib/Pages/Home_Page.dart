import 'package:flutter/material.dart';
import 'package:p1/Pages/Other/Custom_BottomNav.dart';
import 'package:p1/Pages/Other/Custom_TopContainer.dart';
import 'package:p1/Pages/Other/Home_Cards.dart';
import 'package:p1/Pages/Other/Knowmore_Container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            customTopContainer(context),
            const SizedBox(
              height: 400,
              child: CustomCards(),
            ),
            knowmoreContainer(context),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: customFloatingActionButton(context),
      bottomNavigationBar: custombottomNavigationBar(context),
    );
  }
}
