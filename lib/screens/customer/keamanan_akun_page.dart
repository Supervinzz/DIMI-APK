import 'package:flutter/material.dart';

class KeamananAkunPage extends StatefulWidget {
  const KeamananAkunPage({super.key});

  @override
  State<KeamananAkunPage> createState() => _KeamananAkunPageState();
}

class _KeamananAkunPageState extends State<KeamananAkunPage> {
  int? _expandedIndex; // null = semua collapsed, 0 = Kata Sandi, 1 = Nomor HP
  final _nomorBaruController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nomorBaruController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nomorBaruController.dispose();
    super.dispose();
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
        title: const Text('Keamanan Akun', style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Icon + judul
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(color: Color(0xFFFDF0E6), shape: BoxShape.circle),
              child: const Icon(Icons.shield_outlined, color: Color(0xFFE08A33), size: 32),
            ),
            const SizedBox(height: 14),
            const Text(
              'Jaga Keamanan Akun Anda',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            const Text(
              'Kelola kata sandi dan pengaturan keamanan akun Anda.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 24),

            // Section: Pengaturan Keamanan
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'PENGATURAN KEAMANAN',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.black38, letterSpacing: 0.5),
              ),
            ),
            const SizedBox(height: 10),

            // Item: Kata Sandi
            _ExpandableItem(
              icon: Icons.lock_outline,
              title: 'Kata Sandi',
              subtitle: 'Ubah kata sandi akun Anda',
              isExpanded: _expandedIndex == 0,
              onTap: () => setState(() => _expandedIndex = _expandedIndex == 0 ? null : 0),
              expandedChild: _KataSandiForm(
                onBatal: () => setState(() => _expandedIndex = null),
              ),
            ),
            const SizedBox(height: 10),

            // Item: Nomor HP
            _ExpandableItem(
              icon: Icons.phone_iphone,
              title: 'Nomor HP',
              subtitle: '0812 •••• 5678',
              isExpanded: _expandedIndex == 1,
              onTap: () => setState(() => _expandedIndex = _expandedIndex == 1 ? null : 1),
              expandedChild: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Nomor HP Saat Ini', style: TextStyle(fontSize: 12, color: Colors.black54)),
                    const SizedBox(height: 6),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(10)),
                      child: const Text('0812 •••• 5678', style: TextStyle(fontSize: 13, color: Colors.black54)),
                    ),
                    const SizedBox(height: 14),
                    const Text('Nomor HP Baru', style: TextStyle(fontSize: 12, color: Colors.black54)),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _nomorBaruController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Masukkan nomor HP baru',
                        hintStyle: const TextStyle(color: Colors.black26, fontSize: 13),
                        prefixIcon: const Icon(Icons.phone_outlined, size: 18, color: Colors.black38),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.black12)),
                        contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _nomorBaruController.text.isEmpty
                            ? null
                            : () {
                                // TODO: kirim OTP verifikasi ke nomor baru, lalu Navigator ke kode_otp_page
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE08A33),
                          disabledBackgroundColor: Colors.black12,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text('Simpan Nomor HP', style: TextStyle(color: Colors.white, fontSize: 13)),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: TextButton(
                        onPressed: () => setState(() {
                          _expandedIndex = null;
                          _nomorBaruController.clear();
                        }),
                        child: const Text('Batal', style: TextStyle(color: Colors.black45, fontSize: 13)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Section: Akun
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'AKUN',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.black38, letterSpacing: 0.5),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: InkWell(
                onTap: () {
                  // TODO: dialog konfirmasi logout dari perangkat ini
                },
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(color: Color(0xFFFDF0E6), shape: BoxShape.circle),
                        child: const Icon(Icons.logout, size: 18, color: Color(0xFFE08A33)),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Keluar', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                            Text('Keluar dari perangkat ini', style: TextStyle(fontSize: 11, color: Colors.black45)),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right, color: Colors.black26, size: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Item accordion reusable buat "Kata Sandi" & "Nomor HP"
class _ExpandableItem extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final bool isExpanded;
  final VoidCallback onTap;
  final Widget expandedChild;

  const _ExpandableItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isExpanded,
    required this.onTap,
    required this.expandedChild,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(color: Color(0xFFFDF0E6), shape: BoxShape.circle),
                    child: Icon(icon, size: 18, color: const Color(0xFFE08A33)),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                        Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.black45)),
                      ],
                    ),
                  ),
                  Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.chevron_right, color: Colors.black26, size: 20),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: expandedChild,
            ),
        ],
      ),
    );
  }
}

// Form ganti kata sandi (dipakai di dalam _ExpandableItem "Kata Sandi")
class _KataSandiForm extends StatefulWidget {
  final VoidCallback onBatal;

  const _KataSandiForm({required this.onBatal});

  @override
  State<_KataSandiForm> createState() => _KataSandiFormState();
}

class _KataSandiFormState extends State<_KataSandiForm> {
  final _sandiSaatIniController = TextEditingController();
  final _sandiBaruController = TextEditingController();
  final _konfirmasiController = TextEditingController();

  bool _obscureSaatIni = true;
  bool _obscureBaru = true;
  bool _obscureKonfirmasi = true;

  @override
  void initState() {
    super.initState();
    _sandiSaatIniController.addListener(() => setState(() {}));
    _sandiBaruController.addListener(() => setState(() {}));
    _konfirmasiController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _sandiSaatIniController.dispose();
    _sandiBaruController.dispose();
    _konfirmasiController.dispose();
    super.dispose();
  }

  bool get _isFormValid =>
      _sandiSaatIniController.text.isNotEmpty &&
      _sandiBaruController.text.isNotEmpty &&
      _konfirmasiController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPasswordField(
            label: 'Kata Sandi Saat Ini',
            hint: 'Masukkan kata sandi saat ini',
            controller: _sandiSaatIniController,
            obscure: _obscureSaatIni,
            onToggle: () => setState(() => _obscureSaatIni = !_obscureSaatIni),
          ),
          const SizedBox(height: 14),
          _buildPasswordField(
            label: 'Kata Sandi Baru',
            hint: 'Masukkan kata sandi baru',
            controller: _sandiBaruController,
            obscure: _obscureBaru,
            onToggle: () => setState(() => _obscureBaru = !_obscureBaru),
          ),
          const SizedBox(height: 14),
          _buildPasswordField(
            label: 'Konfirmasi Kata Sandi Baru',
            hint: 'Konfirmasi kata sandi baru',
            controller: _konfirmasiController,
            obscure: _obscureKonfirmasi,
            onToggle: () => setState(() => _obscureKonfirmasi = !_obscureKonfirmasi),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isFormValid
                  ? () {
                      // TODO: validasi kata sandi baru == konfirmasi, lalu kirim ke backend
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE08A33),
                disabledBackgroundColor: Colors.black12,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Simpan Kata Sandi', style: TextStyle(color: Colors.white, fontSize: 13)),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: TextButton(
              onPressed: () {
                _sandiSaatIniController.clear();
                _sandiBaruController.clear();
                _konfirmasiController.clear();
                widget.onBatal();
              },
              child: const Text('Batal', style: TextStyle(color: Colors.black45, fontSize: 13)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required bool obscure,
    required VoidCallback onToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.black54)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black26, fontSize: 13),
            prefixIcon: const Icon(Icons.lock_outline, size: 18, color: Colors.black38),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.black12)),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            suffixIcon: IconButton(
              icon: Icon(obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined, size: 18, color: Colors.black26),
              onPressed: onToggle,
            ),
          ),
        ),
      ],
    );
  }
}