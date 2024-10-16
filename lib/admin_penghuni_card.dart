import 'package:flutter/material.dart';
import 'package:manajemen_asrama/admin_kamar_detail.dart';
import 'package:manajemen_asrama/admin_penghuni_detail_page.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AdminPenghuniCard extends StatelessWidget {
  final String name;
  final String kelamin;
  final String no_hp;
  final int status;
  final VoidCallback pressedAction;

  const AdminPenghuniCard({
    super.key,
    required this.name,
    required this.kelamin,
    required this.no_hp,
    required this.status,
    required this.pressedAction,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AdminPenghuniDetailPage()));
        },
        style: ElevatedButton.styleFrom(
          
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          backgroundColor: status==1 ? AppColors.secondaryColor : AppColors.accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // Mengubah radius di sini
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: AppTextStyles.medium.copyWith(color: Colors.white)),
                Text(
                  kelamin,
                  style: AppTextStyles.small.copyWith(color: Colors.white),
                ),
                Text(
                  no_hp,
                  style: AppTextStyles.small.copyWith(color: Colors.white),
                ),
              ],
            ),
            Row(children: [
              Icon(Icons.radio_button_checked, color: status == 1 ? AppColors.greenColor : AppColors.redColor,)
            ],)
          ],
        ));
  }
}
