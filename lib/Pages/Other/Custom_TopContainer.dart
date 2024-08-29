import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p1/Utils/Colors.dart';
import 'package:p1/Widgets/Image_Urls.dart';

Widget customTopContainer(BuildContext context) {
  return Container(
    height: 241,
    width: 393,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.background,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      boxShadow: const [
        BoxShadow(offset: Offset(0, 1), color: AppColors.greylight),
      ],
    ),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 1,
                            color: AppColors.darkstheme,
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(AppIcons.profileIcon),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Morning!',
                          style: GoogleFonts.kumbhSans(
                            fontSize: 14,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Hamood Ahmad Hassan',
                          style: GoogleFonts.roboto(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.background,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: AppColors.greylight,
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.notifications_none,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Al Bateen Towers-Hirdiyah St-',
                hintStyle: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                prefixIcon: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(AppIcons.locationIcon),
                  ),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(AppIcons.gpsIcon),
                  ),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.onBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    ),
  );
}
