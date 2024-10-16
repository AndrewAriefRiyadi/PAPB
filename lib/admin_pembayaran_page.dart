import 'package:flutter/material.dart';
import 'package:manajemen_asrama/admin_home_page.dart';
import 'package:manajemen_asrama/admin_kamar_page.dart';
import 'package:manajemen_asrama/admin_kamar_card.dart';
import 'package:manajemen_asrama/admin_kamar_create.dart';
import 'package:manajemen_asrama/admin_keluhan_page.dart';
import 'package:manajemen_asrama/admin_pembayaran_card.dart';
import 'package:manajemen_asrama/admin_pembayaran_create.dart';
import 'package:manajemen_asrama/admin_pembayaran_detail_page.dart';
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

class AdminPembayaranPage extends StatelessWidget {
  const AdminPembayaranPage({super.key});

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
                  'List Pembayaran',
                  style: AppTextStyles.large,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminPembayaranCreate()));
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
                    AdminPembayaranCard(
                        name: 'Guntur Wisnu Saputra',
                        month: 'Oktober 2024',
                        status: 0,
                        amount: 700000,
                        pressedAction: () {}),
                    SizedBox(
                      height: 5,
                    ),
                    AdminPembayaranCard(
                        name: 'Andrew Arief Riyadi',
                        month: 'Oktober 2024',
                        status: 2,
                        amount: 700000,
                        pressedAction: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AdminPembayaranDetailPage(
                                        name: 'Andrew Arief Riyadi',
                                        month: 'Oktober 2024',
                                        status: 2,
                                        amount: 700000,
                                      )));
                        }),
                    SizedBox(
                      height: 5,
                    ),
                    AdminPembayaranCard(
                        name: 'Fatahillah Alif Arif',
                        month: 'Oktober 2024',
                        status: 1,
                        amount: 700000,
                        pressedAction: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AdminPembayaranDetailPage(
                                        name: 'Fatahillah Alif Arif',
                                        month: 'Oktober 2024',
                                        status: 1,
                                        amount: 700000,
                                      )));
                        }),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 3, // Index yang dipilih (misal 0 untuk halaman Home)
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
            case 4:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminKeluhanPage()));
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
