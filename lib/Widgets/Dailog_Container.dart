import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p1/Utils/Colors.dart';

Widget customDialogContainer({
  required BuildContext context,
  required String title,
  required String description,
  required String imagePath,
  required String buttonText,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
    child: Container(
      height: 100,
      width: 387,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.purewhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: GoogleFonts.almarai(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkstheme,
                ),
              ),
              Text(
                description,
                style: GoogleFonts.almarai(
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkstheme,
                ),
              ),
            ],
          ),
          Container(
            height: 68,
            width: 79,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.skyblue.withOpacity(0.5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imagePath),
                Text(
                  buttonText,
                  style: GoogleFonts.almarai(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkstheme,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
