import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/gradient_button.dart';
import '../widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Scenic Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: height * 0.45, // Top portion coverage
            child: Image.network(
              'https://images.unsplash.com/photo-1542401886-65d6c61de115?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80',
              fit: BoxFit.cover,
            ),
          ),
          
          // App Title
          Positioned(
            top: height * 0.14,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'DeshExplorer',
                style: AppTextStyle.title.copyWith(
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Main Bottom Card
          Positioned.fill(
            top: height * 0.32, // Smooth overlap
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      const Text('Welcome Back', style: AppTextStyle.header),
                      const SizedBox(height: 8),
                      const Text(
                        'Sign in to continue your journey',
                        style: AppTextStyle.subtitle,
                      ),
                      const SizedBox(height: 32),
                      
                      // Input Fields
                      const CustomTextField(
                        hintText: 'Email address',
                        prefixIcon: Icons.mail_outline_rounded,
                      ),
                      const SizedBox(height: 16),
                      const CustomTextField(
                        hintText: 'Password',
                        prefixIcon: Icons.lock_outline_rounded,
                        suffixIcon: Icons.remove_red_eye_outlined,
                        obscureText: true,
                      ),
                      const SizedBox(height: 12),
                      
                      // Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            'Forgot Password?',
                            style: AppTextStyle.linkText,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      // Sign In Action
                      GradientButton(
                        text: 'Sign In',
                        onPressed: () {},
                      ),
                      const SizedBox(height: 32),
                      
                      // Divider
                      Row(
                        children: const [
                          Expanded(child: Divider(color: AppColors.border, thickness: 1)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                color: AppColors.textGrey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(child: Divider(color: AppColors.border, thickness: 1)),
                        ],
                      ),
                      const SizedBox(height: 32),
                      
                      // Social Logins
                      SocialButton(
                        text: 'Continue with Google',
                        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/120px-Google_%22G%22_logo.svg.png',
                        onPressed: () {},
                      ),
                      const SizedBox(height: 16),
                      SocialButton(
                        text: 'Continue with Facebook',
                        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2021_Facebook_icon.svg/120px-2021_Facebook_icon.svg.png',
                        onPressed: () {},
                      ),
                      const SizedBox(height: 40),
                      
                      // Bottom Register Text
                      Center(
                        child: RichText(
                          text: const TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(
                              color: AppColors.textDark,
                              fontSize: 15,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}