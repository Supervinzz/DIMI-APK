import 'package:flutter/material.dart';

class DetailPesananPage extends StatelessWidget {
  final String deliveryMethod; // 'diantar' atau 'ambil_sendiri'
  final String status; // 'diproses', 'dikirim', 'selesai'

  const DetailPesananPage({
    super.key,
    required this.deliveryMethod,
    required this.status,
  });

  String get _statusTitle {
    switch (status) {
      case 'diproses':
        return 'Pesanan Sedang Diproses';
      case 'dikirim':
        return 'Pesanan Sedang Diantar';
      case 'selesai':
        return 'Pesanan Selesai';
      default:
        return 'Detail Pesanan';
    }
  }

  String get _statusSubtitle {
    switch (status) {
      case 'diproses':
        return 'Pesananmu sedang disiapkan oleh Dimi.';
      case 'dikirim':
        return 'Kurir sedang menuju alamatmu.';
      case 'selesai':
        return 'Terima kasih sudah pesan di Dimi!';
      default:
        return '';
    }
  }

  IconData get _statusIcon {
    switch (status) {
      case 'dikirim':
        return Icons.delivery_dining;
      case 'selesai':
        return Icons.check_circle_outline;
      default:
        return Icons.hourglass_top;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isTakeaway = deliveryMethod == 'ambil_sendiri';

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Detail Pesanan', style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Icon status + judul (beda teks tergantung status)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(color: Color(0xFFFDF0E6), shape: BoxShape.circle),
              child: Icon(_statusIcon, color: const Color(0xFFE08A33), size: 32),
            ),
            const SizedBox(height: 14),
            Text(_statusTitle, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(_statusSubtitle, style: const TextStyle(fontSize: 13, color: Colors.black54), textAlign: TextAlign.center),
            const SizedBox(height: 20),

            // Info pesanan
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  _infoRow('No. Pesanan', 'DM-20260827-001'),
                  const SizedBox(height: 8),
                  _infoRow('Waktu Pemesanan', '27 Agustus 2026, 10:30'),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Status Pembayaran', style: TextStyle(fontSize: 12, color: Colors.black45)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(color: const Color(0xFFFDF0E6), borderRadius: BorderRadius.circular(8)),
                        child: const Text('SUDAH DIBAYAR', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFFE08A33))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Daftar pesanan
            _sectionLabel(isTakeaway ? 'Pesanan' : 'DAFTAR PESANAN'),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/images/produk1.jpg', width: 48, height: 48, fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dimsum Mentai', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                        Text('2x', style: TextStyle(fontSize: 11, color: Colors.black45)),
                      ],
                    ),
                  ),
                  const Text('Rp45.000', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Info khusus: takeaway (lokasi ambil) vs diantar (alamat + estimasi)
            if (isTakeaway) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(color: Color(0xFFFDF0E6), shape: BoxShape.circle),
                      child: const Icon(Icons.storefront_outlined, color: Color(0xFFE08A33), size: 20),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ambil di Rumah Dimi', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                          SizedBox(height: 2),
                          Text('Tunjukkan detail pesanan saat mengambil', style: TextStyle(fontSize: 11, color: Colors.black45)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              _sectionLabel('INFORMASI PENGIRIMAN'),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.location_on_outlined, size: 16, color: Colors.black45),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ALAMAT PENGIRIMAN', style: TextStyle(fontSize: 10, color: Colors.black38)),
                              SizedBox(height: 2),
                              Text('Jl. Contoh No. 123', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.access_time, size: 16, color: Colors.black45),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ESTIMASI TIBA', style: TextStyle(fontSize: 10, color: Colors.black38)),
                            SizedBox(height: 2),
                            Text('11:30–12:00', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 16),

            // Ringkasan pembayaran
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  _summaryRow('Subtotal', 'Rp45.000'),
                  _summaryRow('Diskon', 'Rp0'),
                  if (!isTakeaway) _summaryRow('Ongkos Kirim', 'Rp5.000'),
                  const Divider(height: 20),
                  _summaryRow('Total', isTakeaway ? 'Rp45.000' : 'Rp50.000', isBold: true),
                ],
              ),
            ),
          ],
        ),
      ),

      // Tombol beda tergantung takeaway/diantar & status
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, -2))]),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                // TODO: kalau isTakeaway -> tandai pesanan selesai
                // kalau !isTakeaway -> Navigator ke lacak_pesanan_page
              },
              icon: Icon(isTakeaway ? Icons.check : Icons.local_shipping_outlined, color: Colors.white, size: 18),
              label: Text(isTakeaway ? 'Pesanan Selesai' : 'Lacak Pesanan', style: const TextStyle(color: Colors.white, fontSize: 15)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE08A33),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.black45)),
        Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _sectionLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(text, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.black45, letterSpacing: 0.5)),
    );
  }

  Widget _summaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: isBold ? 14 : 13, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: isBold ? Colors.black87 : Colors.black54)),
          Text(value, style: TextStyle(fontSize: isBold ? 15 : 13, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: isBold ? const Color(0xFFE08A33) : Colors.black87)),
        ],
      ),
    );
  }
}