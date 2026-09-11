import 'package:flutter/material.dart';

class DetailPesananPage extends StatefulWidget {
  const DetailPesananPage({super.key});

  @override
  State<DetailPesananPage> createState() => _DetailPesananPageState();
}

class _DetailPesananPageState extends State<DetailPesananPage> {
  final List<Map<String, dynamic>> _items = [
    {'name': 'Dimsum Mentai', 'unitPrice': 'Rp22.500', 'total': 'Rp45.000', 'qty': 2, 'image': 'produk1.jpg'},
    {'name': 'Siomay Ayam', 'unitPrice': 'Rp15.000', 'total': 'Rp30.000', 'qty': 2, 'image': 'produk5.jpg'},
  ];

  void _updateQty(int index, int delta) {
    setState(() {
      final newQty = _items[index]['qty'] + delta;
      if (newQty >= 1) {
        _items[index]['qty'] = newQty;
        // TODO: hitung ulang total per item & subtotal keseluruhan
      }
    });
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
        title: const Text('Detail Pesanan', style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // No. Pesanan & Waktu
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('No. Pesanan', style: TextStyle(fontSize: 11, color: Colors.black45)),
                        SizedBox(height: 2),
                        Text('DM-20260827-001', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Waktu Pemesanan', style: TextStyle(fontSize: 11, color: Colors.black45)),
                        SizedBox(height: 2),
                        Text('27 Agt 2026, 10:30', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Info ambil di rumah
            Container(
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
            const SizedBox(height: 16),

            // Pesanan (list item dengan stepper qty)
            const Text('Pesanan', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...List.generate(_items.length, (index) {
              final item = _items[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/images/${item['image']}', width: 48, height: 48, fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['name'], style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                          Text('${item['qty']} x ${item['unitPrice']}', style: const TextStyle(fontSize: 11, color: Colors.black45)),
                        ],
                      ),
                    ),
                    Text(item['total'], style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                    const SizedBox(width: 12),
                    _QtyStepper(
                      qty: item['qty'],
                      onDecrease: () => _updateQty(index, -1),
                      onIncrease: () => _updateQty(index, 1),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 8),

            // Metode Pembayaran
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: const [
                  Icon(Icons.qr_code_scanner, size: 18, color: Colors.black54),
                  SizedBox(width: 10),
                  Text('Metode Pembayaran', style: TextStyle(fontSize: 13)),
                  Spacer(),
                  Text('QRIS', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Rincian Pembayaran
            const Text('Rincian Pembayaran', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _summaryRow('Subtotal', 'Rp75.000'),
            _summaryRow('Biaya layanan', 'Rp0'),
            const Divider(height: 20),
            _summaryRow('Total Pembayaran', 'Rp75.000', isBold: true),
          ],
        ),
      ),

      // Tombol bawah
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, -2))],
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: konfirmasi pesanan selesai / kembali ke beranda
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE08A33),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Pesanan Selesai', style: TextStyle(color: Colors.white, fontSize: 15)),
            ),
          ),
        ),
      ),
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

// Stepper qty (-  angka  +)
class _QtyStepper extends StatelessWidget {
  final int qty;
  final VoidCallback onDecrease, onIncrease;

  const _QtyStepper({required this.qty, required this.onDecrease, required this.onIncrease});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onDecrease,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.black26)),
            child: const Icon(Icons.remove, size: 14, color: Colors.black54),
          ),
        ),
        SizedBox(width: 24, child: Text('$qty', textAlign: TextAlign.center, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600))),
        GestureDetector(
          onTap: onIncrease,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(color: Color(0xFFE08A33), shape: BoxShape.circle),
            child: const Icon(Icons.add, size: 14, color: Colors.white),
          ),
        ),
      ],
    );
  }
}