import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:manajemen_asrama/pembayaran_page.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PembayaranDetailPage extends StatefulWidget {
  final Map<String, dynamic>? user;
  final String amount;
  final String pembayaran_id;

  const PembayaranDetailPage({
    super.key,
    required this.user,
    required this.amount,
    required this.pembayaran_id,
  });

  @override
  State<PembayaranDetailPage> createState() => _PembayaranDetailPageState();
}

class _PembayaranDetailPageState extends State<PembayaranDetailPage> {
  File? _selectedImage;
  Map<String, dynamic>? _pembayaranData;

  @override
  void initState() {
    super.initState();
    // Pastikan menggunakan widget.pembayaran_id di sini
    _fetchPaymentData(widget.pembayaran_id);
  }

  // Fungsi untuk mengambil token
  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  // Fungsi untuk mengambil data pembayaran terbaru dari API
  Future<void> _fetchPaymentData(String pembayaran_id) async {
    final token = await _getToken();
    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Token tidak ditemukan, silakan login kembali")),
      );
      return;
    }

    // Mengonversi pembayaran_id ke String
    final uri = Uri.parse(
        'http://10.0.2.2:8000/api/pembayaran/$pembayaran_id'); // Menggunakan pembayaran_id sebagai bagian dari URL
    final response = await http.get(
      uri,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _pembayaranData = data; // Menyimpan data pembayaran yang diperbarui
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Gagal mengambil data pembayaran")),
      );
    }
  }

  // Fungsi untuk memilih gambar
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // Fungsi untuk mengunggah gambar ke server
  Future<void> _uploadImage() async {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Pilih gambar terlebih dahulu")),
      );
      return;
    }

    final token = await _getToken();
    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Token tidak ditemukan, silakan login kembali")),
      );
      return;
    }

    final uri = Uri.parse('http://10.0.2.2:8000/api/user/upload_bukti');
    final request = http.MultipartRequest('POST', uri);

    request.headers['Authorization'] =
        'Bearer $token'; // Menambahkan token ke header

    request.fields['pembayaran_id'] = _pembayaranData!['id'].toString();
    request.files.add(
      await http.MultipartFile.fromPath('bukti_bayar', _selectedImage!.path),
    );

    final response = await request.send();

    // Mengambil response sebagai string
    final responseString = await response.stream.bytesToString();

    // Periksa apakah response adalah JSON
    if (response.headers['content-type']?.contains('application/json') ??
        false) {
      final responseJson =
          jsonDecode(responseString); // Decode JSON jika response adalah JSON

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseJson['message'])),
        );
        setState(() {
          _selectedImage = null;
        });

        // Setelah upload berhasil, navigasi kembali ke PembayaranPage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PembayaranPage(), // Pastikan untuk memberikan data user yang diperlukan
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(responseJson['message'] ??
                  "Gagal mengunggah bukti pembayaran")),
        );
      }
    } else {
      // Tangani jika response bukan JSON (misalnya HTML error)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Terjadi kesalahan di server atau jaringan.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_pembayaranData == null) {
      // Menampilkan loading jika data belum diambil
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Pembayaran Detail',
          style: AppTextStyles.medium,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPaymentDetails(),
            const SizedBox(height: 20),
            if (_pembayaranData!['path_bukti'] == null ||
                _pembayaranData!['path_bukti'].isEmpty)
              _buildUploadSection(),
            if (_pembayaranData!['path_bukti'] != null &&
                _pembayaranData!['path_bukti'].isNotEmpty)
              _buildProofImage(_pembayaranData!['path_bukti']),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentDetails() {
    return Container(
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
          Container(
            padding: const EdgeInsets.only(bottom: 15),
            decoration: const BoxDecoration(
              border: BorderDirectional(
                bottom: BorderSide(color: AppColors.primaryColor),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _pembayaranData!['tanggal_tagihan'] ?? '-',
                  style: AppTextStyles.largeShadow,
                ),
                Row(
                  children: [
                    Icon(
                      _pembayaranData!['status'] == 'Diterima'
                          ? Icons.check_circle
                          : _pembayaranData!['status'] == 'Kosong'
                              ? Icons.error
                              : Icons.warning,
                      color: _pembayaranData!['status'] == 'Diterima'
                          ? Colors.green
                          : _pembayaranData!['status'] == 'Kosong'
                              ? Colors.red
                              : Colors.orange,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      _pembayaranData!['status'],
                      style: AppTextStyles.small,
                    ),
                  ],
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Kamar 7', style: AppTextStyles.small),
              Text(widget.amount, style: AppTextStyles.small),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUploadSection() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _pickImage,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.image),
              SizedBox(width: 5),
              Text('Pilih Gambar', style: AppTextStyles.small),
            ],
          ),
        ),
        if (_selectedImage != null)
          Column(
            children: [
              const SizedBox(height: 10),
              Image.file(
                _selectedImage!,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _uploadImage,
                child: const Text('Submit Bukti Bayar',
                    style: AppTextStyles.small),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildProofImage(String path) {
    const String baseUrl = 'http://10.0.2.2:8000/storage/';
    final String fullPath =
        '$baseUrl$path'; // Menggabungkan base URL dengan path gambar

    return Column(
      children: [
        const SizedBox(height: 20),
        Center(
          child: Image.network(
            fullPath,
            height: 150,
            width: 150,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.broken_image,
              size: 150,
            ),
          ),
        ),
      ],
    );
  }
}
