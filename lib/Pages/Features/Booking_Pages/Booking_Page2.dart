import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:p1/Pages/Features/Booking_Pages/Booking_Success.dart';

import 'package:p1/Utils/Colors.dart';
import 'package:p1/Widgets/Image_Urls.dart';

class BookingPage2 extends StatefulWidget {
  const BookingPage2({super.key});

  @override
  State<BookingPage2> createState() => _BookingPage2State();
}

class _BookingPage2State extends State<BookingPage2> {
  String groupValue = 'yes';
  TextEditingController offerController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();

  // Manage a list of selected images
  List<XFile>? _selectedImages = [];

  void onRadioChanged(String? value) {
    setState(() {
      groupValue = value!;
    });
  }

  void _showImageSourceSelection() {
    showModalBottomSheet(
      backgroundColor: AppColors.purewhite,
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Choose an option',
              style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkstheme),
              textAlign: TextAlign.start,
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.darkstheme.withOpacity(0.1),
          ),
          ListTile(
            title: const Text(
              'Gallery',
              style: TextStyle(color: AppColors.darkstheme),
              textAlign: TextAlign.center,
            ),
            onTap: () async {
              Navigator.pop(context);
              await _pickImage(ImageSource.gallery);
            },
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.darkstheme.withOpacity(0.1),
          ),
          ListTile(
            title: const Text(
              'Take a Photo',
              style: TextStyle(color: AppColors.darkstheme),
              textAlign: TextAlign.center,
            ),
            onTap: () async {
              Navigator.pop(context);
              await _pickImage(ImageSource.camera);
            },
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.darkstheme.withOpacity(0.1),
          ),
          ListTile(
            title: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImages?.add(XFile(pickedFile.path));
      });
    } else {
      print('No image selected.');
    }
  }

  OverlayEntry? _overlayEntry;

  OverlayEntry _createOverlayEntry(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height / 2 - 107,
        left: MediaQuery.of(context).size.width / 2 - 178.5,
        child: bookingCard(context),
      ),
    );
  }

  void _showOverlay(BuildContext context) {
    _overlayEntry = _createOverlayEntry(context);
    Overlay.of(context)?.insert(_overlayEntry!);

    Future.delayed(const Duration(seconds: 4), () {
      _overlayEntry?.remove();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const BookingSuccess(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              customAppBar(context),
              const SizedBox(height: 5),
              customStepperRow(context),
              const SizedBox(height: 5),
              suggestOfferContainer(
                context,
                groupValue,
                onRadioChanged,
                offerController,
              ),
              customBookingContainer(
                context: context,
                title: "Upload request images",
                description:
                    "Upload your scope of work images.\nOr use camera to capture them.",
                imagePath: AppIcons.browseIcon,
                buttonText: "Browse images",
                onTap: _showImageSourceSelection,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: _selectedImages != null && _selectedImages!.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _selectedImages!.length,
                        itemBuilder: (context, index) {
                          final image = _selectedImages![index];
                          return Container(
                            margin: EdgeInsets.only(
                                left: index == 0 ? 25.0 : 0.0,
                                right: 8.0,
                                bottom: 130),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: FileImage(File(image.path)),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 8,
                                  left: 8,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.purewhite,
                                    ),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () => _removeImage(index),
                                        child: Image.asset(
                                          AppIcons.binIcons,
                                          fit: BoxFit.cover,
                                          height: 16,
                                          width: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          "No images selected",
                          style: GoogleFonts.almarai(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: GestureDetector(
                  onTap: () => _showOverlay(context),
                  child: Container(
                    height: 56,
                    width: 327,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onBackground,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Find Hands!",
                      style: GoogleFonts.almarai(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages!.removeAt(index);
    });
  }
}

Widget customAppBar(BuildContext context) {
  return Row(
    children: [
      customIconButton(context),
      const SizedBox(width: 15),
      Text(
        "Book Help",
        style: GoogleFonts.almarai(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    ],
  );
}

Widget customIconButton(BuildContext context) {
  return Container(
    height: 40,
    width: 40,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.purewhite,
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 2),
          blurRadius: 1,
          color: AppColors.greylight,
        ),
      ],
    ),
    child: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios, size: 20),
    ),
  );
}

Widget customStepperRow(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildBookingStepper(context, step: 0, label: "Step 1"),
        _buildBookingStepper(context, step: 1, label: "Step 2"),
      ],
    ),
  );
}

Widget _buildBookingStepper(BuildContext context,
    {required int step, required String label}) {
  return GestureDetector(
    onTap: () {},
    child: Column(
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          child: Center(
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Theme.of(context).colorScheme.primary,
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

Widget suggestOfferContainer(
  BuildContext context,
  String groupValue,
  Function(String?) onChanged,
  TextEditingController textEditingController,
) {
  return Container(
    height: groupValue == 'yes' ? 180 : 125,
    width: 327,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 225, 234, 250),
      borderRadius: BorderRadius.circular(8),
      boxShadow: const [
        BoxShadow(
          color: AppColors.greylight,
          blurRadius: 1,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Suggest your offer",
          style: GoogleFonts.almarai(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onError,
          ),
        ),
        Row(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<String>(
                  value: 'yes',
                  groupValue: groupValue,
                  onChanged: onChanged,
                  activeColor: AppColors.darkstheme,
                  fillColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return AppColors.bgcolor;
                      }
                      return const Color.fromARGB(255, 109, 109, 109);
                    },
                  ),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                const Text("Yes"),
              ],
            ),
            const SizedBox(width: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<String>(
                  value: 'no',
                  groupValue: groupValue,
                  onChanged: onChanged,
                  activeColor: AppColors.darkstheme,
                  fillColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return AppColors.darkstheme;
                      }
                      return const Color.fromARGB(255, 101, 100, 100);
                    },
                  ),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                const Text("No"),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        if (groupValue == 'yes') ...[
          Text(
            "Your suggested offer!",
            style: GoogleFonts.almarai(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onError,
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              fillColor: AppColors.purewhite,
              filled: true,
              hintText: "AED 500",
              hintStyle: GoogleFonts.almarai(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ] else ...[
          Text(
            "You enabled open offer",
            style: GoogleFonts.almarai(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onError,
            ),
          ),
        ],
      ],
    ),
  );
}

Widget customBookingContainer(
    {required BuildContext context,
    required String title,
    required String description,
    required String imagePath,
    required String buttonText,
    required void Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 5),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: 116,
        width: 387,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.skyblue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: GoogleFonts.almarai(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkstheme,
                  ),
                ),
                Text(
                  description,
                  style: GoogleFonts.almarai(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkstheme,
                  ),
                ),
              ],
            ),
            Container(
              height: 84,
              width: 84,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.purewhite,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(imagePath),
                  Text(
                    buttonText,
                    style: GoogleFonts.almarai(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkstheme,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget bookingCard(BuildContext context) {
  return Center(
    child: Container(
      padding: const EdgeInsets.all(10),
      height: 214,
      width: 357,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 1,
            color: Colors.grey,
          ),
        ],
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppIcons.logoIcon,
            height: 104,
            width: 104,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            "We are finding the best Hands for your request.\nPlease be patient with us.",
            textAlign: TextAlign.center,
            style: GoogleFonts.almarai(
              fontSize: 15,
              color: Theme.of(context).colorScheme.onSecondary,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    ),
  );
}
