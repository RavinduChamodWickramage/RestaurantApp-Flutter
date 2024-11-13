import 'package:flutter/material.dart';

void main() {
  runApp(ResturantApp());
}

class ResturantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Order Your Favorite Fast Food!',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.orange),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search food, drink, desserts',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Grab Our Exclusive Food Discounts Now!',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Order Now',
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Image.asset(
                      'assets/images/burger.png',
                      width: 100,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    List<Map<String, dynamic>> iconData = [
                      {'label': 'Burger', 'icon': Icons.fastfood},
                      {'label': 'Pizza', 'icon': Icons.local_pizza},
                      {'label': 'Spaghetti', 'icon': Icons.restaurant},
                      {'label': 'Fried Rice', 'icon': Icons.rice_bowl},
                      {'label': 'Cake', 'icon': Icons.cake},
                      {'label': 'Drinks', 'icon': Icons.local_drink},
                    ];

                    double itemWidth = MediaQuery.of(context).size.width / 6;

                    return SizedBox(
                      width: itemWidth,
                      child: _buildCategoryItem(
                        iconData[index]['label'],
                        iconData[index]['icon'],
                      ),
                    );
                  },
                ),
              ),

              Text(
                'Recommended For You',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),

              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildFoodItem(
                    'Classic Cheeseburger',
                    'Juicy beef patty topped with melted cheese...',
                    4.8,
                    5.99,
                    'assets/images/cheeseburger.png',
                  ),
                  _buildFoodItem(
                    'Pepperoni Pizza',
                    'A classic favorite with a mix of...',
                    4.9,
                    9.99,
                    'assets/images/pizza.png',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.orange[100],
            child: Icon(icon, color: Colors.orange),
          ),
          SizedBox(height: 5),
          Text(title),
        ],
      ),
    );
  }

  Widget _buildFoodItem(String name, String description, double rating, double price, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: ListTile(
          leading: Image.asset(imagePath, width: 60),
          title: Text(name),
          subtitle: Text(description),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('\$$price', style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 16),
                  Text('$rating'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}