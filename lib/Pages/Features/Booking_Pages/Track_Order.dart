import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p1/Pages/Other/Custom_BottomNav.dart';
import 'package:p1/Widgets/Image_Urls.dart';
import 'package:p1/utils/Colors.dart';

class TrackOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              customAppBar(context),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(10),
                height: 48,
                width: 327,
                decoration: BoxDecoration(
                  color: AppColors.skyblue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pending',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.black),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Booking Cards List
              Expanded(
                child: ListView(
                  children: [
                    BookingCard(
                      imageUrl: AppOpreators.op1,
                      serviceName: 'Car Service',
                      bookingId: '#5354',
                      price: 'AED 120.00',
                      discount: '10%',
                      date: '22 July 2023, 10:20 AM',
                      provider: 'Muhammad',
                      status: 'OnGoing',
                      statusColor: Colors.green,
                    ),
                    const SizedBox(height: 16),
                    BookingCard(
                      imageUrl: AppOpreators.op2,
                      serviceName: 'Fridge Repair',
                      bookingId: '#2458',
                      price: 'AED 90.00',
                      discount: '5%',
                      date: '21 July 2023, 10:35 AM',
                      provider: 'Leslie Alexander',
                      status: 'Pending',
                      statusColor: Colors.red,
                      paymentStatus: 'Paid',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: customfloatingActionButton(context),
      bottomNavigationBar: custombottomNavigationBar(context),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String imageUrl;
  final String serviceName;
  final String bookingId;
  final String price;
  final String discount;
  final String date;
  final String provider;
  final String status;
  final Color statusColor;
  final String? paymentStatus;

  BookingCard({
    required this.imageUrl,
    required this.serviceName,
    required this.bookingId,
    required this.price,
    required this.discount,
    required this.date,
    required this.provider,
    required this.status,
    required this.statusColor,
    this.paymentStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Container(
        height: 255,
        width: 327,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.skyblue,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, bottom: 10, right: 15, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  // Service Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imageUrl,
                      width: 80,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Service Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          serviceName,
                          style: GoogleFonts.almarai(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.bgcolor),
                        ),
                        const SizedBox(height: 4),
                        Text.rich(
                          TextSpan(
                            text: 'Booking ID: ',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: AppColors.unselectedcolor),
                            children: [
                              TextSpan(
                                text: bookingId,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: AppColors.bgcolor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text.rich(
                          TextSpan(
                            text: '$price: ',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: AppColors.darkstheme),
                            children: [
                              TextSpan(
                                text: discount,
                                style: const TextStyle(
                                    fontSize: 11, color: AppColors.greentext),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Booking Status
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    height: 28,
                    width: 70,
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Additional Information
              Container(
                height: 134,
                width: 350,
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date & Time",
                            style: GoogleFonts.almarai(
                                color: AppColors.unselectedcolor)),
                        Text(
                          date,
                          style: GoogleFonts.almarai(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkstheme),
                        ),
                      ],
                    ),
                    const Divider(color: AppColors.greylight),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Provider",
                            style: TextStyle(color: AppColors.unselectedcolor)),
                        Text(
                          provider,
                          style: GoogleFonts.almarai(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkstheme),
                        ),
                      ],
                    ),
                    const Divider(color: AppColors.greylight),
                    if (paymentStatus != null) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Payment Status",
                              style: GoogleFonts.almarai(
                                color: AppColors.unselectedcolor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            paymentStatus!,
                            style: GoogleFonts.almarai(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.greentext),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customAppBar(BuildContext context) {
  return Row(
    children: [
      customIconButton(context),
      const SizedBox(width: 15),
      Text(
        "Booking",
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
