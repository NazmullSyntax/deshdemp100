import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CategoryCard extends StatelessWidget {
  final String title; final IconData icon; final Color color; final bool isActive;

  const CategoryCard({super.key, required this.title, required this.icon, required this.color, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 82, height: 82,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withAlpha(isActive ? (0.5 * 255).round() : (0.2 * 255).round()), width: 1.5),
        boxShadow: isActive ? [BoxShadow(color: color.withAlpha((0.15 * 255).round()), blurRadius: 15, offset: const Offset(0, 8))] : [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(color: isActive ? color : AppColors.textDark, fontSize: 12, fontWeight: isActive ? FontWeight.w700 : FontWeight.w600)),
        ],
      ),
    );
  }
}