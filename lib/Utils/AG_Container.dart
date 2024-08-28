import 'package:flutter/material.dart';
import 'package:p1/utils/Image_Urls.dart';

Widget socialMediaContainer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildSocialMediaButton(AppIcons.appleIcon),
      const SizedBox(width: 20),
      _buildSocialMediaButton(AppIcons.googleIcon),
    ],
  );
}

Widget _buildSocialMediaButton(String assetPath) {
  return Container(
    width: 160,
    height: 60,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Image.asset(assetPath),
  );
}
