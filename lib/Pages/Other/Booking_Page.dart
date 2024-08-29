import 'package:flutter/material.dart';
import 'package:p1/Pages/Other/Custom_BottomNav.dart';
import 'package:p1/Pages/Other/Custom_TopEarnerMonth.dart';
import 'package:p1/Pages/Other/Custom_TopEarnerWeek.dart';
import 'package:p1/Pages/Other/Custombooking_Container.dart';
import 'package:p1/Pages/Other/Total_Rev_Graph.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(children: [
          custombookingContainer(context),
          customTopearnerWeek(context),
          customTopearnerMonth(context),
          TotalRevenueWidget()
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: customfloatingActionButton(context),
      bottomNavigationBar: custombottomNavigationBar(context),
    );
  }
}
