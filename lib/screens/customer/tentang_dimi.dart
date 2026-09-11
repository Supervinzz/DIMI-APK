import 'package:flutter/material.dart';

class TentangDimiPage extends StatelessWidget {
  const TentangDimiPage({super.key});

  static const Color kOrange = Color(0xFFF5821F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Dimi',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: kOrange,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Jajanan favorit, gampang dipesan.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Dimi adalah aplikasi pemesanan jajanan yang '
                      'memudahkan kamu memilih dan memesan '
                      'makanan favorit untuk diambil di rumah.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildDivider(),
                    const SizedBox(height: 20),
                    _buildSectionTitle('Tujuan Dimi'),
                    const SizedBox(height: 8),
                    const Text(
                      'Dimi dibuat untuk membuat proses pesan '
                      'jajanan jadi lebih mudah, cepat, dan praktis. '
                      'Kamu bisa melihat menu, memilih pesanan, lalu '
                      'menyiapkan pengambilan tanpa proses yang '
                      'ribet.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildDivider(),
                    const SizedBox(height: 20),
                    _buildSectionTitle('Keunggulan Dimi'),
                    const SizedBox(height: 12),
                    _buildKeunggulanItem(
                      icon: Icons.local_shipping_outlined,
                      title: 'Pengantaran Cepat',
                      description: 'Pesanan diproses dan diantar dengan cepat.',
                    ),
                    _buildKeunggulanItem(
                      icon: Icons.restaurant_outlined,
                      title: 'Fresh Setiap Hari',
                      description:
                          'Jajanan dibuat dengan bahan yang segar dan\nberkualitas.',
                    ),
                    _buildKeunggulanItem(
                      icon: Icons.account_balance_wallet_outlined,
                      title: 'Harga Bersahabat',
                      description:
                          'Pilihan jajanan enak dengan harga yang tetap\nterjangkau.',
                    ),
                    _buildKeunggulanItem(
                      icon: Icons.touch_app_outlined,
                      title: 'Pesan dengan Mudah',
                      description: 'Pilih menu dan pesan tanpa proses yang ribet.',
                    ),
                    _buildKeunggulanItem(
                      icon: Icons.star_border,
                      title: 'Rasa yang Konsisten',
                      description:
                          'Menjaga kualitas dan rasa di setiap pesanan.',
                      showDivider: false,
                    ),
                    const SizedBox(height: 8),
                    _buildDivider(),
                    const SizedBox(height: 20),
                    _buildSectionTitle('Menu Dimi'),
                    const SizedBox(height: 4),
                    _buildMenuItem('Dimsum'),
                    _buildMenuItem('Siomay'),
                    _buildMenuItem('Cilok'),
                    _buildMenuItem('Tahu Aci'),
                    _buildMenuItem('Frozen Food', showDivider: false),
                    const SizedBox(height: 20),
                    _buildDivider(),
                    const SizedBox(height: 20),
                    _buildSectionTitle('Punya pertanyaan?'),
                    const SizedBox(height: 8),
                    const Text(
                      'Kalau ingin tahu lebih lanjut tentang Dimi, menu, '
                      'pemesanan, atau hal lainnya, kamu bisa langsung '
                      'menghubungi kami melalui WhatsApp.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // TODO: aksi buka chat WhatsApp
                        },
                        icon: const Icon(Icons.chat_bubble_outline, size: 18),
                        label: const Text(
                          'Chat WhatsApp',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kOrange,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFEDEDED))),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          const Expanded(
            child: Text(
              'Tentang Dimi',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, color: Color(0xFFECECEC));
  }

  Widget _buildKeunggulanItem({
    required IconData icon,
    required String title,
    required String description,
    bool showDivider = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: kOrange),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, {bool showDivider = true}) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // TODO: aksi navigasi ke detail menu
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.black38, size: 20),
              ],
            ),
          ),
        ),
        if (showDivider) _buildDivider(),
      ],
    );
  }
}