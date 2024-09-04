import 'package:flutter/material.dart';
import 'package:p1/Utils/Custom_Dailog_Botton.dart';
import 'package:p1/Utils/Gender_Radio.dart';
import 'package:p1/Widgets/Custom_Textfield.dart';
import 'package:p1/Widgets/Image_Urls.dart';
import 'package:p1/Widgets/Title_Text.dart';

class Step1 extends StatefulWidget {
  const Step1({
    super.key,
    required void Function() onNext,
  });

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  final TextEditingController _dobController = TextEditingController();
  String? _selectedGender;

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
              hintText: "Choose Profession",
              assets1: "",
              obscureText: false,
            ),
            heading(context: context, text: "Choose Nationality"),
            customTextField(
                context: context,
                hintText: "Select Nationality",
                assets1: "",
                assets2: AppIcons.dropdownIcon,
                obscureText: false),
            heading(context: context, text: "Passport Number"),
            customTextField(
                context: context,
                hintText: "Enter the number",
                assets1: "",
                obscureText: false),
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
            customDialogButton(
              text: "Next",
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}
