import 'package:flutter/material.dart';
import 'package:manajemen_asrama/home_page.dart';
import 'package:manajemen_asrama/kamar_page.dart';
import 'package:manajemen_asrama/keluhan_page.dart';
import 'package:manajemen_asrama/penghuni_page.dart';
import 'pembayaran_detail_page.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'bottom_nav_bar.dart';
import 'pembayaran_card.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PembayaranPage extends StatefulWidget {
  const PembayaranPage({super.key});

  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  Map<String, dynamic>? user; // Data pengguna
  List<Map<String, dynamic>> pembayaran = []; // Data pembayaran
  Future<String?>? tokenFuture;

  @override
  void initState() {
    super.initState();
    tokenFuture = _getToken();
    _loadData();
  }

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<Map<String, dynamic>?> _fetchAuthUser() async {
    final token = await _getToken();
    if (token == null) return null;

    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/user'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Failed to fetch user data: ${response.statusCode}');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> _fetchPembayaran(int userId) async {
    final token = await _getToken();
    if (token == null) return [];
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/user/pembayaran/$userId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      print('Failed to fetch pembayaran data: ${response.statusCode}');
      return [];
    }
  }

  Future<void> _loadData() async {
    final fetchedUser = await _fetchAuthUser();
    setState(() {
      user = fetchedUser;
    });

    if (fetchedUser != null && fetchedUser['id'] != null) {
      final fetchedPembayaran = await _fetchPembayaran(fetchedUser['id']);
      setState(() {
        pembayaran = fetchedPembayaran;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Pembayaran',
          style: AppTextStyles.medium,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        child: Column(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user != null
                        ? user!['name'] ?? 'Nama tidak tersedia'
                        : 'Memuat...',
                    style: AppTextStyles.medium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user != null ? '${user!['kamar']}' : 'Memuat...',
                    style: AppTextStyles.small,
                  ),
                  const SizedBox(height: 10),
                  ...pembayaran.map((item) => PembayaranCard(
                        month: item['tanggal_tagihan'],
                        status: item['status'],
                        amount: item['nominal'],
                        pressedAction: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PembayaranDetailPage(
                                user: user,
                                pembayaran_id: item['id'].toString(),
                                amount: item['nominal'],
                              ),
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 3,
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
            case 2:
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const PenghuniPage()));
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
}
