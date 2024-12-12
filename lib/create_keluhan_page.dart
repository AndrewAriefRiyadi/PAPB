import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:manajemen_asrama/keluhan_page.dart';
import 'dart:convert';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateKeluhanPage extends StatefulWidget {
  final int userId;

  const CreateKeluhanPage({super.key, required this.userId});

  @override
  _CreateKeluhanPageState createState() => _CreateKeluhanPageState();
}

class _CreateKeluhanPageState extends State<CreateKeluhanPage> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  bool _isLoading = false;

  // Mendapatkan token dari SharedPreferences
  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  // Mengirim keluhan ke API
  Future<void> _submitKeluhan() async {
    final String judul = _judulController.text;
    final String deskripsi = _deskripsiController.text;
    final token = await _getToken();

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Token tidak ditemukan. Silakan login ulang.')),
      );
      return;
    }

    // Validasi input kosong
    if (judul.isEmpty || deskripsi.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Judul dan deskripsi tidak boleh kosong')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse(
            'http://10.0.2.2:8000/api/user/insert_keluhan'), // Ganti dengan IP lokal atau server jika menggunakan perangkat fisik
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'judul': judul,
          'deskripsi': deskripsi,
          'user_id': widget.userId,
        }),
      );

      if (response.statusCode == 200) {
        // Menampilkan pesan sukses dan mengarahkan ke KeluhanPage
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Keluhan berhasil dikirim')),
        );

        // Navigasi ke KeluhanPage setelah berhasil mengirim keluhan
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const KeluhanPage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal mengirim keluhan: ${response.body}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Judul',
                    style: AppTextStyles.medium,
                  ),
                  TextField(
                    controller: _judulController,
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
                  const SizedBox(height: 10),
                  Text(
                    'Deskripsi',
                    style: AppTextStyles.medium,
                  ),
                  TextField(
                    controller: _deskripsiController,
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
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: _isLoading ? null : _submitKeluhan,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.redColor,
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Kirim',
                                    style: AppTextStyles.small
                                        .copyWith(color: Colors.white),
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
