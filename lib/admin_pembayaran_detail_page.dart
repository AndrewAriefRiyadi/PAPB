import 'package:flutter/material.dart';
import 'package:manajemen_asrama/admin_pembayaran_page.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'package:image_input/image_input.dart';

class AdminPembayaranDetailPage extends StatelessWidget {
  final String name;
  final String month;
  final int status;
  final int amount;

  const AdminPembayaranDetailPage({
    super.key,
    required this.name,
    required this.month,
    required this.status,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Pembayaran Detail',
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
                            month,
                            style: AppTextStyles.largeShadow,
                          ),
                          Row(
                            children: [
                              Icon(
                                status == 1
                                    ? Icons
                                        .check_circle // Ikon success untuk status 1
                                    : status == 0
                                        ? Icons
                                            .error // Ikon error untuk status 0
                                        : Icons
                                            .warning, // Ikon warning untuk status lainnya (misalnya 2)
                                color: status == 1
                                    ? Colors.green // Warna hijau untuk success
                                    : status == 0
                                        ? Colors.red // Warna merah untuk error
                                        : Colors
                                            .orange, // Warna oranye untuk warning
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                status == 1
                                    ? 'Lunas' // Ikon success untuk status 1
                                    : status == 0
                                        ? 'Belum Lunas' // Ikon error untuk status 0
                                        : 'Diproses', // Ikon warning untuk status lainnya (misalnya 2)
                                style: AppTextStyles.small,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      name,
                      style: AppTextStyles.medium,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Kamar 7', style: AppTextStyles.small),
                        Text('Rp ' + amount.toString(),
                            style: AppTextStyles.small),
                      ],
                    ),
                    Visibility(
                        visible: status == 0,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.image),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Input Bukti Bayar',
                                        style: AppTextStyles.small,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        )),
                    status != 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Image.asset('assets/images/bukti.png')],
                          )
                        : SizedBox(),
                    status == 2
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AdminPembayaranPage()));
                                },
                                child: Text(
                                  'Decline',
                                  style: AppTextStyles.small
                                      .copyWith(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.redColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        5), // Mengubah radius di sini
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AdminPembayaranPage()));
                                },
                                child: Text(
                                  'Approve',
                                  style: AppTextStyles.small
                                      .copyWith(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.greenColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        5), // Mengubah radius di sini
                                  ),
                                ),
                              )
                            ],
                          )
                        : SizedBox(),
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
