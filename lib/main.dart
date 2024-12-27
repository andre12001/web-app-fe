import 'package:flutter/material.dart';

void main() {
  runApp(CartridgeKingsApp());
}

class CartridgeKingsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartridge Kings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CartridgeKingsHomePage(),
    );
  }
}

class CartridgeKingsHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            Header(),
            Navigation(),
            HeroSection(),
            FeaturedProducts(),
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildLink('Franchise Opportunities'),
              SizedBox(width: 16),
              _buildLink('Help'),
              SizedBox(width: 16),
              _buildLink('Feedback'),
            ],
          ),
          Row(
            children: [
              Text('hello@email.com', style: TextStyle(fontSize: 12)),
              SizedBox(width: 16),
              Text('0800 022 2 022', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLink(String text) {
    return InkWell(
      onTap: () {},
      child: Text(text, style: TextStyle(fontSize: 12)),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              FlutterLogo(size: 40),
              SizedBox(width: 8),
              Text(
                'CARTRIDGE KINGS',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'SEARCH',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text('CART (1)'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Navigation extends StatelessWidget {
  final List<String> menuItems = [
    'HOME',
    'INK CARTRIDGES',
    'TONER CARTRIDGES',
    'CONTACT US',
    'LOGIN / REGISTER',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: menuItems
            .map((item) => InkWell(
                  onTap: () {},
                  child: Text(
                    item,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.black.withOpacity(0.5),
      child: Column(
        children: [
          Text(
            'FIND THE RIGHT CARTRIDGES FOR YOUR PRINTER',
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('3-Step Easy Search®'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Search by Serial Number'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, iconColor: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          _buildDropdown('1. Printer Brand'),
          SizedBox(height: 10),
          _buildDropdown('2. Printer Series'),
          SizedBox(height: 10),
          _buildDropdown('3. Printer Model'),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text('FIND CARTRIDGES'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String hint) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(hint),
          items: [],
          onChanged: (value) {},
        ),
      ),
    );
  }
}

class FeaturedProducts extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'HP 62 Black Ink Cartridge',
      'code': '(i-PC2P04AE)',
      'price': 9.49,
      'image': 'https://via.placeholder.com/200',
    },
    {
      'name': 'Canon MF-3110 Toner',
      'code': '(C2P04AE)',
      'price': 36.45,
      'image': 'https://via.placeholder.com/200',
    },
    {
      'name': 'HP 62 Black Ink Cartridge',
      'code': '(i-PC2P04AE)',
      'price': 5.99,
      'image': 'https://via.placeholder.com/200',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'FEATURED PRODUCTS',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: products
                  .map((product) => _buildProductCard(product))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      width: 250,
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(product['image'], height: 200, width: 200),
          SizedBox(height: 10),
          Text(
            product['name'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          Text(
            product['code'],
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(height: 5),
          Text(
            '\$${product['price']}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text('ADD TO CART'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: Size(double.infinity, 40),
            ),
          ),
        ],
      ),
    );
  }
}
