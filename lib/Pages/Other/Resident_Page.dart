import 'package:flutter/material.dart';
import 'package:p1/Utils/Custom_Dailog_Botton.dart';
import 'package:p1/Utils/Gender_Radio.dart';
import 'package:p1/Utils/Single_Radiobutton.dart';
import 'package:p1/Widgets/Custom_Textfield.dart';
import 'package:p1/Widgets/Dailog_Container.dart';
import 'package:p1/Widgets/Image_Urls.dart';
import 'package:p1/Widgets/Title_Text.dart';

class ResidentPage extends StatefulWidget {
  ResidentPage({super.key, required void Function() onNext});

  @override
  State<ResidentPage> createState() => _ResidentPageState();
}

class _ResidentPageState extends State<ResidentPage> {
  String? _selectedGender;
  TextEditingController _dobController = TextEditingController();
  bool isAgreed = false;
  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dobController.text =
            "${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heading(context: context, text: "Choose Profession"),
            customTextField(
              context: context,
              hintText: "Select Emirates",
              assets1: "",
              assets2: AppIcons.dropdownIcon,
              obscureText: false,
            ),
            heading(context: context, text: "Choose Emirates"),
            customTextField(
              context: context,
              hintText: "Select Profession",
              assets1: "",
              assets2: AppIcons.dropdownIcon,
              obscureText: false,
            ),
            heading(context: context, text: "Emirates ID NO."),
            customTextField(
              context: context,
              hintText: "00-0000-0000000-0",
              assets1: "",
              assets2: AppIcons.dropdownIcon,
              obscureText: false,
            ),
            customDialogContainer(
                context: context,
                title: "Upload Emirates ID",
                description:
                    "Upload your scope of work images.\nOr use camera to capture them.",
                imagePath: AppIcons.browseIcon,
                buttonText: "Brows images"),
            heading(context: context, text: "Gender"),
            genderSelection(
              context: context,
              selectedGender: _selectedGender,
              onChanged: (String? value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),
            heading(context: context, text: "Date Of Birth"),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: customTextField(
                  context: context,
                  hintText: "DD/MM/YY",
                  assets1: "",
                  obscureText: false,
                  controller: _dobController,
                ),
              ),
            ),
            agreeToPolicyRadioButton(
              isSelected: isAgreed,
              onChanged: (bool? newValue) {
                setState(() {
                  isAgreed = newValue ?? false;
                });
              },
              context: context,
              text: 'Agree to policy',
              activeColor: Theme.of(context).colorScheme.onBackground,
              textColor: Theme.of(context).colorScheme.onSecondary,
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Almarai',
            ),
            customDialogButton(
              text: 'Submit',
              context: context,
            )
          ],
        ),
      ),
    );
  }
}
