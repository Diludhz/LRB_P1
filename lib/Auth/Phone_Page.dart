import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p1/Widgets/Custom_Textfield.dart';
import 'package:p1/utils/AG_Container.dart';
import 'package:p1/utils/Custom_Dividers.dart';
import 'package:p1/utils/Image_Urls.dart';
import 'package:p1/utils/Not_Member.dart';

import 'package:p1/utils/Colors.dart';

import 'package:pinput/pinput.dart';

class PhonePage extends StatefulWidget {
  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool showOTPBoxes = false; // Track whether OTP boxes should be shown

  void _sendOTP() {
    // Simulate sending OTP and show the OTP boxes
    setState(() {
      showOTPBoxes = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('OTP sent to your phone.',
            style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        backgroundColor: AppColors.greentext,
      ),
    );
  }

  void _verifyOTP() {
    // Simulate OTP verification
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Phone number verified and signed in successfully!',
            style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        backgroundColor: AppColors.greentext,
      ),
    );

    // Navigate to another screen if needed
    // Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              customTextField(
                controller: _phoneController,
                hintText: "+971--",
                keyboardType: TextInputType.number,
                obscureText: false,
                assets1: AppIcons.emailIcon,
                context: context,
              ),

              const SizedBox(height: 16.0),

              // Conditionally display the OTP text and TextFields after the button
              if (showOTPBoxes) ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "OTP",
                    style: GoogleFonts.almarai(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Pinput(
                    controller: _otpController,
                    length: 6,
                    showCursor: true,
                    animationCurve: Curves.bounceOut,
                    onChanged: (value) {
                      // Handle OTP input changes
                    },
                    onCompleted: (pin) {
                      _verifyOTP();
                    },
                    defaultPinTheme: PinTheme(
                      height: 48,
                      width: 40,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: AppColors.purewhite,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.purewhite,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.darkstheme),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
              ],

              Container(
                margin: const EdgeInsets.all(10),
                width: 379,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.onSecondaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _sendOTP,
                  child: Text(
                    "Send OTP",
                    style: GoogleFonts.almarai(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ),

              const SizedBox(height: 15),
              customDivider(),
              const SizedBox(height: 15),
              socialMediaContainer(),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: notaMemberText(
                  text: "Signup now",
                  context: context,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
