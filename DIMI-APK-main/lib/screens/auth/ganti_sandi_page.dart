import 'package:flutter/material.dart';

class GantiSandiPage extends StatefulWidget {
  const GantiSandiPage({super.key});

  @override
  State<GantiSandiPage> createState() => _GantiSandiPageState();
}

class _GantiSandiPageState extends State<GantiSandiPage> {
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  bool get _hasMinLength => _passwordController.text.length >= 8;
  bool get _hasUpperLower =>
      RegExp(r'[a-z]').hasMatch(_passwordController.text) &&
      RegExp(r'[A-Z]').hasMatch(_passwordController.text);
  bool get _hasDigit => RegExp(r'[0-9]').hasMatch(_passwordController.text);
  bool get _hasSymbol => RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(_passwordController.text);

  int get _strengthScore =>
      [_hasMinLength, _hasUpperLower, _hasDigit, _hasSymbol].where((e) => e).length;

  String get _strengthLabel {
    switch (_strengthScore) {
      case 4:
        return 'Kuat';
      case 3:
        return 'Sedang';
      case 2:
        return 'Lemah';
      default:
        return 'Sangat lemah';
    }
  }

  Color get _strengthColor {
    switch (_strengthScore) {
      case 4:
        return Colors.green;
      case 3:
        return Colors.orange;
      default:
        return Colors.red;
    }
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        title: const Text('Ganti Kata Sandi', style: TextStyle(color: Colors.black87, fontSize: 16)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(color: Color(0xFFFDF0E6), shape: BoxShape.circle),
                child: const Icon(Icons.lock_reset, color: Color(0xFFE08A33), size: 32),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text('Buat Kata Sandi Baru', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'Pastikan kata sandi baru berbeda dari kata sandi yang pernah digunakan sebelumnya.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 24),

            // Kata Sandi Baru
            const Text('Kata Sandi Baru', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
            const SizedBox(height: 6),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFFDF6F0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: Colors.black26,
                  ),
                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Indikator kekuatan
            Row(
              children: List.generate(4, (index) {
                return Expanded(
                  child: Container(
                    height: 4,
                    margin: EdgeInsets.only(right: index < 3 ? 4 : 0),
                    decoration: BoxDecoration(
                      color: index < _strengthScore ? _strengthColor : Colors.black12,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 4),
            Text(
              'Kekuatan kata sandi: $_strengthLabel',
              style: TextStyle(fontSize: 12, color: _strengthColor, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),

            // Konfirmasi
            const Text('Konfirmasi Kata Sandi Baru', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
            const SizedBox(height: 6),
            TextField(
              controller: _confirmController,
              obscureText: _obscureConfirm,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFFDF6F0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirm ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: Colors.black26,
                  ),
                  onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Checklist syarat
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFDF0E6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Kata sandi harus memenuhi:', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  _buildChecklistItem('Minimal 8 karakter', _hasMinLength),
                  _buildChecklistItem('Mengandung huruf besar dan kecil', _hasUpperLower),
                  _buildChecklistItem('Mengandung angka', _hasDigit),
                  _buildChecklistItem('Mengandung simbol (!@#\$%)', _hasSymbol),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tombol Simpan
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _strengthScore == 4 && _passwordController.text == _confirmController.text
                    ? () {
                        // TODO: kirim password baru ke backend
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE08A33),
                  disabledBackgroundColor: Colors.black12,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Simpan Kata Sandi Baru', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 32),

            // Catatan bawah
            Row(
              children: const [
                Icon(Icons.lock_outline, size: 16, color: Colors.black45),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Setelah kata sandi diganti, kamu akan otomatis keluar dari perangkat lain.',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChecklistItem(String text, bool isMet) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(
            isMet ? Icons.check_circle : Icons.check_circle_outline,
            size: 16,
            color: isMet ? Colors.green : Colors.black26,
          ),
          const SizedBox(width: 8),
          Text(text, style: TextStyle(fontSize: 12, color: isMet ? Colors.black87 : Colors.black45)),
        ],
      ),
    );
  }
}