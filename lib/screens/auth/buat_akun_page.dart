import 'package:dimi/screens/auth/masuk_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class BuatAkunPage extends StatefulWidget {
  const BuatAkunPage({super.key});

  @override
  State<BuatAkunPage> createState() => _BuatAkunPageState();
}

class _BuatAkunPageState extends State<BuatAkunPage> {
  bool _obscurePassword = true;
  final _namaController = TextEditingController();
  final _hpController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Bagian foto atas
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.22,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/login.png',
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
                  'Buat Akun',
                  style: TextStyle(fontSize: 16, color: Colors.white70, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),

          // Card putih form
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Dimi', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFE08A33))),
                    const SizedBox(height: 6),
                    const Text('Buat akun Dimi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
                    const SizedBox(height: 4),
                    const Text('Yuk buat akun untuk mulai pesan.', style: TextStyle(fontSize: 13, color: Colors.black54)),
                    const SizedBox(height: 20),

                    _buildLabel('Nama Lengkap'),
                    _buildField(_namaController, 'Masukkan nama lengkap'),
                    const SizedBox(height: 14),

                    _buildLabel('No. HP'),
                    _buildField(_hpController, 'Masukkan nomor HP', keyboardType: TextInputType.phone),
                    const SizedBox(height: 14),

                    _buildLabel('Email'),
                    _buildField(_emailController, 'Masukkan email', keyboardType: TextInputType.emailAddress),
                    const SizedBox(height: 14),

                    _buildLabel('Password'),
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: _inputDecoration('Masukkan password').copyWith(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            color: Colors.black26,
                          ),
                          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: proses daftar akun
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE08A33),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Daftar', style: TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                    const SizedBox(height: 14),

                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black54, fontSize: 13),
                          children: [
                            const TextSpan(text: 'Sudah punya akun? '),
                            TextSpan(
                              text: 'Masuk',
                              style: const TextStyle(color: Color(0xFFE08A33), fontWeight: FontWeight.w600),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const MasukPage()),
                                  );
                                },
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

  Widget _buildLabel(String text) {
    return Text(text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500));
  }

  Widget _buildField(TextEditingController controller, String hint, {TextInputType? keyboardType}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: _inputDecoration(hint),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.black26, fontSize: 14),
      filled: true,
      fillColor: const Color(0xFFFDF6F0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }
}