import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/gradient_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleReset() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2)); // Simulate API
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password reset link sent to your email!')),
        );
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Reset Password', style: AppTextStyle.header),
                const SizedBox(height: 8),
                const Text(
                  'Enter the email associated with your account and we\'ll send an email with instructions to reset your password.',
                  style: AppTextStyle.subtitle,
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Email address',
                  prefixIcon: Icons.mail_outline_rounded,
                  validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
                ),
                const SizedBox(height: 40),
                GradientButton(
                  text: 'Send Reset Link',
                  isLoading: _isLoading,
                  onPressed: _handleReset,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}