import 'package:flutter/material.dart';
import 'package:manajemen_asrama/home_page.dart';
import 'package:manajemen_asrama/pembayaran_page.dart';
import 'package:manajemen_asrama/user_keluhan_card.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'bottom_nav_bar.dart';
import 'penghuni_page.dart';
import 'kamar_page.dart';

class CreateKeluhanPage extends StatelessWidget {
  const CreateKeluhanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Pengajuan Keluhan',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Judul',
                    style: AppTextStyles.medium,
                  ),
                  TextField(
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      filled: true,
                      fillColor: AppColors.inputColor,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'Judul',
                      labelStyle:
                          AppTextStyles.small.copyWith(color: Colors.white),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none),
                    ),
                    style: AppTextStyles.small.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Deskripsi',
                    style: AppTextStyles.medium,
                  ),
                  TextField(
                    cursorColor: Colors.white,
                    maxLines: null,
                    minLines: 5,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      filled: true,
                      fillColor: AppColors.inputColor,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'Deskripsi',
                      labelStyle:
                          AppTextStyles.small.copyWith(color: Colors.white),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none),
                    ),
                    style: AppTextStyles.small.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateKeluhanPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.redColor, // Warna latar tombol
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize
                              .min, // Menyesuaikan ukuran row dengan konten
                          children: [
                            Icon(
                              Icons.send, // Ikon yang ingin ditampilkan
                              color: Colors.white, // Warna ikon
                            ),
                            SizedBox(width: 8), // Jarak antara ikon dan teks
                            Text(
                              'Kirim',
                              style: AppTextStyles.small
                                  .copyWith(color: Colors.white), // Gaya teks
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
