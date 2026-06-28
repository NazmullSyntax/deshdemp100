import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 20, right: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            // FIX: Replaced .withOpacity(0.05) with .withValues(alpha: 0.05)
            color: Colors.black.withValues(alpha: 0.05), 
            blurRadius: 20, 
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: AppColors.textGrey, size: 28),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Search destinations...', 
              style: TextStyle(color: AppColors.textLight, fontSize: 16),
            ),
          ),
          Container(
            height: 44, 
            width: 44,
            decoration: const BoxDecoration(
              color: AppColors.primary, 
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.tune, color: AppColors.white, size: 20),
          ),
        ],
      ),
    );
  }
}