import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p1/Pages/Features/Profile_Pages/Profile_Page.dart';
import 'package:p1/Pages/Other/Booking_Page.dart';


import 'package:p1/Utils/Colors.dart';
import 'package:p1/Widgets/Image_Urls.dart';

Widget customFloatingActionButton(BuildContext context) {
  return Container(
    height: 90,
    width: 90,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      boxShadow: [
        BoxShadow(
          color: AppColors.greylight,
          offset: Offset(0, 2),
          blurRadius: 4,
        ),
      ],
    ),
    child: FloatingActionButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BookingPage()));
      },
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: const CircleBorder(),
      child: ClipOval(
        child: Image.asset(
          AppIcons.logoIcon,
          fit: BoxFit.cover,
          width: 190,
          height: 190,
        ),
      ),
    ),
  );
}


Widget custombottomNavigationBar(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: AppColors.greylight,
          offset: Offset(-2, 0),
          blurRadius: 4,
        ),
      ],
    ),
    child: BottomAppBar(
      color: Theme.of(context).colorScheme.background,
      child: Container(
        height: 41,
        child: Padding(
          padding: const EdgeInsets.only(left: 53, right: 53),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              customnavBarItem(context, Icons.home_filled, 'Home'),
              customnavBarItem(context, Icons.person_2_outlined, 'Profile'),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget customnavBarItem(BuildContext context, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      FaIcon(
        icon,
        size: 24,
        color: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
        },
        child: Text(
          label,
          style: GoogleFonts.almarai(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
      ),
    ],
  );
}
