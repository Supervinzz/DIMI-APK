import 'dart:async';
import 'package:flutter/material.dart'; //baruuuuuuuuu
import 'selamat_datang_page.dart'; // sesuaikan dengan path file kamu

class AwalPage extends StatefulWidget {
  const AwalPage({super.key});

  @override
  State<AwalPage> createState() => _AwalPageState();
}

class _AwalPageState extends State<AwalPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Tampil selama 5 detik, lalu pindah ke SelamatDatangPage
    _timer = Timer(const Duration(seconds: 10), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SelamatDatangPage()),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // batalkan timer kalau halaman ditutup sebelum 5 detik
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Foto dimsum full screen
          Positioned.fill(
            child: Image.asset(
              'assets/images/awal.png',
              fit: BoxFit.cover,
            ),
          ),

          // Gradient overlay biar teks di bawah kebaca jelas
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.white.withOpacity(0.6),
                    Colors.white,
                  ],
                  stops: const [0.5, 0.75, 1.0],
                ),
              ),
            ),
          ),

          // Label "Awal" di pojok kiri atas
          const Positioned(
            top: 50,
            left: 24,
            child: Text(
              'Awal',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Judul, subtitle, dan dot indicator
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const Text(
                  'Dimi',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFB5651D),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Dimsum, Siomay, & Cilok Pilihan',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFFB5651D),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
