import 'package:flutter/material.dart';
import 'package:manajemen_asrama/admin_home_page.dart';
import 'package:manajemen_asrama/keluhan_page.dart';
import 'package:manajemen_asrama/pembayaran_page.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'kamar_page.dart';
import 'penghuni_page.dart';
import 'bottom_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
// import 'pengumuman_page.dart';
// import 'keluhan_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic>? user;
  Future<String?>? tokenFuture;
  List<Map<String, dynamic>> pembayaran = [];

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
      // appBar: AppBar(),
      body: SingleChildScrollView(
        // Membungkus seluruh body dalam SingleChildScrollView
        padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Dormage', style: AppTextStyles.largeShadow),
            Row(
              children: [
                const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                const Icon(
                  Icons.account_circle,
                  size: 24,
                ),
                const SizedBox(width: 10),
                Text(
                  user != null
                      ? user!['name'] ?? 'Nama tidak tersedia'
                      : 'Memuat...',
                  style: AppTextStyles.small,
                ),
              ],
            ),
            const SizedBox(height: 10), // Jarak antara teks dan container
            Container(
              padding: const EdgeInsets.all(10), // Padding dalam container
              decoration: BoxDecoration(
                color: AppColors.accentColor, // Warna latar belakang
                borderRadius: BorderRadius.circular(10), // Sudut rounded
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25), // Warna shadow
                    blurRadius: 4, // Blur shadow
                    offset: const Offset(0, 4), // Posisi shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.notification_important,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Pengumuman',
                          style: AppTextStyles.largeShadow
                              .copyWith(color: Colors.white)),
                    ],
                  ),
                  Text(
                      'Untuk menjaga kenyamanan dan kesehatan bersama, kami mengingatkan seluruh penghuni asrama untuk selalu menjaga kebersihan lingkungan asrama. Pastikan sampah dibuang pada tempatnya, area umum tetap rapi, dan kamar pribadi terjaga kebersihannya.',
                      style: AppTextStyles.body.copyWith(color: Colors.white))
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10), // Padding dalam container
              decoration: BoxDecoration(
                color: Colors.white, // Warna latar belakang
                borderRadius: BorderRadius.circular(10), // Sudut rounded
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25), // Warna shadow
                    blurRadius: 4, // Blur shadow
                    offset: const Offset(0, 4), // Posisi shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        border: BorderDirectional(
                            bottom: BorderSide(color: AppColors.primaryColor))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Pembayaran',
                          style: AppTextStyles.largeShadow,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...pembayaran.map(
                    (item) => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 130,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user!['kamar'],
                                    style: AppTextStyles.small,
                                  ),
                                  Text(
                                    item['tanggal_tagihan'],
                                    style: AppTextStyles.body,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              item['nominal'],
                              style: AppTextStyles.small,
                            ),
                            Icon(
                              item['status'] == "Kosong"
                                  ? Icons.indeterminate_check_box_rounded
                                  : item['status'] == "Diproses"
                                      ? Icons.warning
                                      : Icons.check_box_rounded,
                              fill: 1,
                              color: item['status'] == "Kosong"
                                  ? Colors.red
                                  : item['status'] == "Diproses"
                                      ? Colors.orange
                                      : Colors.green,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                  // ElevatedButton(
                  //     style: ButtonStyle(
                  //       backgroundColor:
                  //           WidgetStatePropertyAll(AppColors.secondaryColor),
                  //     ),
                  //     onPressed: () {},
                  //     child: Text(
                  //       'See all',
                  //       style:
                  //           AppTextStyles.small.copyWith(color: Colors.white),
                  //     ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // ElevatedButton(
            //     style: ButtonStyle(
            //       backgroundColor:
            //           WidgetStatePropertyAll(AppColors.secondaryColor),
            //     ),
            //     onPressed: () {
            //       Navigator.pushReplacement(context,
            //           MaterialPageRoute(builder: (context) => AdminHomePage()));
            //     },
            //     child: Text(
            //       'Admin',
            //       style: AppTextStyles.small.copyWith(color: Colors.white),
            //     ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0, // Index yang dipilih (misal 0 untuk halaman Home)
        onItemTapped: (int index) {
          switch (index) {
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => KamarPage()));
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PenghuniPage()));
              break;
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PembayaranPage()));
              break;
            case 4:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => KeluhanPage()));
              break;
            // Tambahkan kasus lainnya sesuai kebutuhan
          }
        },
      ),
    );
  }
}
