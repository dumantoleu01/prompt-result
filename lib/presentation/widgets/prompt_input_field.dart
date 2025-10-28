import 'package:flutter/material.dart';

class PromptInputField extends StatelessWidget {
  final TextEditingController controller;

  const PromptInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        maxLines: 5,
        decoration: const InputDecoration(
          hintText: 'Describe what you want to see...',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
          hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
