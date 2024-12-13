import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:manajemen_asrama/home_page.dart';
import 'package:manajemen_asrama/kamar_page.dart';
import 'package:manajemen_asrama/pembayaran_page.dart';
import 'package:manajemen_asrama/penghuni_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'create_keluhan_page.dart';
import 'keluhan_card.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'bottom_nav_bar.dart';

class KeluhanPage extends StatefulWidget {
  const KeluhanPage({super.key});

  @override
  _KeluhanPageState createState() => _KeluhanPageState();
}

class _KeluhanPageState extends State<KeluhanPage> {
  Map<String, dynamic>? user;
  List<dynamic> complaints = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserAndComplaints();
  }

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<Map<String, dynamic>?> _fetchAuthUser(String token) async {
    final response = await http.get(
      Uri.parse('https://papb-andru.up.railway.app/api/user'),
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

  Future<List<dynamic>> _fetchComplaints(String token, int userId) async {
    final response = await http.get(
      Uri.parse('https://papb-andru.up.railway.app/api/user/keluhan/$userId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'] ?? [];
    } else {
      print('Failed to fetch complaints: ${response.statusCode}');
      return [];
    }
  }

  Future<void> _fetchUserAndComplaints() async {
    final token = await _getToken();
    if (token == null) return;

    final fetchedUser = await _fetchAuthUser(token);
    if (fetchedUser == null) return;

    final userId = fetchedUser['id'];
    final fetchedComplaints = await _fetchComplaints(token, userId);

    setState(() {
      user = fetchedUser;
      complaints = fetchedComplaints;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Keluhan',
          style: AppTextStyles.medium,
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 15),
                          decoration: const BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(
                                      color: AppColors.primaryColor))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Keluhan',
                                style: AppTextStyles.largeShadow,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreateKeluhanPage(userId: user!['id']),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.redColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.send, color: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                'Ajukan Keluhan',
                                style: AppTextStyles.small
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...complaints.map((complaint) => KeluhanCard(
                              title: complaint['judul'] ?? 'No Title',
                              description:
                                  complaint['deskripsi'] ?? 'No Description',
                              date: complaint['tanggal_keluhan'] ??
                                  'Unknown Date',
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 4,
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
            case 3:
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PembayaranPage()));
              break;
            
          }
        },
      ),
    );
  }
}
