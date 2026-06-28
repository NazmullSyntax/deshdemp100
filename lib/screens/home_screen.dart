import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../utils/app_images.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/category_card.dart';
import '../widgets/destination_card.dart';
import '../widgets/travel_tips_banner.dart';
import '../widgets/recommendation_card.dart';
import '../widgets/bottom_nav_bar.dart';
import 'login_screen.dart'; 

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    await AuthService().signOut();
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false, 
      );
    }
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: AppColors.textGrey)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); 
              _handleLogout(context); 
            },
            child: const Text('Log Out', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser;
    final String displayName = user?.displayName?.split(' ').first ?? 'Explorer';
    final String photoUrl = user?.photoURL ?? AppImages.avatar;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: size.height * 0.35,
            child: Image.network(AppImages.headerBackground, fit: BoxFit.cover),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: size.height * 0.38,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                        Color.fromRGBO(0, 0, 0, 0.4),
                    Colors.transparent,
                    AppColors.background,
                  ],
                  stops: [0.0, 0.6, 1.0],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).padding.top + 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Hi, $displayName', style: AppTextStyles.headerTitle),
                                const Text('& Guides', style: AppTextStyles.headerSubtitle),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.location_on, color: AppColors.white, size: 20),
                                const SizedBox(width: 4),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Cox's Bazar", style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                                    Text("Chittagong", style: TextStyle(color: Colors.white70, fontSize: 11)),
                                  ],
                                ),
                                const SizedBox(width: 12),
                                GestureDetector(
                                  onTap: () => _showLogoutDialog(context),
                                  child: CircleAvatar(
                                    radius: 22,
                                    backgroundColor: AppColors.white,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundImage: NetworkImage(photoUrl),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: CustomSearchBar(),
                      ),
                      const SizedBox(height: 32),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CategoryCard(title: 'Mountains', icon: Icons.landscape, color: AppColors.catMountains, isActive: true),
                            CategoryCard(title: 'Beaches', icon: Icons.beach_access, color: AppColors.catBeaches),
                            CategoryCard(title: 'Heritage', icon: Icons.account_balance, color: AppColors.catHeritage),
                            CategoryCard(title: 'Adventure', icon: Icons.directions_run, color: AppColors.catAdventure),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      _buildSectionHeader('Popular Destinations', 'View All'),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 280,
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: const [
                            DestinationCard(title: "Cox's Bazar", subtitle: "Chittagong", rating: "4.8", imageUrl: AppImages.coxsBazar),
                            DestinationCard(title: "Sundarbans", subtitle: "Khulna", rating: "4.7", imageUrl: AppImages.sundarbans),
                            DestinationCard(title: "Paharpur", subtitle: "Naogaon", rating: "4.6", imageUrl: AppImages.paharpur),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: TravelTipsBanner(),
                      ),
                      const SizedBox(height: 32),
                      _buildSectionHeader('Recommended for You', 'View All'),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 215,
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: const [
                            RecommendationCard(title: "Paharpur...", subtitle: "Naogaon", price: "From \$299", rating: "4.5", imageUrl: AppImages.paharpur),
                            RecommendationCard(title: "Ratargul Swamp...", subtitle: "Sylhet", price: "From \$189", rating: "4.6", imageUrl: AppImages.ratargul),
                            RecommendationCard(title: "Sajek Valley", subtitle: "Rangamati", price: "From \$349", rating: "4.8", imageUrl: AppImages.sajek),
                            RecommendationCard(title: "Kuakata Beach", subtitle: "Patuakhali", price: "From \$259", rating: "4.4", imageUrl: AppImages.kuakata),
                          ],
                        ),
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String actionText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.sectionTitle),
          Row(
            children: [
              Text(actionText, style: AppTextStyles.viewAll),
              const SizedBox(width: 2),
              const Icon(Icons.arrow_forward_ios, color: AppColors.textGrey, size: 12),
            ],
          ),
        ],
      ),
    );
  }
}