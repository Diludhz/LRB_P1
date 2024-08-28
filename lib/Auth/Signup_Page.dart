import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p1/Widgets/Custom_Button.dart';
import 'package:p1/Widgets/Custom_Textfield.dart';
import 'package:p1/Widgets/Image_Urls.dart';
import 'package:p1/Widgets/Logo_Icon.dart';
import 'package:p1/Widgets/Title_Text.dart';
import 'package:p1/utils/AG_Container.dart';

import 'package:p1/utils/Custom_Dividers.dart';
import 'package:p1/utils/Colors.dart';

import 'package:p1/utils/Not_Member.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _signUp() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Successfully Signed Up!'),
          backgroundColor: AppColors.greentext),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("Create an account",
                    style: GoogleFonts.almarai(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondaryContainer)),
              ),
              const SizedBox(height: 5),
              heading(
                text: "Username",
                context: context,
              ),
              customTextField(
                controller: _usernameController,
                hintText: "Enter name",
                obscureText: false,
                assets1: AppIcons.contactIcon,
                context: context,
              ),
              const SizedBox(height: 5),
              heading(text: "Email", context: context),
              customTextField(
                controller: _emailController,
                hintText: "Enter email",
                obscureText: false,
                assets1: AppIcons.emailIcon,
                context: context,
              ),
              const SizedBox(height: 5),
              heading(text: "Phone", context: context),
              customTextField(
                controller: _phoneController,
                hintText: "+971---",
                obscureText: false,
                assets1: AppIcons.phoneIcon,
                context: context,
              ),
              const SizedBox(height: 5),
              heading(text: "Password", context: context),
              customTextField(
                controller: _passwordController,
                hintText: "Enter password",
                obscureText: true,
                assets1: AppIcons.lockIcon,
                context: context,
                assets2: AppIcons.viewpassIcon,
              ),
              const SizedBox(height: 5),
              eButton(text: "SignIn", onTap: () {}, context: context),
              const SizedBox(height: 5),
              customDivider(),
              const SizedBox(height: 5),
              socialMediaContainer(),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: notaMemberText(
                  text: "Login",
                  context: context,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: floatingActionButton(context),
    );
  }
}
