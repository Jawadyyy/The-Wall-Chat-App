import 'package:flutter/material.dart';

class Wallpost extends StatelessWidget {
  final String message;
  final String user;
  const Wallpost({
    super.key,
    required this.message,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    // Get the active theme colors
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.tertiary, // Background color
        borderRadius: BorderRadius.circular(12), // Smooth rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3), // Shadow position
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items at the top
        children: [
          // Profile picture with improved size and padding
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.secondary, // Secondary color for profile picture background
            ),
            padding: const EdgeInsets.all(12),
            child: const Icon(
              Icons.person,
              color: Colors.white, // Icon color
              size: 28, // Slightly bigger icon
            ),
          ),
          const SizedBox(width: 20), // Space between profile and message
          // Message and user email
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.inversePrimary, // InversePrimary color for user text
                    fontWeight: FontWeight.bold, // Bold to make it stand out
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface, // Text color for message
                    fontSize: 14,
                    height: 1.5, // Increase line height for better readability
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
