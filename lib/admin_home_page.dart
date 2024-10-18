import 'package:flutter/material.dart';
import 'package:manajemen_asrama/admin_kamar_page.dart';
import 'package:manajemen_asrama/admin_keluhan_page.dart';
import 'package:manajemen_asrama/admin_logs_page.dart';
import 'package:manajemen_asrama/admin_pembayaran_page.dart';
import 'package:manajemen_asrama/admin_penghuni_page.dart';
import 'package:manajemen_asrama/admin_pengumuman_edit.dart';
import 'package:manajemen_asrama/home_page.dart';
import 'package:manajemen_asrama/keluhan_page.dart';
import 'package:manajemen_asrama/pembayaran_page.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'kamar_page.dart';
import 'penghuni_page.dart';
import 'bottom_nav_bar.dart';
// import 'pengumuman_page.dart';
// import 'keluhan_page.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

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
            const Text('Admin', style: AppTextStyles.largeShadow),
            const Row(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                Icon(
                  Icons.account_circle,
                  size: 24,
                ),
                SizedBox(width: 10),
                Text(
                  'Guntur Wisnu Saputra',
                  style: AppTextStyles.small,
                )
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
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Terlihat',
                    style: AppTextStyles.small.copyWith(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(5), // Mengubah radius di sini
                    ),
                  ),
                )),
                SizedBox(width: 10), // Jarak antara dua tombol
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminPengumumanEdit()));
                  },
                  child: Text(
                    'Edit',
                    style: AppTextStyles.small.copyWith(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.brownColor,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(5), // Mengubah radius di sini
                    ),
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(AppColors.secondaryColor),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  'User',
                  style: AppTextStyles.small.copyWith(color: Colors.white),
                ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0, // Index yang dipilih (misal 0 untuk halaman Home)
        onItemTapped: (int index) {
          switch (index) {
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminKeluhanPage()));
              break;
            case 5:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminLogsPage()));
              break;

            // Tambahkan kasus lainnya sesuai kebutuhan
          }
        },
      ),
    );
  }
}
