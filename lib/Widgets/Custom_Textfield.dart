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
  String Function(String?)? validator,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.greylight,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        controller: controller,
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
        decoration: InputDecoration(
          fillColor: AppColors.purewhite,
          filled: true,
          hintText: hintText,
          hintStyle: GoogleFonts.almarai(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.greylight,
          ),
          prefixIcon: assets1.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    assets1,
                    width: 24,
                    height: 24,
                    color: AppColors.greylight,
                  ),
                )
              : null,
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
            borderSide: BorderSide.none,
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    ),
  );
}
