import 'package:flutter/material.dart';
import '../models/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantCard({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              restaurant.name,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(restaurant.cuisine),
            trailing: Text(
              'Rating: ${restaurant.rating.toString()}',
              style: TextStyle(color: Colors.orange),
            ),
          ),
          // Additional details like images, menus, etc., can be added here
          Divider(
            color: Colors.grey,
            thickness: 2.0,
          ),
          // User Reviews Section
          ListTile(
            title: Text(
              'User Reviews',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: restaurant.reviews.map((review) => Text('- $review')).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
