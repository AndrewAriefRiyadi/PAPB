import 'package:flutter/material.dart';
import 'package:manajemen_asrama/home_page.dart';
import 'package:manajemen_asrama/kamar_page.dart';
import 'package:manajemen_asrama/keluhan_page.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'bottom_nav_bar.dart';
import 'pembayaran_page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PenghuniPage extends StatefulWidget {
  const PenghuniPage({super.key});

  @override
  _PenghuniPageState createState() => _PenghuniPageState();
}

class _PenghuniPageState extends State<PenghuniPage> {
  // Contoh state untuk data penghuni, bisa di-fetch dari API
  Map<String, dynamic>? user;
  Future<String?>? tokenFuture;

  @override
  void initState() {
    super.initState();
    tokenFuture = _getToken();
    _loadUser();
  }

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<Map<String, dynamic>?> _fetchAuthUser() async {
    final token = await _getToken();
    if (token == null) return null;

    final response = await http.get(
      Uri.parse('https://papb-andru.up.railway.app/api/user'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      // Parsing JSON dan mencetak ke terminal
      final data = jsonDecode(response.body);
      print('Fetched user data: $data'); // Print untuk debugging
      return data;
    } else {
      // Tangani kesalahan (misalnya token kedaluwarsa)
      print('Failed to fetch user data: ${response.statusCode}');
      return null;
    }
  }

  Future<void> _loadUser() async {
    final fetchedUser = await _fetchAuthUser();
    setState(() {
      user = fetchedUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Penghuni',
          style: AppTextStyles.medium,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_circle_rounded,
                    size: 56,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    user != null
                      ? user!['name'] ?? 'Nama tidak tersedia'
                      : 'Memuat...',
                    style: AppTextStyles.medium,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        user != null
                      ? user!['umur'] ?? '...'
                      : 'Memuat...',
                        style: AppTextStyles.body,
                      ),
                      Text(
                        user != null
                      ? user!['kamar'] ?? '...'
                      : 'Memuat...',
                        style: AppTextStyles.small,
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildDetailRow('Jenis Kelamin', user != null
                      ? user!['jenis_kelamin'] ?? 'Nama tidak tersedia'
                      : 'Memuat...',),
                  _buildDetailRow('Tanggal Lahir', user != null
                      ? user!['tanggal_lahir'] ?? 'Nama tidak tersedia'
                      : 'Memuat...',),
                  _buildDetailRow('Tanggal Masuk', user != null
                      ? user!['tanggal_masuk'] ?? 'Nama tidak tersedia'
                      : 'Memuat...',),
                  _buildDetailRow('Nomor Telepon', user != null
                      ? user!['no_telp'] ?? 'Nama tidak tersedia'
                      : 'Memuat...',),
                  _buildDetailRow('E-Mail', user != null
                      ? user!['email'] ?? 'Nama tidak tersedia'
                      : 'Memuat...',),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 2,
        onItemTapped: (int index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
              break;
            case 1:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const KamarPage()));
              break;
            case 3:
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PembayaranPage()));
              break;
            case 4:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const KeluhanPage()));
              break;
          }
        },
      ),
    );
  }

  Widget _buildDetailRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.small),
          Text(value ?? 'N/A', style: AppTextStyles.body),
        ],
      ),
    );
  }
}
