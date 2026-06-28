import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;

  const GradientButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: isLoading 
              ? [AppColors.textGrey, AppColors.border] 
              : [AppColors.gradientLeft, AppColors.gradientRight],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: isLoading 
            ? [] 
            : [
                BoxShadow(
                  color: AppColors.gradientRight.withValues(alpha: 77),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                )
              ],
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: AppColors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Text(text, style: AppTextStyle.buttonText),
      ),
    );
  }
}