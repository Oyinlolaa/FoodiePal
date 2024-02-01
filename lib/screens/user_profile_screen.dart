import 'package:flutter/material.dart';
import 'package:foodie_pal/models/user.dart';

class UserProfileScreen extends StatefulWidget {
  final User user; // Assuming you have a User object passed to this screen
  final String username;

  UserProfileScreen({required this.user, required this.username});

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late String email;
  late String phone;

  @override
  void initState() {
    super.initState();
    // Set initial email and phone from the user object, handling null values
    email = widget.user.email ?? 'N/A';
    phone = widget.user.phone ?? 'N/A';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Add logic to navigate to settings page
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.orange,
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // User profile image
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(widget.user.profilePicture),
              ),
              SizedBox(height: 16),

              // User details
              Text(
                'Name: ${widget.user.name}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Delivery Address: ${widget.user.deliveryAddress}',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 16),

              // Button to change delivery address
              ElevatedButton(
                onPressed: () {
                  // Add logic to navigate to a screen for changing delivery address
                },
                child: Text('Change Delivery Address'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.orange,
                ),
              ),

              // Additional user information
              SizedBox(height: 24),
              Divider(thickness: 2, color: Colors.white),

              // Additional user details with editable fields
              ListTile(
                leading: Icon(Icons.email, color: Colors.white),
                title: Row(
                  children: [
                    Text(
                      'Email: $email',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(width: 8),
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.white),
                      onPressed: () {
                        // Add logic to edit email
                      },
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.phone, color: Colors.white),
                title: Row(
                  children: [
                    Text(
                      'Phone: $phone',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(width: 8),
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.white),
                      onPressed: () {
                        // Add logic to edit phone number
                      },
                    ),
                  ],
                ),
              ),

              // Add more sections and details as needed
              SizedBox(height: 24),
              _buildFavoriteFoods(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteFoods() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Favorite Foods',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            _buildFoodItem('🍕 Pizza'),
            _buildFoodItem('🍔 Burger'),
            _buildFoodItem('🍣 Sushi'),
          ],
        ),
      ],
    );
  }

  Widget _buildFoodItem(String food) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(food, style: TextStyle(fontSize: 16)),
    );
  }
}
