import 'package:flutter/material.dart';

class LacakPesananPage extends StatelessWidget {
  const LacakPesananPage({super.key});

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
        title: const Text('Lacak Pesanan', style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Icon + judul status
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(color: Color(0xFFFDF0E6), shape: BoxShape.circle),
              child: const Icon(Icons.delivery_dining, color: Color(0xFFE08A33), size: 32),
            ),
            const SizedBox(height: 14),
            const Text('Pesanan sedang diantar', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text(
              'Pesananmu sedang menuju alamat pengiriman.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // Ringkasan order
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ORDER #DM-20260827-001', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.black45)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(color: const Color(0xFFFDF0E6), borderRadius: BorderRadius.circular(6)),
                        child: const Text('Sudah Dibayar', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFFE08A33))),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Dimsum Mentai x 2', style: TextStyle(fontSize: 13, color: Colors.black87)),
                      Text('Rp50.000', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Timeline status
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  _TimelineStep(
                    title: 'Pesanan Disiapkan',
                    subtitle: 'Pesananmu sudah siap di dapur.',
                    state: _StepState.done,
                    isLast: false,
                  ),
                  _TimelineStep(
                    title: 'Sedang Diantar',
                    subtitle: 'Kurir sedang dalam perjalanan.',
                    state: _StepState.active,
                    isLast: false,
                  ),
                  _TimelineStep(
                    title: 'Pesanan Sampai',
                    subtitle: 'Menunggu pesanan tiba.',
                    state: _StepState.pending,
                    isLast: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Informasi pengiriman
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on_outlined, size: 16, color: Colors.black45),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ALAMAT', style: TextStyle(fontSize: 10, color: Colors.black38)),
                        SizedBox(height: 2),
                        Text('Jl. Contoh No. 123', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('ESTIMASI TIBA', style: TextStyle(fontSize: 10, color: Colors.black38)),
                      SizedBox(height: 2),
                      Text('11:30–12:00', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFFE08A33))),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Info banner "dalam perjalanan"
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: const [
                  Icon(Icons.local_shipping_outlined, size: 20, color: Colors.black54),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pesanan dalam perjalanan', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                        SizedBox(height: 2),
                        Text('Tim Dimi sedang mengantarkan pesananmu.', style: TextStyle(fontSize: 11, color: Colors.black45)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _StepState { done, active, pending }

// Satu baris di timeline vertikal (icon + garis penghubung + teks)
class _TimelineStep extends StatelessWidget {
  final String title, subtitle;
  final _StepState state;
  final bool isLast;

  const _TimelineStep({
    required this.title,
    required this.subtitle,
    required this.state,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final isDone = state == _StepState.done;
    final isActive = state == _StepState.active;
    final color = (isDone || isActive) ? const Color(0xFFE08A33) : Colors.black26;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isDone ? const Color(0xFFE08A33) : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 2),
                ),
                child: Icon(
                  isDone ? Icons.check : (isActive ? Icons.local_shipping : Icons.hourglass_empty),
                  size: 12,
                  color: isDone ? Colors.white : color,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: isDone ? const Color(0xFFE08A33) : Colors.black12,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: (isDone || isActive) ? Colors.black87 : Colors.black38,
                        ),
                      ),
                      if (isActive) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                          decoration: BoxDecoration(color: const Color(0xFFE08A33), borderRadius: BorderRadius.circular(4)),
                          child: const Text('AKTIF', style: TextStyle(fontSize: 8, color: Colors.white, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 11, color: (isDone || isActive) ? Colors.black54 : Colors.black26),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}