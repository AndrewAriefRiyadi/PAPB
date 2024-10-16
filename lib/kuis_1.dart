import 'package:flutter/material.dart';
import 'app_text_styles.dart';

class Kuis1Page extends StatelessWidget {
  const Kuis1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.favorite_border_rounded),
          )
        ],
        backgroundColor: Colors.grey[50],
        centerTitle: true,
        title: const Text(
          'Detail',
          style: AppTextStyles.medium,
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      20), // Ini yang memberikan efek rounded pada gambar
                  child: Image.asset(
                    'assets/images/kopi.jpg',
                    fit: BoxFit
                        .cover, // Agar gambar menyesuaikan dengan ukuran container
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    border: BorderDirectional(
                      bottom: BorderSide(color: Colors.black26),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Caffe Mocha', style: AppTextStyles.medium),
                          Text('Ice/Hot', style: AppTextStyles.body),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: Colors.orange,
                              ),
                              Text('4.8', style: AppTextStyles.small),
                              SizedBox(width: 5),
                              Text('(230)', style: AppTextStyles.body)
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.delivery_dining_rounded,
                            color: Colors.deepOrange,
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.coffee,
                            color: Colors.deepOrange,
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.traffic_sharp,
                            color: Colors.deepOrange,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text('Description', style: AppTextStyles.small),
                const SizedBox(height: 10),
                Text(
                  'A cappucino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffe and 85ml of fresh milk the fo...',
                  style: AppTextStyles.body,
                ),
                Text('Read More',
                    style:
                        AppTextStyles.small.copyWith(color: Colors.deepOrange)),
                const SizedBox(height: 16),
                Text(
                  'Size',
                  style: AppTextStyles.small,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black26)),
                      child: Text(
                        'S',
                        style: AppTextStyles.small,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.deepOrange[50],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.deepOrange)),
                      child: Text(
                        'M',
                        style: AppTextStyles.small
                            .copyWith(color: Colors.deepOrange),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black26)),
                      child: Text(
                        'L',
                        style: AppTextStyles.small,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25), // Warna shadow
                  blurRadius: 4, // Blur shadow
                  offset: const Offset(0, 4), // Posisi shadow
                ),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: AppTextStyles.body,
                      ),
                      Text(
                        '\$ 4.53',
                        style: AppTextStyles.medium
                            .copyWith(color: Colors.deepOrange),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'Buy Now',
                      style: AppTextStyles.medium.copyWith(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
