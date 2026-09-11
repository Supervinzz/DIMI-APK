import 'package:flutter/material.dart';

class AlamatPengirimanPetaPage extends StatelessWidget {
  const AlamatPengirimanPetaPage({super.key});

  static const Color kOrange = Color(0xFFF5821F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ===== App Bar =====
            _buildAppBar(context),

            // ===== Map Section =====
            Expanded(
              child: Stack(
                children: [
                  // Peta (placeholder - ganti dengan GoogleMap widget jika sudah terintegrasi)
                  Positioned.fill(
                    child: Container(
                      color: const Color(0xFFEDEAE3),
                      child: CustomPaint(
                        painter: _FakeMapPainter(),
                        size: Size.infinite,
                      ),
                    ),
                  ),

                  // Label lokasi "Simpang Tebet"
                  Positioned(
                    left: 0,
                    top: MediaQuery.of(context).size.height * 0.28,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.circle, size: 8, color: kOrange),
                          SizedBox(width: 6),
                          Text(
                            'Simpang Tebet',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Pin lokasi di tengah peta
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Icon(
                        Icons.location_on,
                        color: kOrange,
                        size: 44,
                      ),
                    ),
                  ),

                  // Tombol "lokasi saya" (my location)
                  Positioned(
                    right: 16,
                    bottom: 16,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.my_location,
                        color: kOrange,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ===== Bottom Sheet: Lokasi Pengiriman =====
            _buildBottomSheet(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
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
          const SizedBox(width: 48), // penyeimbang tombol back
        ],
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Lokasi Pengiriman',
            style: TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on, color: kOrange, size: 22),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jl. Contoh No. 12',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Tebet Barat, Jakarta Selatan',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                // TODO: aksi gunakan lokasi ini
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
                'Gunakan Lokasi Ini',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Painter sederhana untuk mensimulasikan tampilan jalan pada peta
/// (gunakan GoogleMap/ Mapbox widget asli untuk implementasi produksi).
class _FakeMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6;

    final mainRoadPaint = Paint()
      ..color = const Color(0xFFF9D8A8)
      ..strokeWidth = 10;

    final buildingPaint = Paint()..color = const Color(0xFFE3DFD5);

    final parkPaint = Paint()..color = const Color(0xFFDCE8D8);

    // Jalan utama diagonal
    canvas.drawLine(
      Offset(size.width * 0.1, size.height * 0.15),
      Offset(size.width * 0.95, size.height * 0.55),
      mainRoadPaint,
    );

    // Jalan vertikal & horizontal
    canvas.drawLine(Offset(size.width * 0.15, 0),
        Offset(size.width * 0.15, size.height), roadPaint);
    canvas.drawLine(Offset(0, size.height * 0.55),
        Offset(size.width, size.height * 0.55), roadPaint);
    canvas.drawLine(Offset(size.width * 0.7, 0),
        Offset(size.width * 0.7, size.height), roadPaint);

    // Blok bangunan
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.25, size.height * 0.1, 60, 40),
      buildingPaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.55, size.height * 0.08, 70, 45),
      buildingPaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.3, size.height * 0.65, 65, 40),
      buildingPaint,
    );

    // Taman (lingkaran hijau di kanan bawah)
    canvas.drawCircle(
      Offset(size.width * 0.85, size.height * 0.7),
      60,
      parkPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}