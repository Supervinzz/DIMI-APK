import 'package:flutter/material.dart';

class AlamatTersimpan {
  final String label;
  final IconData icon;
  final bool isUtama;
  final bool isSelected;
  final String alamat;
  final String kecamatan;
  final String namaPenerima;
  final String nomorHp;

  const AlamatTersimpan({
    required this.label,
    required this.icon,
    this.isUtama = false,
    this.isSelected = false,
    required this.alamat,
    required this.kecamatan,
    required this.namaPenerima,
    required this.nomorHp,
  });
}

class AlamatPengirimanListPage extends StatefulWidget {
  const AlamatPengirimanListPage({super.key});

  @override
  State<AlamatPengirimanListPage> createState() =>
      _AlamatPengirimanListPageState();
}

class _AlamatPengirimanListPageState extends State<AlamatPengirimanListPage> {
  static const Color kOrange = Color(0xFFF5821F);
  static const Color kOrangeLight = Color(0xFFFDEFE1);

  int _selectedIndex = 0;

  final List<AlamatTersimpan> _daftarAlamat = const [
    AlamatTersimpan(
      label: 'Rumah',
      icon: Icons.home,
      isUtama: true,
      isSelected: true,
      alamat: 'Jl. Contoh No. 123',
      kecamatan: 'Kec. Contoh, Kota Contoh,\n12345',
      namaPenerima: 'Dewi',
      nomorHp: '0812 3456 7890',
    ),
    AlamatTersimpan(
      label: 'Kantor',
      icon: Icons.apartment,
      alamat: 'Jl. Contoh Raya No. 45, Lt. 3',
      kecamatan: 'Kec. Contoh, Kota Contoh,\n12345',
      namaPenerima: 'Dewi',
      nomorHp: '0812 3456 7890',
    ),
    AlamatTersimpan(
      label: 'Orang Tua',
      icon: Icons.favorite_border,
      alamat: 'Jl. Contoh Indah No. 8',
      kecamatan: 'Kec. Contoh, Kota Contoh,\n12345',
      namaPenerima: 'Ibu',
      nomorHp: '0812 9876 5432',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
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
                      'Alamat Tersimpan',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    for (int i = 0; i < _daftarAlamat.length; i++) ...[
                      _buildAlamatCard(_daftarAlamat[i], i),
                      const SizedBox(height: 12),
                    ],
                    const SizedBox(height: 8),
                    const Text(
                      'Alamat Lainnya',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildActionCard(
                      icon: Icons.map_outlined,
                      iconColor: kOrange,
                      iconBg: kOrangeLight,
                      title: 'Pilih di Peta',
                      subtitle: 'Tentukan lokasi dengan\nmemilih di peta',
                      onTap: () {
                        // TODO: navigasi ke halaman pilih lokasi di peta
                      },
                    ),
                    const SizedBox(height: 12),
                    _buildActionCard(
                      icon: Icons.add,
                      iconColor: kOrange,
                      iconBg: kOrangeLight,
                      title: 'Tambah Alamat Baru',
                      subtitle: 'Tambahkan alamat\npengiriman baru',
                      onTap: () {
                        // TODO: navigasi ke halaman tambah alamat baru
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildInfoBanner(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            _buildBottomButton(),
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
              'Alamat Pengiriman',
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

  Widget _buildAlamatCard(AlamatTersimpan data, int index) {
    final bool selected = _selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected ? kOrangeLight : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? kOrange : const Color(0xFFECECEC),
            width: selected ? 1.4 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(data.icon, size: 20, color: Colors.black87),
                const SizedBox(width: 8),
                Text(
                  data.label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                if (data.isUtama) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: kOrange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Utama',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
                const Spacer(),
                if (selected)
                  const Icon(Icons.check_circle, color: kOrange, size: 22)
                else
                  const Icon(Icons.more_vert, color: Colors.black45, size: 20),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.alamat,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    data.kecamatan,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${data.namaPenerima} • ${data.nomorHp}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      if (!selected)
                        const Icon(Icons.chevron_right,
                            color: Colors.black38, size: 18),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFECECEC)),
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
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
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.black38),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBanner() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kOrangeLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(Icons.lock, color: kOrange, size: 16),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Alamat Anda akan digunakan untuk\npengiriman dan dijaga kerahasiaannya.',
              style: TextStyle(
                fontSize: 11,
                color: Colors.black87,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SizedBox(
        height: 48,
        child: ElevatedButton(
          onPressed: () {
            // TODO: aksi konfirmasi alamat terpilih (_selectedIndex)
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kOrange,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Pilih Alamat Ini',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}