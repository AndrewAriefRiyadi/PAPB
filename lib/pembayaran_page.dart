import 'package:flutter/material.dart';
import 'package:manajemen_asrama/home_page.dart';
import 'package:manajemen_asrama/keluhan_page.dart';
import 'package:manajemen_asrama/pembayaran_detail_page.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'bottom_nav_bar.dart';
import 'penghuni_page.dart';
import 'pembayaran_card.dart';
import 'kamar_page.dart';

class PembayaranPage extends StatelessWidget {
  const PembayaranPage({super.key});

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
                    Container(
                      padding: const EdgeInsets.only(bottom: 15),
                      decoration: const BoxDecoration(
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Guntur Wisnu Saputra',
                      style: AppTextStyles.medium,
                    ),
                    const SizedBox(height: 10),
                    const Text('Kamar 7', style: AppTextStyles.small),
                    const SizedBox(
                      height: 10,
                    ),
                    PembayaranCard(
                      month: 'Oktober 2024',
                      status: 0,
                      amount: 700000,
                      onPay: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PembayaranDetailPage(
                                      month: 'Oktober 2024',
                                      status: 0,
                                      amount: 700000,
                                    )));
                      },
                      onViewReceipt: () {
                        // Aksi untuk melihat bukti bayar
                      },
                    ),
                    PembayaranCard(
                      month: 'September 2024',
                      status: 2,
                      amount: 700000,
                      onPay: () {
                        // Aksi untuk membayar
                      },
                      onViewReceipt: () {
                        // Aksi untuk melihat bukti bayar
                      },
                    ),
                    PembayaranCard(
                      month: 'November 2024',
                      status: 1,
                      amount: 700000,
                      onPay: () {
                        // Aksi untuk membayar
                      },
                      onViewReceipt: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PembayaranDetailPage(
                                      month: 'November 2024',
                                      status: 1,
                                      amount: 700000,
                                    )));
                      },
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
              break;
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => KamarPage()));
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PenghuniPage()));
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
