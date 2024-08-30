import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p1/Pages/Features/Dailog_Step1_Page.dart';
import 'package:p1/Pages/Features/Dialog_Step2_Page.dart';
import 'package:p1/utils/Colors.dart';

class NonresidentPage extends StatefulWidget {
  const NonresidentPage({super.key});

  @override
  State<NonresidentPage> createState() => _NonresidentPageState();
}

class _NonresidentPageState extends State<NonresidentPage> {
  int activeStep = 0;

  void _setActiveStep(int step) {
    setState(() {
      activeStep = step;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStep(context, step: 0, label: "Step 1"),
              _buildStep(context, step: 1, label: "Step 2"),
            ],
          ),
        ),
        Expanded(
          child: IndexedStack(
            index: activeStep,
            children: [
              Step1(
                onNext: () {},
              ),
              const Step2()
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStep(BuildContext context,
      {required int step, required String label}) {
    bool isActive = activeStep == step;

    return GestureDetector(
      onTap: () => _setActiveStep(step),
      child: Column(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive
                  ? Theme.of(context).colorScheme.onBackground
                  : AppColors.skyblue,
            ),
            child: Center(
              child: CircleAvatar(
                radius: 15,
                backgroundColor: isActive
                    ? Theme.of(context).colorScheme.primary
                    : AppColors.purewhite,
                child: Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.onBackground,
                  size: 15,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: GoogleFonts.almarai(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
