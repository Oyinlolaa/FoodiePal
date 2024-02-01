import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<bool> selectedItems;
  final List<Map<String, dynamic>> menuItems;

  CartScreen({required this.selectedItems, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> selectedMenuItems = [];
    for (int i = 0; i < selectedItems.length; i++) {
      if (selectedItems[i]) {
        selectedMenuItems.add(menuItems[i]);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('FoodiePal Cart'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: selectedMenuItems.length,
                itemBuilder: (context, index) {
                  final item = selectedMenuItems[index];
                  return Card(
                    elevation: 3.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        item['name'],
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        item['price'],
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Icon(
                        Icons.remove_circle_outline,
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Add logic for order now
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                'Order Now',
                style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
