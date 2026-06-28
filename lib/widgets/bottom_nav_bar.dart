import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, -5))],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(Icons.home_filled, 'Home', isActive: true),
              _buildNavItem(Icons.explore_outlined, 'Explore'),
              _buildNavItem(Icons.calendar_today_outlined, 'Bookings'),
              _buildNavItem(Icons.favorite_border, 'Favorites'),
              _buildNavItem(Icons.person_outline, 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, {bool isActive = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isActive ? AppColors.primary : AppColors.textLight, size: 26),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: isActive ? AppColors.primary : AppColors.textLight, fontSize: 11, fontWeight: isActive ? FontWeight.w600 : FontWeight.w500)),
      ],
    );
  }
}