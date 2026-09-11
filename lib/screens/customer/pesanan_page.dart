import 'package:flutter/material.dart';
import 'beranda_page.dart';
import 'menu_page.dart';
import 'profile_page.dart';
import 'cart_page.dart';

class PesananPage extends StatefulWidget {
  const PesananPage({super.key});

  @override
  State<PesananPage> createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _orders = const [
    {
      'id': '#DIMI-001',
      'status': 'Diproses',
      'statusColor': Color(0xFFE08A33),
      'name': 'Dimsum Mentai',
      'qty': 2,
      'price': 'Rp22.500',
      'total': 'Rp45.000',
      'image': 'produk1.jpg',
    },
    {
      'id': '#DIMI-002',
      'status': 'Dikirim',
      'statusColor': Color(0xFF3B82F6),
      'name': 'Siomay',
      'qty': 1,
      'price': 'Rp25.000',
      'total': 'Rp25.000',
      'image': 'produk5.jpg',
    },
    {
      'id': '#DIMI-003',
      'status': 'Selesai',
      'statusColor': Color(0xFF22C55E),
      'name': 'Platter Mentai',
      'qty': 1,
      'price': 'Rp65.000',
      'total': 'Rp65.000',
      'image': 'produk3.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Pesanan Saya', style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black87),
            onPressed: () {
              // TODO: Navigator ke cart_page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: const Color(0xFFE08A33),
          unselectedLabelColor: Colors.black45,
          indicatorColor: const Color(0xFFE08A33),
          labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          tabs: const [
            Tab(text: 'Semua'),
            Tab(text: 'Belum Bayar (1)'),
            Tab(text: 'Diproses'),
            Tab(text: 'Dikirim'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrderList(_orders),
          _buildOrderList(_orders.where((o) => o['status'] == 'Belum Bayar').toList()),
          _buildOrderList(_orders.where((o) => o['status'] == 'Diproses').toList()),
          _buildOrderList(_orders.where((o) => o['status'] == 'Dikirim').toList()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color(0xFFE08A33),
        unselectedItemColor: Colors.black38,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          // TODO: navigasi antar tab
          if (index == 0) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BerandaPage()));
          } else if (index == 1) {
            // Tetap di halaman pesanan
          } else if (index == 2) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MenuPage()));
          } else if (index == 3) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long_outlined), label: 'Pesanan'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu_outlined), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
    );
  }

  Widget _buildOrderList(List<Map<String, dynamic>> orders) {
    if (orders.isEmpty) {
      return const Center(
        child: Text('Belum ada pesanan', style: TextStyle(color: Colors.black38)),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return _OrderCard(
          id: order['id'],
          status: order['status'],
          statusColor: order['statusColor'],
          name: order['name'],
          qty: order['qty'],
          price: order['price'],
          total: order['total'],
          imagePath: order['image'],
          onDetailTap: () {
            // TODO: Navigator ke detail_pesanan_page
          },
        );
      },
    );
  }
}

class _OrderCard extends StatelessWidget {
  final String id, status, name, price, total, imagePath;
  final Color statusColor;
  final int qty;
  final VoidCallback onDetailTap;

  const _OrderCard({
    required this.id,
    required this.status,
    required this.statusColor,
    required this.name,
    required this.qty,
    required this.price,
    required this.total,
    required this.imagePath,
    required this.onDetailTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(id, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black54)),
              Text(status, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: statusColor)),
            ],
          ),
          const Divider(height: 20),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/images/$imagePath', width: 56, height: 56, fit: BoxFit.cover),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 2),
                    Text('x$qty', style: const TextStyle(fontSize: 12, color: Colors.black45)),
                  ],
                ),
              ),
              Text(price, style: const TextStyle(fontSize: 13, color: Colors.black87)),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total Pesanan', style: TextStyle(fontSize: 12, color: Colors.black54)),
              Text(total, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFFE08A33))),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onDetailTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE08A33),
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Lihat Detail', style: TextStyle(color: Colors.white, fontSize: 13)),
            ),
          ),
        ],
      ),
    );
  }
}