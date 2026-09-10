import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class LupaPasswordPage extends StatefulWidget {
  const LupaPasswordPage({super.key});

  @override
  State<LupaPasswordPage> createState() => _LupaPasswordPageState();
}

class _LupaPasswordPageState extends State<LupaPasswordPage> {
  final _teleponController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.32,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/dimsum_bg2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 45,
                left: 24,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(color: Colors.black38, shape: BoxShape.circle),
                    child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                  ),
                ),
              ),
              Positioned(
                top: 45,
                right: 24,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(20)),
                  child: const Icon(Icons.dark_mode_outlined, color: Colors.white, size: 20),
                ),
              ),
              const Positioned(
                top: 50,
                left: 70,
                child: Text(
                  'Lupa sandi',
                  style: TextStyle(fontSize: 16, color: Colors.white70, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Dimi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFE08A33))),
                    const SizedBox(height: 8),
                    const Text('Lupa Kata Sandi?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),
                    const SizedBox(height: 8),
                    const Text(
                      'Masukkan nomor telepon yang terdaftar, kami akan mengirimkan kode untuk atur ulang kata sandi.',
                      style: TextStyle(fontSize: 13, color: Colors.black54, height: 1.4),
                    ),
                    const SizedBox(height: 24),

                    const Text('No. Telepon', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _teleponController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Masukkan nomor telepon',
                        hintStyle: const TextStyle(color: Colors.black26, fontSize: 14),
                        filled: true,
                        fillColor: const Color(0xFFFDF6F0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),
                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: kirim kode OTP, lalu Navigator ke kode_otp_page
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE08A33),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Kirim Kode', style: TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                    const SizedBox(height: 60),

                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black54, fontSize: 13),
                          children: [
                            const TextSpan(text: 'Sudah ingat kata sandi? '),
                            TextSpan(
                              text: 'Masuk',
                              style: const TextStyle(color: Color(0xFFE08A33), fontWeight: FontWeight.w600),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}