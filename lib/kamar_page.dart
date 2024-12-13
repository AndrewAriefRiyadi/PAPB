import 'package:flutter/material.dart';
import 'package:manajemen_asrama/home_page.dart';
import 'package:manajemen_asrama/keluhan_page.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'bottom_nav_bar.dart';
import 'penghuni_page.dart';
import 'pembayaran_page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class KamarPage extends StatefulWidget {
  const KamarPage({super.key});

  @override
  _KamarPageState createState() => _KamarPageState();
}

class _KamarPageState extends State<KamarPage> {
  Map<String, dynamic>? kamar;
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
      Uri.parse('https://papb-andru.up.railway.app/api/user/kamar'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Fetched kamar data: $data'); // Print untuk debugging
      return data;
    } else {
      print('Failed to fetch kamar data: ${response.statusCode}');
      return null;
    }
  }

  Future<void> _loadUser() async {
    final fetchedKamar = await _fetchAuthUser();
    setState(() {
      kamar = fetchedKamar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Kamar',
          style: AppTextStyles.medium,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menampilkan nomor kamar
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
                    decoration: BoxDecoration(
                      border: BorderDirectional(
                        bottom: BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          kamar != null ? '${kamar!['nomor']}' : 'Memuat..',
                          style: AppTextStyles.largeShadow,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Fasilitas',
                    style: AppTextStyles.small,
                  ),
                  const SizedBox(height: 10),
                  // Menampilkan fasilitas dari JSON
                  kamar != null
                      ? _buildFasilitasList(kamar!['fasilitas'])
                      : Text('...'),
                  // _buildFasilitasList(kamar!['fasilitas']),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
        onItemTapped: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
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
          }
        },
      ),
    );
  }

  // Widget untuk menampilkan fasilitas yang berupa list
  Widget _buildFasilitasList(List<dynamic> fasilitas) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: fasilitas.map<Widget>((item) {
        return ListItem(text: item);
      }).toList(),
    );
  }
}

class ListItem extends StatelessWidget {
  final String text;

  const ListItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.arrow_right, size: 16), // Simbol bullet
        const SizedBox(width: 8), // Jarak antara bullet dan teks
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
