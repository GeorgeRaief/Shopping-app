import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final products = [
      {
        "name": "Macbook air M4",
        "price": "60000 LE",
        "image":
            "https://tse2.mm.bing.net/th/id/OIP.fQfHTG1pLzWuDSZlzwW30AHaEK?rs=1&pid=ImgDetMain&o=7&rm=3",
      },
      {
        "name": "Iphone 17 pro max",
        "price": "100000 LE",
        "image":
            "https://tse4.mm.bing.net/th/id/OIF.P7VzFJDS0vlOvErMH2S7oQ?rs=1&pid=ImgDetMain&o=7&rm=3",
      },
      {
        "name": "AirPods Max",
        "price": "50000 LE",
        "image":
            "https://techcrunch.com/wp-content/uploads/2024/09/apple-airpods-max-colors.jpg",
      },
      {
        "name": "Apple watch ultra",
        "price": "20000 LE",
        "image":
            "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/ultra-case-unselect-gallery-1-202509?wid=5120&hei=3280&fmt=p-jpg&qlt=80&.v=aTVJSEliNW9jb25zalBlTm16VmMxcWpkNHRJWDMzcTg3NWRxV0pydTcvTDMzdnJvTzlKOHoyemwyR2RKOW9BOXc2NytHaDA2aFdROEtrekNxcXV6T3E4VWNsNGRCR0dHb3VTRkZDRmRQSVFZa2dhcFVFVEVDWm44UFJ4Y1p6RU4",
      },
      {
        "name": "Iphone 17 pro max",
        "price": "100000 LE",
        "image":
            "https://tse4.mm.bing.net/th/id/OIF.P7VzFJDS0vlOvErMH2S7oQ?rs=1&pid=ImgDetMain&o=7&rm=3",
      },
      {
        "name": "AirPods Max",
        "price": "50000 LE",
        "image":
            "https://techcrunch.com/wp-content/uploads/2024/09/apple-airpods-max-colors.jpg",
      },
    ];
    final offers = [
      {
        "title": "50% Off Electronics",
        "subtitle": "Limited time offer on all tech gadgets",
        "tag": "50% OFF",
      },
      {
        "title": "Free Shipping Weekend",
        "subtitle": "No delivery charges on orders above 500 LE",
        "tag": "FREE SHIP",
      },
      {
        "title": "Buy 2 Get 1 Free",
        "subtitle": "On selected accessories and peripherals",
        "tag": "B2G1",
      },
      {
        "title": "Student Discount",
        "subtitle": "Extra 20% off with valid student ID",
        "tag": "20% OFF",
      },
      {
        "title": "Bundle Deals",
        "subtitle": "Save more when you buy complete setups",
        "tag": "BUNDLE",
      },
    ];
    return Scaffold(
      drawer: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.75,
        child: ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            ListTile(
              leading: Icon(Icons.circle),
              title: Text(tr("Contact us")),
              subtitle: Text(tr("Contact info")),
              trailing: Icon(Icons.contact_page),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              leading: Icon(Icons.circle),
              title: Text(tr('Sign out')),
              trailing: Icon(Icons.logout),
            ),
          ],
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          tr("Our products"),
          style: TextStyle(
            fontFamily: 'Suwannaphum',
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.language), // 🌍 Language icon
            tooltip: "Change Language",
            onPressed: () {
              changeLang();
            },
          ),
        ],
      ),

      body: ListView(
        children: [
          SizedBox(
            height: 70,
            child: Center(
              child: Text(
                tr("Featured Products"),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          SizedBox(
            height: 180,
            child: PageView(
              children: [
                Image.network(
                  "https://th.bing.com/th?q=MacBook+Air+Touch+Screen&w=120&h=120&c=1&rs=1&qlt=70&o=7&cb=1&dpr=1.3&pid=InlineBlock&rm=3&mkt=en-XA&cc=EG&setlang=en&adlt=strict&t=1&mw=247",
                ),
                Image.network(
                  "https://techeconomy.ng/wp-content/uploads/2023/12/The-Most-Popular-Phone-Brands-in-Every-Country-in-2023.jpg",
                ),
              ],
            ),
          ),

          SizedBox(
            height: 70,
            child: Center(
              child: Text(
                tr("Shop our collection"),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          //Products
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          product["image"]!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        tr(product["name"]!),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(tr(product["price"]!)),
                      IconButton(
                        icon: const Icon(
                          Icons.add_shopping_cart,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(tr("Item added to the cart")),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Center(
              child: Text(
                tr("Hot Offers 🔥"),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: offers.length,
            itemBuilder: (context, index) {
              final offer = offers[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      // Offer Text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr(offer["title"]!),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              tr(offer["subtitle"]!),
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Tag pill with gradient
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 14,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          tr(offer["tag"]!),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  changeLang() {
    if (context.locale == Locale('ar', 'EG')) {
      context.setLocale(Locale('en', 'US'));
    } else {
      context.setLocale(Locale('ar', 'EG'));
    }
  }
}
