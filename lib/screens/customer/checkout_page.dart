import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String _deliveryMethod = 'diantar'; // 'diantar' atau 'ambil_sendiri'
  String? _paymentMethod; // 'qris' atau 'tunai'
  final _catatanController = TextEditingController();

  @override
  void dispose() {
    _catatanController.dispose();
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
        title: const Text('Checkout', style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Metode pengiriman
            const Text('Pesanan diantar atau ambil sendiri?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _DeliveryOption(
                    icon: Icons.delivery_dining,
                    label: 'Diantar',
                    isSelected: _deliveryMethod == 'diantar',
                    onTap: () => setState(() => _deliveryMethod = 'diantar'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _DeliveryOption(
                    icon: Icons.storefront_outlined,
                    label: 'Ambil sendiri',
                    isSelected: _deliveryMethod == 'ambil_sendiri',
                    onTap: () => setState(() => _deliveryMethod = 'ambil_sendiri'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Alamat (cuma tampil kalau diantar)
            if (_deliveryMethod == 'diantar') ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.location_on_outlined, size: 18, color: Colors.black54),
                      SizedBox(width: 6),
                      Text('Alamat pengiriman', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Navigator ke halaman ubah alamat
                    },
                    child: const Text('Ubah', style: TextStyle(color: Color(0xFFE08A33), fontSize: 12)),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text('Jl. Contoh No. 123', style: TextStyle(fontSize: 13, color: Colors.black54)),
              ),
              TextButton.icon(
                onPressed: () {
                  // TODO: Navigator ke tambah alamat baru
                },
                icon: const Icon(Icons.add, size: 16, color: Color(0xFFE08A33)),
                label: const Text('Tambah alamat baru', style: TextStyle(color: Color(0xFFE08A33), fontSize: 13)),
                style: TextButton.styleFrom(padding: EdgeInsets.zero, alignment: Alignment.centerLeft),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black12)),
                child: Row(
                  children: const [
                    Icon(Icons.access_time, size: 16, color: Colors.black45),
                    SizedBox(width: 8),
                    Text('Tiba sekitar 11:30–12:00', style: TextStyle(fontSize: 12, color: Colors.black54)),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 12),

            // Pesananmu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Pesananmu', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {
                    // TODO: Navigator balik ke menu buat nambah item
                  },
                  child: const Text('Tambah', style: TextStyle(color: Color(0xFFE08A33), fontSize: 12)),
                ),
              ],
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/produk1.jpg', width: 50, height: 50, fit: BoxFit.cover),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dimsum Mentai', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                      Text('Rp45.000', style: TextStyle(fontSize: 12, color: Colors.black54)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(8)),
                  child: const Text('2x', style: TextStyle(fontSize: 12, color: Colors.black54)),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Catatan
            const Text('Catatan untuk penjual', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            TextField(
              controller: _catatanController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Contoh: jangan terlalu pedas...',
                hintStyle: const TextStyle(color: Colors.black26, fontSize: 13),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.black12)),
                contentPadding: const EdgeInsets.all(12),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 12),

            // Pembayaran
            const Text('Pembayaran', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _PaymentOption(
              icon: Icons.qr_code_scanner,
              label: 'QRIS',
              value: 'qris',
              groupValue: _paymentMethod,
              onChanged: (val) => setState(() => _paymentMethod = val),
            ),
            _PaymentOption(
              icon: Icons.payments_outlined,
              label: 'Tunai',
              value: 'tunai',
              groupValue: _paymentMethod,
              onChanged: (val) => setState(() => _paymentMethod = val),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 12),

            // Ringkasan pembayaran
            const Text('Ringkasan Pembayaran', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _summaryRow('Subtotal', 'Rp45.000'),
            _summaryRow('Diskon', 'Rp0'),
            _summaryRow('Ongkos Kirim', 'Rp5.000'),
            const Divider(height: 20),
            _summaryRow('Total', 'Rp50.000', isBold: true),
          ],
        ),
      ),

      // Bottom bar total + tombol bayar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, -2))],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Total Pembayaran', style: TextStyle(fontSize: 11, color: Colors.black45)),
                    Text('Rp50.000', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _paymentMethod == null
                    ? null
                    : () {
                        // TODO: proses checkout, Navigator ke payment_page/pembayaran_qris_page
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE08A33),
                  disabledBackgroundColor: Colors.black12,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Bayar Sekarang', style: TextStyle(color: Colors.white, fontSize: 14)),
              ),
            ],
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

// Toggle "Diantar" / "Ambil sendiri"
class _DeliveryOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _DeliveryOption({required this.icon, required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFDF0E6) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? const Color(0xFFE08A33) : Colors.black12),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? const Color(0xFFE08A33) : Colors.black45),
            const SizedBox(height: 6),
            Text(label, style: TextStyle(fontSize: 13, color: isSelected ? const Color(0xFFE08A33) : Colors.black54, fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}

// Radio metode pembayaran
class _PaymentOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const _PaymentOption({
    required this.icon,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(icon, size: 20, color: Colors.black54),
            const SizedBox(width: 12),
            Expanded(child: Text(label, style: const TextStyle(fontSize: 14))),
            Radio<String>(
              value: value,
              groupValue: groupValue,
              activeColor: const Color(0xFFE08A33),
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}