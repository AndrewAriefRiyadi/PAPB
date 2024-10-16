import 'package:flutter/material.dart';
import 'package:manajemen_asrama/home_page.dart';
import 'package:manajemen_asrama/kamar_page.dart';
import 'package:manajemen_asrama/keluhan_page.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'bottom_nav_bar.dart';
import 'pembayaran_page.dart';

class PenghuniPage extends StatelessWidget {
  const PenghuniPage({super.key});

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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle_rounded,
                    size: 56,
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    'Guntur Wisnu Saputra',
                    style: AppTextStyles.medium,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '21 Tahun,',
                        style: AppTextStyles.body,
                      ),
                      Text(
                        ' Kamar 7',
                        style: AppTextStyles.small,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jenis Kelamin',
                        style: AppTextStyles.small,
                      ),
                      Text(
                        'Laki-laki',
                        style: AppTextStyles.body,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tanggal Lahir',
                        style: AppTextStyles.small,
                      ),
                      Text(
                        '30 Mei 2003',
                        style: AppTextStyles.body,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tanggal Masuk',
                        style: AppTextStyles.small,
                      ),
                      Text(
                        '10 Mei 2024',
                        style: AppTextStyles.body,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nomor Telepon',
                        style: AppTextStyles.small,
                      ),
                      Text(
                        '082151545775',
                        style: AppTextStyles.body,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'E-Mail',
                        style: AppTextStyles.small,
                      ),
                      Text(
                        'gunturganteng@gmail.com',
                        style: AppTextStyles.body,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jenis Kelamin',
                        style: AppTextStyles.small,
                      ),
                      Text(
                        'Laki-laki',
                        style: AppTextStyles.body,
                      )
                    ],
                  ),
                  
                ],
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
              break;
            case 1:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => KamarPage()));
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


