import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final String iconUrl;
  final VoidCallback onPressed;
  final bool isLoading;

  const SocialButton({
    super.key,
    required this.text,
    required this.iconUrl,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.white,
        side: const BorderSide(color: AppColors.border),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        minimumSize: const Size(double.infinity, 56),
        padding: const EdgeInsets.symmetric(horizontal: 24),
      ),
      child: isLoading
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: AppColors.primary,
                strokeWidth: 2.5,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(iconUrl, height: 24, width: 24),
                const SizedBox(width: 16),
                Text(text, style: AppTextStyle.socialButtonText),
              ],
            ),
    );
  }
}