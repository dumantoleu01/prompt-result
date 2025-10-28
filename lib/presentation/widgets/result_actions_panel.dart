import 'package:flutter/material.dart';

class ResultActionsPanel extends StatelessWidget {
  final VoidCallback onTryAnother;
  final VoidCallback onNewPrompt;

  const ResultActionsPanel({super.key, required this.onTryAnother, required this.onNewPrompt});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: onTryAnother,
              icon: const Icon(Icons.refresh),
              label: const Text('Try Another'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: onNewPrompt,
              icon: const Icon(Icons.edit),
              label: const Text('New Prompt'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
