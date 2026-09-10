import 'dart:async';
import 'package:flutter/material.dart';

class PembayaranQrisPage extends StatefulWidget {
  const PembayaranQrisPage({super.key});

  @override
  State<PembayaranQrisPage> createState() => _PembayaranQrisPageState();
}

class _PembayaranQrisPageState extends State<PembayaranQrisPage> {
  Timer? _timer;
  int _secondsLeft = 10 * 60; // 10 menit

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft == 0) {
        timer.cancel();
        // TODO: QR expired, tampilkan dialog atau redirect
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedTime {
    final minutes = (_secondsLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsLeft % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Pembayaran QRIS', style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Total Pembayaran', style: TextStyle(fontSize: 13, color: Colors.black54)),
            const SizedBox(height: 4),
            const Text('Rp50.000', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            // QR Code
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))],
              ),
              child: Column(
                children: [
                  const Text('NMID : ID1026541303990', style: TextStyle(fontSize: 11, color: Colors.black45)),
                  const Text('A01', style: TextStyle(fontSize: 11, color: Colors.black45)),
                  const SizedBox(height: 12),
                  // Placeholder QR - ganti pakai package qr_flutter buat generate QR asli
                  Container(
                    width: 220,
                    height: 220,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset('assets/images/qr_placeholder.png', fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 10),
                  const Text('Scan untuk membayar', style: TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Countdown
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: const Color(0xFFFDF0E6), borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('QR berlaku selama ', style: TextStyle(fontSize: 12, color: Colors.black54)),
                      const Icon(Icons.access_time, size: 13, color: Color(0xFFE08A33)),
                      const SizedBox(width: 2),
                      Text(_formattedTime, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFFE08A33))),
                    ],
                  ),
                  const SizedBox(height: 2),
                  const Text('Jangan tutup halaman ini sebelum pembayaran selesai.', style: TextStyle(fontSize: 10, color: Colors.black45), textAlign: TextAlign.center),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Cara membayar
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Cara Membayar', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            _numberedStep(1, 'Buka aplikasi pembayaran'),
            _numberedStep(2, 'Pilih menu Scan QR'),
            _numberedStep(3, 'Scan QRIS di atas'),
            _numberedStep(4, 'Periksa nominal lalu konfirmasi'),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 12),

            // Detail pesanan
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Detail Pesanan', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            _summaryRow('Dimsum Mentai x 2', 'Rp45.000'),
            _summaryRow('Ongkos Kirim', 'Rp5.000'),
            const Divider(height: 20),
            _summaryRow('Total Pembayaran', 'Rp50.000', isBold: true),
            const SizedBox(height: 20),

            const Text('Menunggu pembayaran...', style: TextStyle(fontSize: 12, color: Colors.black45)),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, -2))]),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: cek status pembayaran ke backend
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE08A33),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Saya Sudah Membayar', style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  // TODO: dialog konfirmasi batalkan pembayaran
                },
                child: const Text('Batalkan Pembayaran', style: TextStyle(color: Colors.black45, fontSize: 13)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _numberedStep(int number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: Color(0xFFFDF0E6), shape: BoxShape.circle),
            child: Text('$number', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFFE08A33))),
          ),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 13, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: isBold ? 14 : 13, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: isBold ? Colors.black87 : Colors.black54)),
          Text(value, style: TextStyle(fontSize: isBold ? 15 : 13, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: isBold ? const Color(0xFFE08A33) : Colors.black87)),
        ],
      ),
    );
  }
}