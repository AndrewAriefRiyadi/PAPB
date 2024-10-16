import 'package:flutter/material.dart';
import 'package:manajemen_asrama/admin_kamar_create.dart';
import 'package:manajemen_asrama/home_page.dart';
import 'package:manajemen_asrama/keluhan_page.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'bottom_nav_bar.dart';
import 'penghuni_page.dart';
import 'pembayaran_page.dart';

class AdminKamarDetailPage extends StatelessWidget {
  const AdminKamarDetailPage({super.key});

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
                      decoration: BoxDecoration(
                          border: BorderDirectional(
                              bottom:
                                  BorderSide(color: AppColors.primaryColor))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Kamar 7',
                            style: AppTextStyles.largeShadow,
                          ),
                          Column(
                            children: [
                              Text(
                                'Rp 700.000',
                                style: AppTextStyles.small,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Terisi',
                                    style: AppTextStyles.small,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.radio_button_checked,
                                    color: AppColors.greenColor,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Penghuni : Guntur Wisnu Saputra',
                      style: AppTextStyles.small,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Fasilitas',
                      style: AppTextStyles.small,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const UnorderedList(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AdminKamarCreatePage()));
                          },
                          child: Text(
                            'Edit',
                            style: AppTextStyles.small
                                .copyWith(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.brownColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5), // Mengubah radius di sini
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UnorderedList extends StatelessWidget {
  const UnorderedList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListItem(text: 'Kamar Mandi'),
        ListItem(text: 'Kasur'),
        ListItem(text: 'Lemari Pakaian'),
        ListItem(text: 'Kursi'),
        ListItem(text: 'Meja'),
        ListItem(text: 'AC'),
        ListItem(text: 'Wi-Fi'),
      ],
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
      mainAxisAlignment: MainAxisAlignment.center,
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
