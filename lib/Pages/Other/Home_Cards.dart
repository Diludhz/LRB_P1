import 'package:flutter/material.dart';
import 'package:p1/Pages/Features/Booking_Pages/Booking_Page1.dart';

class CustomCards extends StatelessWidget {
  const CustomCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 30,
          child: _buildCard(context, Colors.blue, 300, 'Blue Card'),
        ),
        Positioned(
          top: 160,
          child: _buildCard(context, Colors.green, 300, 'Green Card'),
        ),
        Positioned(
          top: 90,
          child: _buildCard(context, Colors.black, 360, 'Black Card'),
        ),
      ],
    );
  }

  Widget _buildCard(
      BuildContext context, Color color, double width, String label) {
    return GestureDetector(
      onTap: () {
        // Navigate to BookingPage1
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BookingPage1()),
        );
      },
      child: Container(
        width: width,
        height: 220,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
