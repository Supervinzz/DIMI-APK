import 'package:flutter/material.dart';

class DetailProdukPage extends StatefulWidget {
  const DetailProdukPage({super.key});

  @override
  State<DetailProdukPage> createState() => _DetailProdukPageState();
}

class _DetailProdukPageState extends State<DetailProdukPage> {
  static const Color kOrange = Color(0xFFF5821F);

  final TextEditingController _catatanController = TextEditingController();

  int _selectedSausIndex = 0;
  int _jumlah = 1;

  final int _hargaSatuan = 12500;

  final List<Map<String, String>> _pilihanSaus = const [
    {'nama': 'Sambal Dimsum Khas (Pedas Manis)', 'harga': 'Gratis'},
    {'nama': 'Chilli Oil Gurih', 'harga': 'Gratis'},
    {'nama': 'Tanpa Sambal', 'harga': 'Gratis'},
  ];

  String get _formattedSubtotal {
    final subtotal = _hargaSatuan * _jumlah;
    return 'Rp${_formatRupiah(subtotal)}';
  }

  String _formatRupiah(int value) {
    final str = value.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      final posFromRight = str.length - i;
      buffer.write(str[i]);
      if (posFromRight > 1 && posFromRight % 3 == 1) {
        buffer.write('.');
      }
    }
    return buffer.toString();
  }

  @override
  void dispose() {
    _catatanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildImageHeader(context),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 16),
                        _buildTitleRow(),
                        const SizedBox(height: 2),
                        const Text(
                          'Warung Dimsum Nusantara',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 18),
                        _buildDivider(),
                        const SizedBox(height: 16),
                        const Text(
                          'Deskripsi',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Dimsum ayam dengan isian daging ayam gurih pilihan, '
                          'disajikan hangat dengan tekstur lembut dan aroma '
                          'minyak wijen khas. Dilengkapi sambal cocol asam '
                          'manis pedas.',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                            height: 1.45,
                          ),
                        ),
                        const SizedBox(height: 18),
                        _buildDivider(),
                        const SizedBox(height: 16),
                        _buildSausSection(),
                        const SizedBox(height: 18),
                        _buildDivider(),
                        const SizedBox(height: 16),
                        _buildCatatanSection(),
                        const SizedBox(height: 18),
                        _buildDivider(),
                        const SizedBox(height: 16),
                        _buildJumlahSection(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildImageHeader(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: Image.network(
            'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=800',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: const Color(0xFFEDEAE3),
              child: const Icon(Icons.image, size: 48, color: Colors.black26),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.black87, size: 20),
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Detail Produk',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      shadows: [
                        Shadow(color: Colors.black45, blurRadius: 6),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitleRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Text(
            'Dimsum Ayam',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
        ),
        Text(
          'Rp${_formatRupiah(_hargaSatuan)}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: kOrange,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, color: Color(0xFFECECEC));
  }

  Widget _buildSausSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Pilihan Saus Cocolan',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                'Pilih 1',
                style: TextStyle(fontSize: 11, color: Colors.black54),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        for (int i = 0; i < _pilihanSaus.length; i++) _buildSausOption(i),
      ],
    );
  }

  Widget _buildSausOption(int index) {
    final data = _pilihanSaus[index];
    final bool selected = _selectedSausIndex == index;

    return InkWell(
      onTap: () {
        setState(() => _selectedSausIndex = index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Radio<int>(
              value: index,
              groupValue: _selectedSausIndex,
              onChanged: (v) {
                setState(() => _selectedSausIndex = v ?? 0);
              },
              activeColor: kOrange,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                data['nama']!,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
            Text(
              data['harga']!,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCatatanSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Catatan Pesanan ',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            Text(
              '(Opsional)',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black38,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _catatanController,
          maxLines: 2,
          style: const TextStyle(fontSize: 13),
          decoration: InputDecoration(
            hintText: 'Contoh: Saus dipisah, kukus lebih lama',
            hintStyle: const TextStyle(fontSize: 13, color: Colors.black38),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: kOrange),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildJumlahSection() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Jumlah',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Atur porsi pesanan',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        _buildQuantityStepper(),
      ],
    );
  }

  Widget _buildQuantityStepper() {
    return Row(
      children: [
        _buildStepperButton(
          icon: Icons.remove,
          onTap: () {
            if (_jumlah > 1) {
              setState(() => _jumlah--);
            }
          },
          isFilled: false,
        ),
        Container(
          width: 36,
          alignment: Alignment.center,
          child: Text(
            '$_jumlah',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
        _buildStepperButton(
          icon: Icons.add,
          onTap: () {
            setState(() => _jumlah++);
          },
          isFilled: true,
        ),
      ],
    );
  }

  Widget _buildStepperButton({
    required IconData icon,
    required VoidCallback onTap,
    required bool isFilled,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: isFilled ? kOrange : const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          icon,
          size: 16,
          color: isFilled ? Colors.white : Colors.black54,
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
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
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SUBTOTAL',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black45,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _formattedSubtotal,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                height: 46,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // TODO: aksi tambah ke keranjang
                  },
                  icon: const Icon(Icons.shopping_cart_outlined, size: 18),
                  label: const Text(
                    'Tambah ke Keranjang',
                    style: TextStyle(
                      fontSize: 14,
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
            ),
          ],
        ),
      ),
    );
  }
}
