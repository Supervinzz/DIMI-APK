import 'package:flutter/material.dart';

class TambahAlamatBaruPage extends StatefulWidget {
  const TambahAlamatBaruPage({super.key});

  @override
  State<TambahAlamatBaruPage> createState() => _TambahAlamatBaruPageState();
}

class _TambahAlamatBaruPageState extends State<TambahAlamatBaruPage> {
  static const Color kOrange = Color(0xFFF5821F);
  static const Color kOrangeLight = Color(0xFFFDEFE1);
  static const Color kBorder = Color(0xFFE0E0E0);

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _teleponController = TextEditingController();
  final TextEditingController _alamatLengkapController =
      TextEditingController();
  final TextEditingController _kodePosController = TextEditingController();
  final TextEditingController _labelController = TextEditingController();
  final TextEditingController _catatanController = TextEditingController();

  String? _provinsi;
  String? _kotaKabupaten;
  String? _kecamatan;
  String? _kelurahan;

  int _selectedLabelIndex = 0;
  final List<String> _labelPreset = const ['Rumah', 'Kantor', 'Lainnya'];

  @override
  void initState() {
    super.initState();
    _catatanController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _namaController.dispose();
    _teleponController.dispose();
    _alamatLengkapController.dispose();
    _kodePosController.dispose();
    _labelController.dispose();
    _catatanController.dispose();
    super.dispose();
  }

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
                    const SizedBox(height: 16),
                    _buildSectionTitle('Informasi Penerima'),
                    const SizedBox(height: 12),
                    _buildFieldLabel('Nama Penerima'),
                    const SizedBox(height: 6),
                    _buildTextField(
                      controller: _namaController,
                      hint: 'Masukkan nama penerima',
                      prefixIcon: Icons.person_outline,
                    ),
                    const SizedBox(height: 14),
                    _buildFieldLabel('Nomor Telepon'),
                    const SizedBox(height: 6),
                    _buildPhoneField(),
                    const SizedBox(height: 22),
                    _buildSectionTitle('Alamat'),
                    const SizedBox(height: 12),
                    _buildFieldLabel('Alamat Lengkap'),
                    const SizedBox(height: 6),
                    _buildTextField(
                      controller: _alamatLengkapController,
                      hint:
                          'Masukkan alamat lengkap (Nama\njalan, nomor rumah, RT/RW)',
                      prefixIcon: Icons.location_on_outlined,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 14),
                    _buildFieldLabel('Provinsi'),
                    const SizedBox(height: 6),
                    _buildDropdown(
                      hint: 'Pilih provinsi',
                      value: _provinsi,
                      items: const ['Jawa Barat', 'DKI Jakarta', 'Jawa Timur'],
                      onChanged: (v) => setState(() => _provinsi = v),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildFieldLabel('Kota / Kabupaten'),
                              const SizedBox(height: 6),
                              _buildDropdown(
                                hint: 'Pilih kota / kab',
                                value: _kotaKabupaten,
                                items: const ['Karawang', 'Bandung', 'Bekasi'],
                                onChanged: (v) =>
                                    setState(() => _kotaKabupaten = v),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildFieldLabel('Kecamatan'),
                              const SizedBox(height: 6),
                              _buildDropdown(
                                hint: 'Pilih kecamatan',
                                value: _kecamatan,
                                items: const ['Tebet', 'Klari', 'Cikampek'],
                                onChanged: (v) =>
                                    setState(() => _kecamatan = v),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    _buildFieldLabel('Kelurahan / Desa'),
                    const SizedBox(height: 6),
                    _buildDropdown(
                      hint: 'Pilih kelurahan / desa',
                      value: _kelurahan,
                      items: const ['Contoh Indah', 'Tebet Barat'],
                      onChanged: (v) => setState(() => _kelurahan = v),
                    ),
                    const SizedBox(height: 14),
                    _buildFieldLabel('Kode Pos'),
                    const SizedBox(height: 6),
                    _buildTextField(
                      controller: _kodePosController,
                      hint: 'Masukkan kode pos',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 22),
                    _buildSectionTitle('Detail Tambahan'),
                    const SizedBox(height: 12),
                    _buildFieldLabel('Label Alamat (Opsional)'),
                    const SizedBox(height: 6),
                    _buildTextField(
                      controller: _labelController,
                      hint: 'Contoh: Rumah, Kantor, Kos',
                      prefixIcon: Icons.label_outline,
                    ),
                    const SizedBox(height: 10),
                    _buildLabelChips(),
                    const SizedBox(height: 14),
                    _buildFieldLabel('Catatan untuk kurir (Opsional)'),
                    const SizedBox(height: 6),
                    _buildTextField(
                      controller: _catatanController,
                      hint: 'Contoh: Pagar hitam, bel rumah\nrusak,\ndll',
                      prefixIcon: Icons.description_outlined,
                      maxLines: 3,
                      maxLength: 100,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: aksi simpan alamat
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
                          'Simpan Alamat',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
              'Tambah Alamat Baru',
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

  Widget _buildFieldLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.black54,
      ),
    );
  }

  InputDecoration _baseDecoration({
    required String hint,
    IconData? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 13, color: Colors.black38),
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, size: 18, color: Colors.black38)
          : null,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: kBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: kBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: kOrange),
      ),
      counterText: '',
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    IconData? prefixIcon,
    int maxLines = 1,
    int? maxLength,
    TextInputType? keyboardType,
  }) {
    return Stack(
      children: [
        TextField(
          controller: controller,
          maxLines: maxLines,
          maxLength: maxLength,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 13),
          decoration: _baseDecoration(hint: hint, prefixIcon: prefixIcon),
        ),
        if (maxLength != null)
          Positioned(
            right: 10,
            bottom: 6,
            child: Text(
              '${controller.text.length}/$maxLength',
              style: const TextStyle(fontSize: 10, color: Colors.black38),
            ),
          ),
      ],
    );
  }

  Widget _buildPhoneField() {
    return TextField(
      controller: _teleponController,
      keyboardType: TextInputType.phone,
      style: const TextStyle(fontSize: 13),
      decoration: _baseDecoration(
        hint: 'Masukkan nomor telepon',
        prefixIcon: Icons.phone_outlined,
        suffixIcon: IconButton(
          icon: const Icon(Icons.contacts_outlined, size: 18, color: kOrange),
          onPressed: () {
            // TODO: aksi ambil nomor dari kontak
          },
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.black45),
      style: const TextStyle(fontSize: 13, color: Colors.black87),
      decoration: _baseDecoration(hint: hint),
      hint: Text(
        hint,
        style: const TextStyle(fontSize: 13, color: Colors.black38),
      ),
      items: items
          .map((e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e, style: const TextStyle(fontSize: 13)),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildLabelChips() {
    return Row(
      children: List.generate(_labelPreset.length, (index) {
        final bool selected = _selectedLabelIndex == index;
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ChoiceChip(
            label: Text(_labelPreset[index]),
            selected: selected,
            onSelected: (_) {
              setState(() => _selectedLabelIndex = index);
            },
            labelStyle: TextStyle(
              fontSize: 12,
              color: selected ? kOrange : Colors.black54,
              fontWeight: FontWeight.w500,
            ),
            backgroundColor: Colors.white,
            selectedColor: kOrangeLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: selected ? kOrange : kBorder,
              ),
            ),
            showCheckmark: false,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          ),
        );
      }),
    );
  }
}