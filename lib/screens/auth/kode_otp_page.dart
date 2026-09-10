import 'dart:async';
import 'package:flutter/material.dart';

class KodeOtpPage extends StatefulWidget {
  final String noTelepon; // dikirim dari lupa_password_page, misal "+62 812 ●●●● 5678"

  const KodeOtpPage({super.key, required this.noTelepon});

  @override
  State<KodeOtpPage> createState() => _KodeOtpPageState();
}

class _KodeOtpPageState extends State<KodeOtpPage> {
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  Timer? _timer;
  int _secondsLeft = 45;
  bool _isError = false; // toggle true kalau backend bilang OTP salah

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsLeft = 45;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft == 0) {
        timer.cancel();
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  String get _formattedTime {
    final minutes = (_secondsLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsLeft % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _onDigitChanged(int index, String value) {
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
    // TODO: kalau semua 6 kotak udah keisi, otomatis trigger verifikasi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        title: const Text('Verifikasi Nomor', style: TextStyle(color: Colors.black87, fontSize: 16)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          children: [
            // Icon shield
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFDF0E6),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.verified_user_outlined, color: Color(0xFFE08A33), size: 32),
            ),
            const SizedBox(height: 20),

            const Text('Masukkan Kode OTP', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              'Kami telah mengirim kode OTP ke nomor',
              style: TextStyle(fontSize: 13, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.noTelepon,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
            const SizedBox(height: 24),

            // 6 kotak digit OTP
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: SizedBox(
                    width: 42,
                    height: 48,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        fillColor: const Color(0xFFFDF6F0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: _isError ? Colors.red : const Color(0xFFE0C4A8)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFFE08A33)),
                        ),
                      ),
                      onChanged: (value) => _onDigitChanged(index, value),
                    ),
                  ),
                );
              }),
            ),

            // Pesan error
            if (_isError) ...[
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.error_outline, color: Colors.red, size: 14),
                  SizedBox(width: 4),
                  Text('Kode OTP salah. Silakan coba lagi.', style: TextStyle(color: Colors.red, fontSize: 12)),
                ],
              ),
            ],

            const SizedBox(height: 20),

            // Countdown / kirim ulang
            Text(
              _secondsLeft > 0 ? 'Kirim ulang kode dalam $_formattedTime' : 'Belum menerima kode?',
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
            const SizedBox(height: 4),
            TextButton(
              onPressed: _secondsLeft == 0
                  ? () {
                      // TODO: trigger kirim ulang OTP ke backend
                      _startTimer();
                    }
                  : null,
              child: Text(
                'Kirim Ulang Kode',
                style: TextStyle(
                  color: _secondsLeft == 0 ? const Color(0xFFE08A33) : Colors.black26,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Peringatan keamanan
            Row(
              children: const [
                Icon(Icons.lock_outline, size: 16, color: Colors.black45),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Jangan bagikan kode OTP kepada siapapun, termasuk pihak Dimi.',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Tombol Verifikasi
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final otp = _controllers.map((c) => c.text).join();
                  if (otp.length < 6) {
                    setState(() => _isError = true);
                    return;
                  }
                  // TODO: kirim otp ke backend buat verifikasi
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE08A33),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Verifikasi', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}