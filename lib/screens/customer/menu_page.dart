import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String _selectedCategory = 'Semua';
  final List<String> _categories = ['Semua', 'Dimsum', 'Siomay', 'Cilok'];

  // Data sementara, nanti ambil dari provider/services
  final List<Map<String, dynamic>> _products = const [
    {
      'name': 'Dimsum Mentai',
      'subtitle': 'Best seller creamy mentai',
      'rating': '4.9',
      'sold': '1,2rb terjual',
      'originalPrice': 'Rp30.000',
      'price': 'Rp28.000',
      'discount': '-10%',
      'image': 'produk1.jpg',
    },
    {
      'name': 'Single Moza',
      'subtitle': 'Isian mozzarella lumer',
      'rating': '4.8',
      'sold': '850 terjual',
      'originalPrice': null,
      'price': 'Rp33.000',
      'discount': null,
      'image': 'produk2.jpg',
    },
    {
      'name': 'Platter Mentai',
      'subtitle': 'Porsi besar buat sharing',
      'rating': '4.9',
      'sold': '320 terjual',
      'originalPrice': 'Rp120.000',
      'price': 'Rp100.000',
      'discount': '-15%',
      'image': 'produk3.jpg',
    },
    {
      'name': 'Dimsum Frozen',
      'subtitle': 'Siap kukus di rumah',
      'rating': '4.8',
      'sold': '150 terjual',
      'originalPrice': null,
      'price': 'Rp30.000',
      'discount': null,
      'image': 'produk4.jpg',
    },
    {
      'name': 'Siomay',
      'subtitle': 'Bumbu kacang khas',
      'rating': '4.8',
      'sold': '210 terjual',
      'originalPrice': null,
      'price': 'Rp25.000',
      'discount': null,
      'image': 'produk5.jpg',
    },
    {
      'name': 'Cilok',
      'subtitle': 'Kenyal dengan saus pedas',
      'rating': '4.7',
      'sold': '190 terjual',
      'originalPrice': null,
      'price': 'Rp15.000',
      'discount': null,
      'image': 'produk6.jpg',
    },
    {
      'name': 'Tahu Aci',
      'subtitle': 'Garing di luar, kenyal',
      'rating': '4.8',
      'sold': '170 terjual',
      'originalPrice': null,
      'price': 'Rp18.000',
      'discount': null,
      'image': 'produk7.jpg',
    },
    {
      'name': 'Frozen Dimsum',
      'subtitle': 'Paket hemat keluarga',
      'rating': '4.7',
      'sold': '120 terjual',
      'originalPrice': null,
      'price': 'Rp30.000',
      'discount': null,
      'image': 'produk8.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black87),
            onPressed: () {
              // TODO: Navigator ke cart_page
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Menu Dimi', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Pilih makanan favoritmu hari ini', style: TextStyle(fontSize: 13, color: Colors.black54)),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(12)),
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
            const SizedBox(height: 16),

            // Filter chip kategori
            SizedBox(
              height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: _categories.map((cat) {
                  final isSelected = cat == _selectedCategory;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(cat),
                      selected: isSelected,
                      onSelected: (_) => setState(() => _selectedCategory = cat),
                      selectedColor: const Color(0xFFE08A33),
                      backgroundColor: const Color(0xFFF5F5F5),
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide.none),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),

            // Grid produk
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final p = _products[index];
                  return _ProductCard(
                    name: p['name'],
                    subtitle: p['subtitle'],
                    rating: p['rating'],
                    sold: p['sold'],
                    originalPrice: p['originalPrice'],
                    price: p['price'],
                    discount: p['discount'],
                    imagePath: p['image'],
                    onTap: () {
                      // TODO: Navigator ke product_detail_page
                    },
                    onAdd: () {
                      // TODO: tambah ke cart
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String name, subtitle, rating, sold, price, imagePath;
  final String? originalPrice, discount;
  final VoidCallback onTap, onAdd;

  const _ProductCard({
    required this.name,
    required this.subtitle,
    required this.rating,
    required this.sold,
    required this.price,
    required this.imagePath,
    required this.onTap,
    required this.onAdd,
    this.originalPrice,
    this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                  child: Image.asset('assets/images/$imagePath', height: 100, width: double.infinity, fit: BoxFit.cover),
                ),
                if (discount != null)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(6)),
                      child: Text(discount!, style: const TextStyle(color: Colors.white, fontSize: 10)),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.black45), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 12, color: Colors.amber),
                      const SizedBox(width: 2),
                      Text('$rating | $sold', style: const TextStyle(fontSize: 10, color: Colors.black45)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  if (originalPrice != null)
                    Text(originalPrice!, style: const TextStyle(fontSize: 10, color: Colors.black38, decoration: TextDecoration.lineThrough)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          price,
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFFE08A33)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: onAdd,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(color: Color(0xFFE08A33), shape: BoxShape.circle),
                          child: const Icon(Icons.add, color: Colors.white, size: 14),
                        ),
                      ),
                    ],
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