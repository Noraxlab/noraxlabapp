import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/firebase_service.dart';
import '../utils/themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseService = Provider.of<FirebaseService>(context);
    
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'NORAXLAB',
          style: TextStyle(
            color: AppColors.accent,
            fontWeight: FontWeight.w900,
            fontFamily: 'Cyber',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [AppColors.secondary, AppColors.darkGray],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'WELCOME,',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 5),
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        colors: AppColors.gradientCyber,
                      ).createShader(bounds);
                    },
                    child: const Text(
                      'CYBER EXPLORER',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Cyber',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Your gateway to premium content',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            const Text(
              'CATEGORIES',
              style: TextStyle(
                color: AppColors.accent,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            
            const SizedBox(height: 15),
            
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.5,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  final categories = [
                    'Video Tutorials', 'Hacking Apps', 'Paid Files', 'FF Scripts',
                    'Telegram Scripts', 'Mod Apps', 'Mod Games', 'Other Tutorials'
                  ];
                  final icons = [
                    Icons.video_library, Icons.security, Icons.attach_money, Icons.fireplace,
                    Icons.telegram, Icons.android, Icons.sports_esports, Icons.library_books
                  ];
                  
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.secondary.withOpacity(0.7),
                          AppColors.darkGray.withOpacity(0.7),
                        ],
                      ),
                      border: Border.all(
                        color: AppColors.accent.withOpacity(0.2),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icons[index], color: AppColors.accent, size: 30),
                        const SizedBox(height: 10),
                        Text(
                          categories[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: firebaseService.isAdmin
          ? FloatingActionButton(
              backgroundColor: AppColors.accent,
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
