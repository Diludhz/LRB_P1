import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';
import 'package:p1/Pages/Features/Booking_Pages/Booking_Page2.dart';
import 'package:p1/Utils/Colors.dart';
import 'package:p1/Widgets/Image_Urls.dart';

class BookingPage1 extends StatefulWidget {
  const BookingPage1({super.key});

  @override
  State<BookingPage1> createState() => _BookingPage1State();
}

class _BookingPage1State extends State<BookingPage1> {
  final TextEditingController _dateController = TextEditingController();
  String _groupValue = 'no'; // Default value
  int _memberCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                customAppBar(context),
                customStepperRow(context),
                const SizedBox(height: 5),
                customCategoryField(context),
                const SizedBox(height: 5),
                customTitleField(context),
                const SizedBox(height: 5),
                customAddressField(context),
                const SizedBox(height: 5),
                customTitleFieldWithDatePicker(context, _dateController),
                const SizedBox(height: 5),
                customDiscriptionField(context),
                CustomMemberSelector(
                  context,
                  'Do you want to add members?',
                  _groupValue,
                  _memberCount,
                  (String? value) {
                    setState(() {
                      _groupValue = value!;
                    });
                  },
                  (int newCount) {
                    setState(() {
                      _memberCount = newCount;
                    });
                  },
                ),
                const SizedBox(height: 25),
                customNextPageButton(context, "Next", const BookingPage2())
              ],
            ),
          ),
        ),
      ),
    );
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

  Widget customCategoryField(BuildContext context) {
    return Container(
      height: 92,
      width: 330,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColors.skyblue,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Category",
              style: GoogleFonts.almarai(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onError,
              ),
            ),
            const SizedBox(height: 5),
            CustomDropdownField()
          ],
        ),
      ),
    );
  }

  Widget customTitleField(BuildContext context) {
    return Container(
      height: 92,
      width: 330,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColors.skyblue,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title",
              style: GoogleFonts.almarai(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onError,
              ),
            ),
            const SizedBox(height: 5),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter title',
                hintStyle: GoogleFonts.almarai(
                  color: Theme.of(context).colorScheme.onError,
                  fontSize: 14,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              style: GoogleFonts.almarai(
                fontSize: 14,
                color: Colors.black,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget customAddressField(BuildContext context) {
    return Container(
      height: 150, 
      width: 330,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColors.skyblue,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Address",
              style: GoogleFonts.almarai(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onError,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              maxLines: 2,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AppIcons.locationIcon,
                    width: 20,
                    height: 30,
                    color: Colors.grey,
                  ),
                ),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 30,
                  minHeight: 30,
                ),
                hintText:
                    "W35, Al Bateen, Al Bateen, Abu Dhabi,\nUnited Arab Emirates",
                hintStyle: GoogleFonts.almarai(
                  color: AppColors.darkstheme,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ), // Increased padding
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              style: GoogleFonts.almarai(
                fontSize: 14,
                color: Colors.black,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an address';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            Text(
              "Choose from map",
              style: GoogleFonts.almarai(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: AppColors.darkstheme,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customTitleFieldWithDatePicker(
      BuildContext context, TextEditingController dateController) {
    Future<void> selectDateTime(BuildContext context) async {
      DateTime? pickedDateTime = await showModalBottomSheet<DateTime>(
        context: context,
        builder: (BuildContext context) {
          return DateTimePickerBottomSheet();
        },
      );

      if (pickedDateTime != null) {
        dateController.text =
            DateFormat('yyyy-MM-dd HH:mm').format(pickedDateTime);
      }
    }

    return Container(
      height: 92,
      width: 330,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColors.skyblue,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date & Time",
                    style: GoogleFonts.almarai(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onError,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                        hintText: 'Enter date & time',
                        hintStyle: GoogleFonts.almarai(
                          color: Theme.of(context).colorScheme.onError,
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: GestureDetector(
                          onTap: () => selectDateTime(context),
                          child: Image.asset(
                            AppIcons.calenderIcon,
                          ),
                        )),
                    style: GoogleFonts.almarai(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a date & time';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customDiscriptionField(BuildContext context) {
    return Container(
      height: 143, // Increased height for more space
      width: 330,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColors.skyblue,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description",
              style: GoogleFonts.almarai(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onError,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText:
                    "Describe your request clearly,so we can find for you the best HANDS.",
                hintStyle: GoogleFonts.almarai(
                  color: AppColors.greylight,
                  fontSize: 12,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              style: GoogleFonts.almarai(
                fontSize: 14,
                color: AppColors.greylight,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'description is empty';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget CustomMemberSelector(
    BuildContext context,
    String questionText,
    String groupValue,
    int memberCount,
    Function(String?) onRadioChanged,
    Function(int) onCountChanged,
  ) {
    return Column(
      children: [
        customQuestionWithRadio(
          context,
          questionText,
          groupValue,
          onRadioChanged,
        ),
        if (groupValue == 'yes')
          customMemberCountSelector(
            context,
            memberCount,
            onCountChanged,
          ),
      ],
    );
  }

  Widget customQuestionWithRadio(
    BuildContext context,
    String questionText,
    String groupValue,
    Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 18),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              questionText,
              style: GoogleFonts.almarai(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Container(
            height: 31,
            width: 157,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.skyblue,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio<String>(
                      value: 'yes',
                      groupValue: groupValue,
                      onChanged: onChanged,
                      activeColor: AppColors.bgcolor,
                      fillColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return AppColors.darkstheme;
                          }
                          return const Color.fromARGB(255, 79, 79, 79);
                        },
                      ),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    const Text("Yes"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio<String>(
                      value: 'no',
                      groupValue: groupValue,
                      onChanged: onChanged,
                      activeColor: AppColors.bgcolor,
                      fillColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return AppColors.bgcolor; // Selected color
                          }
                          return const Color.fromARGB(
                              255, 82, 82, 82); // Unselected color
                        },
                      ),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    const Text("No"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget customMemberCountSelector(
      BuildContext context, int memberCount, Function(int) onCountChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 18),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "How many members do you want?",
              style: GoogleFonts.almarai(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Container(
            height: 31,
            width: 106,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 31,
                  width: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.remove),
                      iconSize: 16,
                      color: Colors.black,
                      onPressed: () {
                        if (memberCount > 0) {
                          onCountChanged(memberCount - 1);
                        }
                      },
                    ),
                  ),
                ),
                Text(
                  memberCount.toString(),
                  style: GoogleFonts.almarai(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: 31,
                  width: 47,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      iconSize: 16,
                      color: Colors.black,
                      onPressed: () {
                        onCountChanged(memberCount + 1);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget customNextPageButton(
      BuildContext context, String buttonText, Widget nextPage) {
    return Container(
      height: 56,
      width: 174,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextPage),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: GoogleFonts.almarai(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDropdownField extends StatefulWidget {
  @override
  _CustomDropdownFieldState createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownButton2<String>(
        isExpanded: true,
        value: _selectedCategory, // Set the selected value here
        hint: Text(
          'Select Category',
          style: GoogleFonts.almarai(
            fontSize: 14,
            color: Theme.of(context).colorScheme.onError,
          ),
        ),
        items: _getDropdownItems(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedCategory = newValue; // Update the selected value
          });
        },
        iconStyleData: IconStyleData(
          icon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(AppIcons.dropdownIcon, height: 20, width: 20),
          ),
          iconSize: 20,
          iconEnabledColor: AppColors.darkstheme,
        ),
        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.transparent,
            ),
            color: Colors.white,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          elevation: 2,
        ),
        underline: const SizedBox(),
        style: GoogleFonts.almarai(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _getDropdownItems() {
    return <String>['CNC & VNC Operator', 'AC Operator', 'Flutter Developer']
        .map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}

class DateTimePickerBottomSheet extends StatefulWidget {
  @override
  _DateTimePickerBottomSheetState createState() =>
      _DateTimePickerBottomSheetState();
}

class _DateTimePickerBottomSheetState extends State<DateTimePickerBottomSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  DateTime _selectedDate = DateTime.now();
  Duration _selectedDuration =
      Duration(hours: TimeOfDay.now().hour, minutes: TimeOfDay.now().minute);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 595,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date & Time',
                    style: GoogleFonts.almarai(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  Container(
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close, size: 16),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(22),
              height: 48,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onTertiary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.only(
                  top: 6,
                  left: 4,
                  right: 4,
                  bottom: 6,
                ),
                labelColor: Theme.of(context).colorScheme.onSecondary,
                unselectedLabelColor: const Color.fromARGB(255, 75, 87, 135),
                labelStyle: GoogleFonts.almarai(
                    fontSize: 16, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Theme.of(context).colorScheme.primary,
                ),
                tabs: const [
                  Tab(text: 'Date'),
                  Tab(text: 'Time'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildDatePickerTab(),
                  _buildTimePickerTab(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop(DateTime(
                  _selectedDate.year,
                  _selectedDate.month,
                  _selectedDate.day,
                  _selectedDuration.inHours % 24,
                  _selectedDuration.inMinutes % 60,
                ));
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  height: 56,
                  width: 345,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).colorScheme.onBackground),
                  child: Center(
                    child: Text(
                      "Done",
                      style: GoogleFonts.almarai(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDatePickerTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('MMMM yyyy').format(_selectedDate),
                style: GoogleFonts.almarai(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onTertiary,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.chevron_left, color: Colors.black),
                      onPressed: () {
                        setState(() {
                          _selectedDate = DateTime(
                            _selectedDate.year,
                            _selectedDate.month - 1,
                            _selectedDate.day,
                          );
                        });
                      },
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onTertiary,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon:
                          const Icon(Icons.chevron_right, color: Colors.black),
                      onPressed: () {
                        setState(() {
                          _selectedDate = DateTime(
                            _selectedDate.year,
                            _selectedDate.month + 1,
                            _selectedDate.day,
                          );
                        });
                      },
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Divider(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Container(
            height: 40,
            width: 345,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                  .map((day) => Text(
                        day,
                        style: GoogleFonts.almarai(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemCount: DateUtils.getDaysInMonth(
                _selectedDate.year, _selectedDate.month),
            itemBuilder: (context, index) {
              final day = index + 1;
              final isSelected = day == _selectedDate.day;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDate = DateTime(
                      _selectedDate.year,
                      _selectedDate.month,
                      day,
                    );
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context).colorScheme.onPrimary
                        : Colors.blue[100],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      '$day',
                      style: GoogleFonts.almarai(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTimePickerTab() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.hm,
            initialTimerDuration: _selectedDuration,
            onTimerDurationChanged: (Duration newDuration) {
              setState(() {
                _selectedDuration = newDuration;
              });
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          color: Theme.of(context).colorScheme.primary,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(DateTime(
                _selectedDate.year,
                _selectedDate.month,
                _selectedDate.day,
                _selectedDuration.inHours % 24,
                _selectedDuration.inMinutes % 60,
              ));
            },
            child: Container(
              height: 56,
              width: 327,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.onBackground),
              child: Center(
                child: Text(
                  'Done',
                  style: GoogleFonts.almarai(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
