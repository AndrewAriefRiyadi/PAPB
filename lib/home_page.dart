import 'package:flutter/material.dart';
import 'package:manajemen_asrama/keluhan_page.dart';
import 'package:manajemen_asrama/pembayaran_page.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'kamar_page.dart';
import 'penghuni_page.dart';
import 'bottom_nav_bar.dart';
// import 'pengumuman_page.dart';
// import 'keluhan_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView( // Membungkus seluruh body dalam SingleChildScrollView
        padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Dormage', style: AppTextStyles.largeShadow),
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
                            bottom:
                                BorderSide(color: AppColors.primaryColor))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Pembayaran',
                          style: AppTextStyles.largeShadow,
                        ),
                        Text(
                          'see all',
                          style: AppTextStyles.small,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kamar 2',
                                style: AppTextStyles.small,
                              ),
                              Text(
                                'October 2024',
                                style: AppTextStyles.body,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Rp 7.000',
                          style: AppTextStyles.small,
                        ),
                        Icon(
                          Icons.indeterminate_check_box_rounded,
                          fill: 1,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kamar 2',
                                style: AppTextStyles.small,
                              ),
                              Text(
                                'September 2024',
                                style: AppTextStyles.body,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Rp 700.000',
                          style: AppTextStyles.small,
                        ),
                        Icon(
                          Icons.check_box_rounded,
                          fill: 1,
                          color: Colors.green,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kamar 2',
                                style: AppTextStyles.small,
                              ),
                              Text(
                                'Juli 2024',
                                style: AppTextStyles.body,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Rp 700.000',
                          style: AppTextStyles.small,
                        ),
                        Icon(
                          Icons.check_box_rounded,
                          fill: 1,
                          color: Colors.green,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(AppColors.secondaryColor),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Bayar bulan ini',
                        style:
                            AppTextStyles.small.copyWith(color: Colors.white),
                      ))
                ],
              ),
            ),
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
