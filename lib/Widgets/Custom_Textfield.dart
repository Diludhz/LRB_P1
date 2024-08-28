import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p1/utils/Colors.dart';

Widget customTextField({
  required BuildContext context,
  required String hintText,
  required String assets1,
  required bool obscureText,
  TextEditingController? controller,
  TextInputType keyboardType = TextInputType.text,
  String? assets2,
  String? Function(String?)? validator, // Added validator parameter
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      controller: controller,
      validator: validator, // Assign the validator function
      decoration: InputDecoration(
        fillColor: AppColors.purewhite,
        filled: true,
        hintText: hintText,
        hintStyle: GoogleFonts.almarai(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            assets1,
            width: 24,
            height: 24,
            color: AppColors.greylight,
          ),
        ),
        suffixIcon: assets2 != null
            ? Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Image.asset(
                  assets2,
                  width: 24,
                  height: 24,
                  color: AppColors.greylight,
                ),
              )
            : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    ),
  );
}
