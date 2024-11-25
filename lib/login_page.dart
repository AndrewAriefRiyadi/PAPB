import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'home_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/login'),
      body: jsonEncode({
        'username': _usernameController.text,
        'password': _passwordController.text,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      
      final data = jsonDecode(response.body);
      final token = data['token']; // Sesuaikan dengan respons API Anda
      await _saveToken(token);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      // Tampilkan pesan error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed!')),
      );
    }
  }

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
              controller: _usernameController,
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
              controller: _passwordController,
              cursorColor: Colors.white,
              obscureText: true,
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
                onPressed: _isLoading ? null : _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
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
