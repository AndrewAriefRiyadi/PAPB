import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(52, 0, 52, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                  fontFamily: 'Coolvetica',
                  fontSize: 32,
                  shadows: [
                    Shadow(
                        color: Color.fromARGB(25, 0, 0, 0),
                        offset: Offset(0, 4),
                        blurRadius: 4)
                  ]),
            ),
            Image.asset('assets/images/login_clear.png'),
            const SizedBox(height: 10),
            TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                filled: true,
                fillColor: AppColors.inputColor,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: 'Username',
                labelStyle: AppTextStyles.small.copyWith(color: Colors.white),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide.none),
              ),
              style: AppTextStyles.small.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              cursorColor: Colors.white,
              obscureText: true, // Untuk menyembunyikan input password
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                filled: true,
                fillColor: AppColors.inputColor,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: 'Password',
                labelStyle: AppTextStyles.small.copyWith(color: Colors.white),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide.none),
              ),
              style: AppTextStyles.small.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Coolvetica',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
