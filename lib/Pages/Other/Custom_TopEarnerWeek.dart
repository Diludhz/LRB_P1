import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p1/Utils/Colors.dart';
import 'package:p1/Widgets/Image_Urls.dart';

Widget customTopearnerWeek(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Container(
      height: 175,
      width: 371,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 1,
            color: AppColors.greylight,
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Image.asset(
            AppIcons.logoIcon,
            height: 80,
            width: 80,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Top Earner of Week!",
                  style: GoogleFonts.almarai(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          iconsText(Icons.waving_hand, Colors.yellow, "Luffy"),
                          iconsText(Icons.waving_hand, Colors.yellow, "Nami"),
                          iconsText(Icons.waving_hand, Colors.yellow, "Shanks"),
                        ],
                      ),
                      const SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          iconsText(Icons.waving_hand, Colors.yellow, "Zoro"),
                          iconsText(
                              Icons.waving_hand, Colors.yellow, "Chopper"),
                          iconsText(Icons.waving_hand, Colors.yellow, "Brooks"),
                        ],
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
  );
}

Widget iconsText(IconData icon, Color iconColor, String name) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, color: iconColor, size: 30),
      const SizedBox(width: 5),
      Text(
        name,
        style: GoogleFonts.almarai(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}
