import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:dimi/screens/customer/cart_page.dart';
import 'package:dimi/screens/customer/menu_page.dart';
import 'package:dimi/screens/customer/profile_page.dart';
import 'package:dimi/screens/customer/pesanan_page.dart';
import 'package:dimi/screens/customer/detail_produk_dimsumfrozen.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Dimi',
          style: TextStyle(
              color: Color(0xFFE08A33),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined,
                    color: Colors.black87),
                onPressed: () {
                  // TODO: Navigator ke cart_page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  );
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  child: const Text('1',
                      style: TextStyle(color: Colors.white, fontSize: 9)),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.black38),
                    hintText: 'Cari menu Dimi...',
                    hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            _sectionHeader('Lagi Diskon'),
            const SizedBox(height: 12),
            SizedBox(
              height: 210,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  _DiscountCard(
                    name: 'Dimsum Mentai',
                    subtitle: 'Isi 4 pcs',
                    originalPrice: 'Rp25.000',
                    discountPrice: 'Rp 22.500',
                    discountLabel: '-10%',
                  ),
                  SizedBox(width: 12),
                  _DiscountCard(
                    name: 'Dimsum Mentai',
                    subtitle: 'Isi 4 pcs',
                    originalPrice: 'Rp25.000',
                    discountPrice: 'Rp 22.500',
                    discountLabel: '-10%',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            _sectionHeader('Menu Favorit'),
            const SizedBox(height: 12),
            SizedBox(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  _MenuCard(
                      name: 'Single Moza',
                      subtitle: 'Lumer di mulut',
                      price: 'Rp 28k'),
                  SizedBox(width: 12),
                  _MenuCard(
                      name: 'Dimsum Frozen',
                      subtitle: 'Isi 20 pcs',
                      price: 'Rp 90k'),
                  SizedBox(width: 12),
                  _MenuCard(
                      name: 'Dimsum Frozen',
                      subtitle: 'Isi 20 pcs',
                      price: 'Rp 90k'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            _sectionHeader('Kategori'),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.4,
                children: const [
                  _CategoryCard(label: 'Dimsum'),
                  _CategoryCard(label: 'Siomay'),
                  _CategoryCard(label: 'Cilok'),
                  _CategoryCard(label: 'Tahu Aci'),
                  _CategoryCard(label: 'Frozen'),
                  _CategoryCard(label: 'Lainnya', isMore: true),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFFE08A33),
        unselectedItemColor: Colors.black38,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          // TODO: navigasi antar tab (Pesanan, Menu, Profil)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                switch (index) {
                  case 1:
                    return const PesananPage();
                  case 2:
                    return const MenuPage();
                  case 3:
                    return const ProfilePage();
                  default:
                    return const BerandaPage();
                }
              },
            ),
          );
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined), label: 'Pesanan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu_outlined), label: 'Menu'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text('Lihat semua',
              style: TextStyle(fontSize: 12, color: Color(0xFFE08A33))),
        ],
      ),
    );
  }
}

// Card produk diskon (dengan harga coret)
class _DiscountCard extends StatelessWidget {
  final String name, subtitle, originalPrice, discountPrice, discountLabel;

  const _DiscountCard({
    required this.name,
    required this.subtitle,
    required this.originalPrice,
    required this.discountPrice,
    required this.discountLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(14)),
                child: Image.asset('assets/images/produk1.jpg',
                    height: 100, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(discountLabel,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 10)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600)),
                Text(subtitle,
                    style:
                        const TextStyle(fontSize: 11, color: Colors.black45)),
                const SizedBox(height: 6),
                Text(originalPrice,
                    style: const TextStyle(
                        fontSize: 11,
                        color: Colors.black38,
                        decoration: TextDecoration.lineThrough)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(discountPrice,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE08A33))),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                          color: Color(0xFFE08A33), shape: BoxShape.circle),
                      child:
                          const Icon(Icons.add, color: Colors.white, size: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Card menu favorit (tanpa diskon)
class _MenuCard extends StatelessWidget {
  final String name, subtitle, price;

  const _MenuCard(
      {required this.name, required this.subtitle, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
            child: Image.asset('assets/images/produk2.jpg',
                height: 90, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600)),
                Text(subtitle,
                    style:
                        const TextStyle(fontSize: 10, color: Colors.black45)),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(price,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE08A33))),
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE08A33)),
                          shape: BoxShape.circle),
                      child: const Icon(Icons.add,
                          color: Color(0xFFE08A33), size: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Card kategori
class _CategoryCard extends StatelessWidget {
  final String label;
  final bool isMore;

  const _CategoryCard({required this.label, this.isMore = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              if (isMore) {
                return const MenuPage();
              } else if (label == 'Dimsum') {
                return const DetailProdukFrozenPage();
              } else {
                return const MenuPage();
              }
            },
          ),
        );
        // TODO: Navigator ke menu_page dengan filter kategori
      },
      child: Container(
        decoration: BoxDecoration(
          color: isMore ? const Color(0xFFFDF0E6) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          image: isMore
              ? null
              : const DecorationImage(
                  image: AssetImage('assets/images/kategori_default.jpg'),
                  fit: BoxFit.cover),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            if (isMore)
              const Center(
                  child: Icon(Icons.grid_view_rounded,
                      color: Color(0xFFE08A33), size: 28))
            else
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                label,
                style: TextStyle(
                  color: isMore ? const Color(0xFFE08A33) : Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
