import 'package:flutter/material.dart';
import 'buat_akun_page.dart';
import 'masuk_page.dart';

class SelamatDatangPage extends StatelessWidget {
  const SelamatDatangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // =========================
          // BAGIAN FOTO ATAS
          // =========================
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/selamat_datang.png',
                  fit: BoxFit.cover,
                ),
              ),

              // Label "Selamat datang"
              const Positioned(
                top: 50,
                left: 24,
                child: Text(
                  'Selamat datang',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // Tombol dark/light mode
              Positioned(
                top: 45,
                right: 24,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.dark_mode_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),

          // =========================
          // CARD PUTIH BAGIAN BAWAH
          // =========================
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 32,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama aplikasi
                  const Text(
                    'Dimi',
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFB5651D),
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Slogan
                  const Text(
                    'Dimsum, Siomay, & Cilok Pilihan.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // =========================
                  // TOMBOL MULAI PESAN
                  // =========================
                  Center(
                    child: SizedBox(
                      width: 450,
                      height: 65,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BuatAkunPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE08A33),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Mulai Pesan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // =========================
                  // TOMBOL MASUK
                  // =========================
                  Center(
                    child: SizedBox(
                      width: 450,
                      height: 65,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MasukPage(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.black26,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Masuk',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}