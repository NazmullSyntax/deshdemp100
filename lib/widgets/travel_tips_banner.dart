import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';

class TravelTipsBanner extends StatelessWidget {
  const TravelTipsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(colors: [const Color(0xFFE0F7FA), const Color(0xFFB2EBF2).withOpacity(0.5)]),
      ),
      child: Stack(
        children: [
          Positioned(right: -20, bottom: -20, top: 10, child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(AppImages.travelBag, width: 180, fit: BoxFit.cover),
          )),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Get Travel Tips', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark)),
              const SizedBox(height: 6),
              const Text('Plan your perfect trip with\nexpert tips and guides', style: TextStyle(fontSize: 13, color: AppColors.textGrey, height: 1.4)),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(20)),
                child: const Row(mainAxisSize: MainAxisSize.min, children: [
                  Text('Explore Now', style: TextStyle(color: AppColors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                  SizedBox(width: 4), Icon(Icons.arrow_forward_ios, color: AppColors.white, size: 10),
                ]),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}