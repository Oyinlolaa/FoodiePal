import 'package:flutter/material.dart';
import 'cart_screen.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  final String restaurantName;
  final double rating;
  final Map<String, dynamic> restaurant;

  RestaurantDetailsScreen({required this.restaurantName, required this.rating, required this.restaurant});

  @override
  _RestaurantDetailsScreenState createState() => _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  final List<String> restaurantImages = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
    'assets/image5.jpg',
  ];

  final List<Map<String, dynamic>> menuItems = [
    {'name': 'Pasta', 'price': '₦1500'},
    {'name': 'Burger', 'price': '₦1200'},
    {'name': 'Salad', 'price': '₦800'},
    {'name': 'Pizza', 'price': '₦2000'},
    {'name': 'Steak', 'price': '₦2500'},
    {'name': 'Sushi', 'price': '₦1800'},
    {'name': 'Soup', 'price': '₦1000'},
    {'name': 'Sandwich', 'price': '₦900'},
    {'name': 'Fried Rice', 'price': '₦1600'},
    {'name': 'Ice Cream', 'price': '₦700'},
  ];

  List<bool> selectedItems = List.filled(10, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurantName),
        backgroundColor: Colors.orange,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen(selectedItems: selectedItems, menuItems: menuItems)),
                  );
                },
              ),
              if (selectedItems.any((element) => element))
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                    child: Text(
                      selectedItems.where((element) => element).length.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: restaurantImages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.asset(
                            restaurantImages[index],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 16.0,
                    right: 16.0,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text(
                        'Swipe for more',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Menu',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: List.generate(menuItems.length, (index) {
                  final item = menuItems[index];
                  return ListTile(
                    title: Text(
                      item['name'],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Price: ${item['price']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: Checkbox(
                      value: selectedItems[index],
                      onChanged: (value) {
                        setState(() {
                          selectedItems[index] = value ?? false;
                        });
                      },
                      activeColor: Colors.orange,
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Reviews',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type your review here...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Submit Review',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
