import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class PembayaranCard extends StatelessWidget {
  final String month;
  final String status;
  final String amount;
  final VoidCallback pressedAction;

  const PembayaranCard({
    super.key,
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
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
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
                  amount,
                  style: AppTextStyles.body.copyWith(color: Colors.white),
                ),
                Row(
                  children: [
                    Icon(
                      status == 'Diterima'
                          ? Icons.check_circle // Ikon success untuk status 1
                          : status == 'Kosong'
                              ? Icons.error // Ikon error untuk status 0
                              : Icons
                                  .warning, // Ikon warning untuk status lainnya (misalnya 2)
                      color: status == 'Diterima'
                          ? Colors.green // Warna hijau untuk success
                          : status == 'Kosong'
                              ? Colors.red // Warna merah untuk error
                              : Colors.orange, // Warna oranye untuk warning
                    ),
                    const SizedBox(width: 5),
                    Text(
                      status,
                      style: AppTextStyles.small.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: pressedAction,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentColor,
              ),
              child: Text(
                status == 'Diterima'
                          ? 'Lihat Bukti Bayar' 
                          : status == 'Kosong'
                              ? 'Bayar' 
                              :'Lihat Bukti Bayar',  
                style: AppTextStyles.small.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
