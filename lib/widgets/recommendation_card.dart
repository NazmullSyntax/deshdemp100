import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class RecommendationCard extends StatelessWidget {
  final String imageUrl, title, subtitle, price, rating;

  const RecommendationCard({super.key, required this.imageUrl, required this.title, required this.subtitle, required this.price, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: AppColors.white, borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(imageUrl, height: 110, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textDark)),
              const SizedBox(height: 2),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: AppColors.textLight)),
              const SizedBox(height: 12),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(price, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.primary)),
                Row(children: [
                  const Icon(Icons.star, color: AppColors.starOrange, size: 14), const SizedBox(width: 2),
                  Text(rating, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                ]),
              ]),
            ]),
          ),
        ],
      ),
    );
  }
}