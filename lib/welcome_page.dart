import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'login_page.dart';
import 'kuis_1.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/welcome.png'),
              const Text(
                'Dormage',
                style: AppTextStyles.largeShadow
                ),
              const SizedBox(height: 16), // Spacer between texts
              const Text(
                'Kelola asrama anda dengan mudah dan efisien bersama kami. Mulai sekarang dan buat pengalaman penghuni lebih nyaman!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Coolvetica',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 16), // Spacer between texts
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman baru
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  minimumSize: const Size.fromHeight(40), // Membuat tombol memenuhi lebar ruangan
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
