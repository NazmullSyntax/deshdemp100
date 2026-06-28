import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class DestinationCard extends StatelessWidget {
  final String title, subtitle, imageUrl, rating;

  const DestinationCard({super.key, required this.title, required this.subtitle, required this.imageUrl, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220, margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 15, offset: const Offset(0, 8))],
      ),
      child: Stack(
        children: [
          Positioned(bottom: 0, left: 0, right: 0, height: 100, child: Container(
            decoration: BoxDecoration(borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
            gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.black.withOpacity(0.8), Colors.transparent])),
          )),
          Positioned(top: 16, right: 16, child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12)),
            child: Row(children: [
              const Icon(Icons.star, color: AppColors.white, size: 12), const SizedBox(width: 4),
              Text(rating, style: const TextStyle(color: AppColors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            ]),
          )),
          Positioned(bottom: 16, left: 16, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, style: TextStyle(color: AppColors.white.withOpacity(0.9), fontSize: 14)),
          ])),
        ],
      ),
    );
  }
}