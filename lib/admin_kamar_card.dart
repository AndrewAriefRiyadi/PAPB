import 'package:flutter/material.dart';
import 'package:manajemen_asrama/admin_kamar_detail.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AdminKamarCard extends StatelessWidget {
  final String name;
  final int status;
  final int amount;
  final VoidCallback pressedAction;

  const AdminKamarCard({
    super.key,
    required this.name,
    required this.status,
    required this.amount,
    required this.pressedAction,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AdminKamarDetailPage()));
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
                    style: AppTextStyles.large.copyWith(color: Colors.white)),
                Text(
                  'Rp ' + amount.toString(),
                  style: AppTextStyles.small.copyWith(color: Colors.white),
                )
              ],
            ),
            Row(children: [
              Text(status == 1 ? 'Terisi':'Kosong', style: AppTextStyles.small.copyWith(color: Colors.white),),
              SizedBox(width: 5,),
              Icon(Icons.radio_button_checked, color: status == 1 ? AppColors.greenColor : AppColors.redColor,)
            ],)
          ],
        ));
  }
}
