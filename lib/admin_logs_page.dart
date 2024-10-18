import 'package:flutter/material.dart';
import 'package:manajemen_asrama/admin_home_page.dart';
import 'package:manajemen_asrama/admin_kamar_card.dart';
import 'package:manajemen_asrama/admin_kamar_create.dart';
import 'package:manajemen_asrama/admin_kamar_page.dart';
import 'package:manajemen_asrama/admin_keluhan_card.dart';
import 'package:manajemen_asrama/admin_keluhan_page.dart';
import 'package:manajemen_asrama/admin_pembayaran_page.dart';
import 'package:manajemen_asrama/admin_penghuni_page.dart';
import 'package:manajemen_asrama/home_page.dart';
import 'package:manajemen_asrama/keluhan_page.dart';
import 'package:manajemen_asrama/pembayaran_detail_page.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'bottom_nav_bar.dart';
import 'penghuni_page.dart';
import 'pembayaran_card.dart';
import 'kamar_page.dart';

class AdminLogsPage extends StatelessWidget {
  const AdminLogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Logs',
          style: AppTextStyles.medium,
        ),
      ),
      body: SingleChildScrollView(
        // Membungkus body dengan SingleChildScrollView
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'List Logs',
                  style: AppTextStyles.large,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
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
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AdminKeluhanCard(
                        title: 'Bayar',
                        name: 'Guntur Wisnu Saputra',
                        description:
                            'Melakukan pembayaran untuk bulan oktober.',
                        date: '12 Oktober 2024'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 5, // Index yang dipilih (misal 0 untuk halaman Home)
        onItemTapped: (int index) {
          switch (index) {
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminHomePage()));
              break;
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminKamarPage()));
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminPenghuniPage()));
              break;

            case 3:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminPembayaranPage()));
              break;
            case 4:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminKeluhanPage()));
              break;
            // case 4:
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => KeluhanPage()));
            //   break;
            // Tambahkan kasus lainnya sesuai kebutuhan
          }
        },
      ),
    );
  }
}
