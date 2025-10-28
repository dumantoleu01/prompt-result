import 'package:flutter/material.dart';

class GeneratedImageCard extends StatelessWidget {
  final String imageUrl;

  const GeneratedImageCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(aspectRatio: 1, child: Image.asset(imageUrl, fit: BoxFit.cover)),
      ),
    );
  }
}
