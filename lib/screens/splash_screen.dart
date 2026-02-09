import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'home_screen.dart';
import '../utils/themes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }
  
  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: AppColors.gradientCyber,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accent.withOpacity(0.5),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.security,
                  size: 70,
                  color: Colors.white,
                ),
              ),
            ).animate().scale(duration: 1000.ms),
            
            const SizedBox(height: 30),
            
            ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  colors: AppColors.gradientCyber,
                ).createShader(bounds);
              },
              child: const Text(
                'NORAXLAB',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Cyber',
                ),
              ),
            ).animate().fadeIn(duration: 800.ms),
            
            const SizedBox(height: 10),
            
            const Text(
              'v2.0.4 • ONLINE',
              style: TextStyle(
                color: AppColors.neonGreen,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
