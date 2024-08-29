import 'package:flutter/material.dart';

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
          child: _buildCard(Colors.blue, 300),
        ),
        Positioned(
          top: 160,
          child: _buildCard(Colors.green, 300),
        ),
        Positioned(
          top: 90,
          child: _buildCard(Colors.black, 360),
        ),
      ],
    );
  }

  Widget _buildCard(Color color, double width) {
    return Container(
      width: width,
      height: 220,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text(
          'Card',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
