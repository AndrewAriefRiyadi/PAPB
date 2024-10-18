import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AdminPembayaranCard extends StatelessWidget {
  final String name;
  final String month;
  final int status;
  final int amount;
  final VoidCallback pressedAction;

  const AdminPembayaranCard({
    super.key,
    required this.name,
    required this.month,
    required this.status,
    required this.amount,
    required this.pressedAction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTextStyles.medium.copyWith(
                color: Colors.white,
              ),
            ),
            Text(
              month,
              style: AppTextStyles.medium.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nominal: Rp $amount',
                  style: AppTextStyles.body.copyWith(color: Colors.white),
                ),
                Row(
                  children: [
                    Icon(
                      status == 1
                          ? Icons.check_circle // Ikon success untuk status 1
                          : status == 0
                              ? Icons.error // Ikon error untuk status 0
                              : Icons
                                  .warning, // Ikon warning untuk status lainnya (misalnya 2)
                      color: status == 1
                          ? Colors.green // Warna hijau untuk success
                          : status == 0
                              ? Colors.red // Warna merah untuk error
                              : Colors.orange, // Warna oranye untuk warning
                    ),
                    const SizedBox(width: 5),
                    Text(
                      status == 1
                          ? 'Lunas' // Ikon success untuk status 1
                          : status == 0
                              ? 'Kosong' // Ikon error untuk status 0
                              : 'Diproses', // Ikon warning untuk status lainnya (misalnya 2)
                      style: AppTextStyles.small.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            status != 0
                ? ElevatedButton(
                    onPressed: pressedAction,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentColor,
                    ),
                    child: Text(
                      status == 1
                          ? 'Lihat Bukti Bayar'
                          : status == 0
                              ? 'Bayar'
                              : 'Lihat Bukti Bayar',
                      style: AppTextStyles.small.copyWith(color: Colors.white),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
