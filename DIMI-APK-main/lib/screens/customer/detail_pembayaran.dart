import 'package:flutter/material.dart';

class DetailPembayaranPage extends StatelessWidget {
  const DetailPembayaranPage({super.key});

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
        title: const Text('Detail Pembayaran', style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status berhasil
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), shape: BoxShape.circle),
                    child: const Icon(Icons.check, color: Colors.green, size: 24),
                  ),
                  const SizedBox(height: 10),
                  const Text('Pembayaran Berhasil', style: TextStyle(fontSize: 13, color: Colors.green, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 6),
                  const Text('Rp48.500', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text('Senin, 7 September 2026 • 14:32 WIB', style: TextStyle(fontSize: 12, color: Colors.black45)),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Informasi Transaksi
            _cardSection(
              title: 'Informasi Transaksi',
              child: Column(
                children: [
                  _infoRow('No. Pesanan', '#DIMI-8842'),
                  const SizedBox(height: 8),
                  _infoRow('Tanggal Pemesanan', 'Senin, 7 September 2026'),
                  const SizedBox(height: 8),
                  _infoRow('Waktu Pemesanan', '14:25 WIB'),
                  const SizedBox(height: 8),
                  _infoRow('Waktu Pembayaran', '14:32 WIB'),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ID Pembayaran', style: TextStyle(fontSize: 12, color: Colors.black45)),
                      Row(
                        children: [
                          const Text('PAY-8842-0916', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              // TODO: copy ke clipboard
                            },
                            child: const Icon(Icons.copy, size: 14, color: Colors.black38),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Detail Pesanan
            _cardSection(
              title: null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.storefront_outlined, size: 16, color: Colors.black54),
                          SizedBox(width: 6),
                          Text('Warung Dimsum Nusantara', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(6)),
                        child: const Text('3 Item', style: TextStyle(fontSize: 10, color: Colors.black54)),
                      ),
                    ],
                  ),
                  const Divider(height: 20),
                  _orderItemRow('Dimsum Ayam', '2 x Rp12.500', 'Rp25.000'),
                  const SizedBox(height: 10),
                  _orderItemRow('Hakau Udang', '1 x Rp15.000', 'Rp15.000'),
                  const SizedBox(height: 10),
                  _orderItemRow('Es Teh Manis (Less Sugar)', '1 x Rp5.000', 'Rp5.000'),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Rincian Pembayaran
            _cardSection(
              title: 'Rincian Pembayaran',
              child: Column(
                children: [
                  _summaryRow('Subtotal Produk', 'Rp45.000'),
                  _summaryRow('Biaya Layanan', 'Rp1.500'),
                  _summaryRow('Biaya Pengantaran', 'Rp6.000'),
                  _summaryRow('Diskon Pengantaran', '-Rp4.000', valueColor: Colors.green),
                  const Divider(height: 20),
                  _summaryRow('Total Pembayaran', 'Rp48.500', isBold: true),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Metode Pembayaran
            _cardSection(
              title: 'Metode Pembayaran',
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: const Color(0xFFFDF0E6), borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.account_balance_wallet_outlined, color: Color(0xFFE08A33), size: 18),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('DimiPay', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                        Text('Saldo terpotong otomatis', style: TextStyle(fontSize: 11, color: Colors.black45)),
                      ],
                    ),
                  ),
                  const Text('Lunas', style: TextStyle(fontSize: 12, color: Colors.green, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Bantuan Pesanan
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  // TODO: Navigator ke halaman bantuan/CS
                },
                icon: const Icon(Icons.help_outline, size: 18, color: Colors.black54),
                label: const Text('Bantuan Pesanan', style: TextStyle(color: Colors.black87, fontSize: 13)),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  side: const BorderSide(color: Colors.black12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Footer note
            const Center(
              child: Text(
                'Dimi • Bukti pembayaran resmi untuk Warung Dimsum Nusantara',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, color: Colors.black38),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardSection({required String? title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
          ],
          child,
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.black45)),
        Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _orderItemRow(String name, String detail, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
              Text(detail, style: const TextStyle(fontSize: 11, color: Colors.black45)),
            ],
          ),
        ),
        Text(price, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _summaryRow(String label, String value, {bool isBold = false, Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: isBold ? 14 : 13, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: isBold ? Colors.black87 : Colors.black54)),
          Text(
            value,
            style: TextStyle(
              fontSize: isBold ? 15 : 13,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: valueColor ?? (isBold ? const Color(0xFFE08A33) : Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}