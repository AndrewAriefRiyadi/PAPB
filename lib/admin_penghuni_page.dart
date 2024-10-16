import 'package:flutter/material.dart';
import 'package:manajemen_asrama/admin_home_page.dart';
import 'package:manajemen_asrama/admin_kamar_page.dart';
import 'package:manajemen_asrama/admin_kamar_card.dart';
import 'package:manajemen_asrama/admin_kamar_create.dart';
import 'package:manajemen_asrama/admin_keluhan_page.dart';
import 'package:manajemen_asrama/admin_pembayaran_page.dart';
import 'package:manajemen_asrama/admin_penghuni_card.dart';
import 'package:manajemen_asrama/admin_penghuni_create.dart';
import 'package:manajemen_asrama/home_page.dart';
import 'package:manajemen_asrama/keluhan_page.dart';
import 'package:manajemen_asrama/pembayaran_detail_page.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'bottom_nav_bar.dart';
import 'penghuni_page.dart';
import 'pembayaran_card.dart';
import 'kamar_page.dart';

class AdminPenghuniPage extends StatelessWidget {
  const AdminPenghuniPage({super.key});

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
        // Membungkus body dengan SingleChildScrollView
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'List Penghuni',
                  style: AppTextStyles.large,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminPenghuniCreatePage()));
                  },
                  child: Text(
                    'Tambah',
                    style: AppTextStyles.small.copyWith(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(5), // Mengubah radius di sini
                    ),
                  ),
                )
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
                    AdminPenghuniCard(
                        name: 'Guntur Wisnu Saputra',
                        kelamin: 'Laki-Laki',
                        no_hp: '08215154534',
                        status: 1,
                        pressedAction: () {}),
                    SizedBox(
                      height: 10,
                    ),
                    AdminPenghuniCard(
                        name: 'Guntur Wisnu Saputra',
                        kelamin: 'Laki-Laki',
                        no_hp: '08215154534',
                        status: 0,
                        pressedAction: () {}),
                    SizedBox(
                      height: 10,
                    ),
                    AdminPenghuniCard(
                        name: 'Guntur Wisnu Saputra',
                        kelamin: 'Laki-Laki',
                        no_hp: '08215154534',
                        status: 0,
                        pressedAction: () {}),
                    SizedBox(
                      height: 10,
                    ),
                    AdminPenghuniCard(
                        name: 'Guntur Wisnu Saputra',
                        kelamin: 'Laki-Laki',
                        no_hp: '08215154534',
                        status: 1,
                        pressedAction: () {}),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 2, // Index yang dipilih (misal 0 untuk halaman Home)
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
            case 3:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminPembayaranPage()));
              break;
            case 4:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminKeluhanPage()));
              break;
          }
        },
      ),
    );
  }
}
