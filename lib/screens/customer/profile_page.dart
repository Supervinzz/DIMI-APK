import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Dimi',
          style: TextStyle(color: Color(0xFFE08A33), fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Info user + edit
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/avatar_default.jpg'),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Dimi User', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 2),
                      Text('0812 •••• 5678', style: TextStyle(fontSize: 13, color: Colors.black54)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(color: Color(0xFFFDF0E6), shape: BoxShape.circle),
                  child: const Icon(Icons.edit_outlined, color: Color(0xFFE08A33), size: 18),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Pesanan Saya
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Pesanan Saya', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {
                    // TODO: Navigator ke pesanan_page (lihat semua)
                  },
                  child: const Text('Lihat Semua >', style: TextStyle(fontSize: 12, color: Colors.black45)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _OrderStatusItem(icon: Icons.receipt_long_outlined, label: 'Belum Bayar', badgeCount: 1),
                _OrderStatusItem(icon: Icons.inventory_2_outlined, label: 'Diproses'),
                _OrderStatusItem(icon: Icons.local_shipping_outlined, label: 'Dikirim'),
                _OrderStatusItem(icon: Icons.check_circle_outline, label: 'Selesai'),
              ],
            ),
            const SizedBox(height: 24),

            // Akun Saya
            _sectionLabel('Akun Saya'),
            _ProfileMenuItem(
              icon: Icons.location_on_outlined,
              label: 'Alamat Pengiriman',
              onTap: () {
                // TODO: Navigator ke halaman alamat
              },
            ),
            _ProfileMenuItem(
              icon: Icons.credit_card_outlined,
              label: 'Pembayaran',
              onTap: () {
                // TODO: Navigator ke payment_page
              },
            ),
            _ProfileMenuItem(
              icon: Icons.shield_outlined,
              label: 'Keamanan Akun',
              onTap: () {
                // TODO: Navigator ke keamanan_akun_page
              },
            ),
            const SizedBox(height: 20),

            // Pengaturan
            _sectionLabel('Pengaturan'),
            _ProfileMenuItem(
              icon: Icons.palette_outlined,
              label: 'Pilih Tema',
              trailingText: 'Terang',
              onTap: () {
                // TODO: buka dialog pilih tema (light/dark)
              },
            ),
            _ProfileMenuItem(
              icon: Icons.info_outline,
              label: 'Tentang Dimi',
              onTap: () {
                // TODO: Navigator ke halaman tentang
              },
            ),
            const SizedBox(height: 12),

            // Keluar
            InkWell(
              onTap: () {
                // TODO: proses logout
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Color(0xFFE08A33), size: 20),
                    SizedBox(width: 12),
                    Text('Keluar', style: TextStyle(color: Color(0xFFE08A33), fontWeight: FontWeight.w600, fontSize: 14)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: const Color(0xFFE08A33),
        unselectedItemColor: Colors.black38,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          // TODO: navigasi antar tab
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long_outlined), label: 'Pesanan'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu_outlined), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
    );
  }
}

// Icon status pesanan (Belum Bayar, Diproses, dst) dengan badge opsional
class _OrderStatusItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int? badgeCount;

  const _OrderStatusItem({required this.icon, required this.label, this.badgeCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(color: Color(0xFFFDF0E6), shape: BoxShape.circle),
              child: Icon(icon, color: const Color(0xFFE08A33), size: 22),
            ),
            if (badgeCount != null)
              Positioned(
                right: -2,
                top: -2,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: Text('$badgeCount', style: const TextStyle(color: Colors.white, fontSize: 9)),
                ),
              ),
          ],
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.black54)),
      ],
    );
  }
}

// List item menu (Alamat, Pembayaran, Pilih Tema, dst)
class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? trailingText;
  final VoidCallback onTap;

  const _ProfileMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: Colors.black54, size: 20),
            const SizedBox(width: 14),
            Expanded(child: Text(label, style: const TextStyle(fontSize: 14, color: Colors.black87))),
            if (trailingText != null) ...[
              Text(trailingText!, style: const TextStyle(fontSize: 12, color: Colors.black38)),
              const SizedBox(width: 4),
            ],
            const Icon(Icons.chevron_right, color: Colors.black26, size: 18),
          ],
        ),
      ),
    );
  }
}