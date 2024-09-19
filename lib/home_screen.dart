import 'package:burger_app/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Container(
            color: Colors.redAccent,
            height: screenHeight * 0.3,
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white70,
                        ),
                        Text('Location',
                            style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          'St. Abigael',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.redAccent,
                      ),
                      child: const Text('Order Now'),
                    )
                  ],
                ),
                Image.asset('assets/burger_banner.png')
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 20, right: 20, top: screenHeight * 0.28),
            child: Column(
              children: [
                // Search bar
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search food, restaurant, etc.',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                // Category section
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CategoryButton(icon: Icons.rice_bowl, label: 'Rice'),
                    CategoryButton(icon: Icons.fastfood, label: 'Snacks'),
                    CategoryButton(icon: Icons.local_drink, label: 'Drinks'),
                    CategoryButton(icon: Icons.apps, label: 'More'),
                  ],
                ),
                const SizedBox(height: 20),
                // Top Rated Food Section
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const FoodCard(
                        title: "Burger beef ‘anjaz",
                        price: "\$45.00",
                        image: 'assets/burger_beef_anjaz.jpg',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedIconTheme: const IconThemeData(color: Colors.redAccent),
        selectedLabelStyle: const TextStyle(color: Colors.redAccent),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
        onTap: (index) {},
      ),
    );
  }
}

// CategoryButton Widget
class CategoryButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.redAccent,
            child: Icon(icon, color: Colors.black38),
          ),
          Text(label),
        ],
      ),
    );
  }
}

// FoodCard Widget
class FoodCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  const FoodCard(
      {super.key,
      required this.title,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ProductDetailScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(image,
                    fit: BoxFit.cover, height: 100, width: double.infinity),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Burger Bos'),
                      Text(price,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
