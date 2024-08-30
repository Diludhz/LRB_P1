import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p1/Pages/Features/Dailog_DataMain.dart';
import 'package:p1/Utils/Colors.dart';

Widget knowmoreContainer(BuildContext context) {
  return Container(
    height: 100,
    width: 375,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      boxShadow: const [
        BoxShadow(
          offset: Offset(0, 1),
          color: AppColors.greylight,
          blurRadius: 1,
        )
      ],
      color: Theme.of(context).colorScheme.background,
    ),
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Start Earning Money by Helping People!",
            textAlign: TextAlign.center,
            style: GoogleFonts.balooBhaina2(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const CustomDialogBox();
                },
              );
            },
            child: Container(
              height: 20,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
              child: Center(
                child: Text(
                  "Know More!",
                  style: GoogleFonts.balooBhaina2(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
