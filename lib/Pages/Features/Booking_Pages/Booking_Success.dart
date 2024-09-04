import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p1/Pages/Features/Booking_Pages/Track_Order.dart';
import 'package:p1/Widgets/Image_Urls.dart'; // Make sure this path is correct

class BookingSuccess extends StatelessWidget {
  const BookingSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppIcons.successIcon,
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(height: 60),
                  Text(
                    "Booking Placed\nSuccessfully",
                    textAlign: TextAlign.center, // Center align text
                    style: GoogleFonts.dmSans(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Thanks for your booking. Your booking\nhas been placed successfully.",
                    textAlign: TextAlign.center, // Center align text
                    style: GoogleFonts.almarai(
                      fontSize: 15,
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondary, // Adjust color if needed
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TrackOrder()));
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Container(
                  height: 56,
                  width: 327,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  child: Center(
                    child: Text(
                      "Track Your Order",
                      style: GoogleFonts.almarai(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
