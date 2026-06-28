import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyle {
  static const TextStyle title = TextStyle(
    color: AppColors.white,
    fontSize: 42,
    fontWeight: FontWeight.w800,
    letterSpacing: -1,
  );

  static const TextStyle header = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    color: AppColors.textGrey,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle buttonText = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle linkText = TextStyle(
    color: AppColors.primary,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static const TextStyle socialButtonText = TextStyle(
    color: AppColors.textDark,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
}