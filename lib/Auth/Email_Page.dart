import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p1/Pages/Home_Page.dart';
import 'package:p1/Widgets/Custom_Button.dart';
import 'package:p1/Widgets/Custom_Textfield.dart';
import 'package:p1/Widgets/Image_Urls.dart';
import 'package:p1/utils/AG_Container.dart';
import 'package:p1/utils/Custom_Dividers.dart';
import 'package:p1/utils/Colors.dart';
import 'package:p1/utils/Not_Member.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
     
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

     
      if (userCredential.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Logged in successfully!'),
            backgroundColor: AppColors.greentext,
          ),
        );
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomePage()));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed. Incorrect email or password.'),
          backgroundColor: AppColors.greentext,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextField(
                  obscureText: false,
                  assets1: AppIcons.emailIcon,
                  hintText: "Enter email",
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  context: context,
                ),
                const SizedBox(height: 16),
                customTextField(
                  obscureText: true,
                  hintText: "Enter password",
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  assets1: AppIcons.lockIcon,
                  assets2: AppIcons.viewpassIcon,
                  context: context,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: _buildForgotPasswordButton(),
                ),
                const SizedBox(height: 10),
                eButton(
                    text: "Login",
                    onTap: _login, 
                    context: context),
                const SizedBox(height: 10),
                customDivider(),
                const SizedBox(height: 20),
                socialMediaContainer(),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: notaMemberText(
                    text: "Signup",
                    onPressed: () {},
                    context: context,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Forgot Password?',
        style: GoogleFonts.almarai(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColors.greentext),
      ),
    );
  }
}
