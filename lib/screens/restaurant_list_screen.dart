import 'package:flutter/material.dart';
import 'package:foodie_pal/api_service.dart';
import 'package:foodie_pal/models/user.dart';
import 'restaurant_details_screen.dart';
import 'user_profile_screen.dart';

class RestaurantListScreen extends StatefulWidget {
  final String username;
  final String location;

  RestaurantListScreen({required this.username, required this.location});

  @override
  _RestaurantListScreenState createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  late User currentUser;
  final ApiService apiService = ApiService();
  List<Map<String, dynamic>> allRestaurants = [];
  List<Map<String, dynamic>> filteredRestaurants = [];

  @override
  void initState() {
    super.initState();
    currentUser = User(
      name: widget.username,
      profilePicture: '...',
      deliveryAddress: '...',
    );
    _fetchRestaurants();
  }

  void _fetchRestaurants() async {
    try {
      List<Map<String, dynamic>> restaurants =
          await apiService.fetchHardcodedRestaurants();
      setState(() {
        allRestaurants = restaurants;
        filteredRestaurants = allRestaurants;
      });
    } catch (e) {
      print('Error fetching restaurants: $e');
    }
  }

  void _toggleTheme() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Theme'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildThemeOption('Light Theme', false),
              _buildThemeOption('Dark Theme', true),
            ],
          ),
        );
      },
    );
  }

  Widget _buildThemeOption(String themeName, bool isDark) {
    return ListTile(
      title: Text(themeName),
      leading: Icon(isDark ? Icons.nightlight_round : Icons.wb_sunny),
      onTap: () {
        Navigator.pop(context);
        _setTheme(isDark);
      },
    );
  }

  void _setTheme(bool isDark) {
    // ignore: unused_local_variable
    ThemeData theme = isDark ? ThemeData.dark() : ThemeData.light();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => RestaurantListScreen(
          username: widget.username,
          location: widget.location,
        ),
      ),
      (route) => false,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RestaurantListScreen(
          username: widget.username,
          location: widget.location,
        ),
      ),
    );
  }

  void _searchAndFilterRestaurants() {
    // Implement search and filter logic based on user input
    // You can update the filteredRestaurants list accordingly
    // For now, let's filter based on restaurant names containing the search query
    String searchQuery = _searchController.text.toLowerCase();
    setState(() {
      filteredRestaurants = allRestaurants
          .where((restaurant) =>
              restaurant['name'].toLowerCase().contains(searchQuery))
          .toList();
    });
  }

  void _shareRestaurant(String restaurantName) {
    // Implement restaurant sharing functionality here
    // You can use social media plugins to share the restaurant details
    // For now, let's print a message to the console
    print('Sharing $restaurantName on social media!');
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            SizedBox(width: 8.0),
            Text('FoodiePal - ${widget.location}'),
          ],
        ),
        actions: [
          IconButton(
            icon: UserCircleAvatar(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfileScreen(
                    user: currentUser,
                    username: widget.username,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.orange,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, ${currentUser.name}!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Discover and Explore the Best Restaurants',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  'Account',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onTap: () {
                  // Navigate to account settings with currentUser
                  // Replace with appropriate logic
                },
              ),
              ListTile(
                title: Text(
                  'My Information',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onTap: () {
                  // Navigate to my information settings with currentUser
                  // Replace with appropriate logic
                },
              ),
              ListTile(
                title: Text(
                  'F.A.Q',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onTap: () {
                  // Navigate to F.A.Q settings
                  // Replace with appropriate logic
                },
              ),
              ListTile(
                title: Text(
                  'Promo Codes',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onTap: () {
                  // Navigate to promo codes settings
                  // Replace with appropriate logic
                },
              ),
              ListTile(
                title: Text(
                  'Theme',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onTap: () {
                  // Show theme selection dialog
                  _toggleTheme();
                },
              ),
              Spacer(),
              ListTile(
                title: Text(
                  'Log Out',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onTap: () {
                  // Implement log out functionality
                  // Replace with appropriate logic
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            padding: EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome, ${currentUser.name}!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                               SizedBox(height: 16.0),
                Text(
                  'Discover and Explore the Best Restaurants in ${widget.location}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search for restaurants...',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        _searchController.clear();
                        _searchAndFilterRestaurants();
                      },
                    ),
                  ),
                  onChanged: (_) => _searchAndFilterRestaurants(),
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildRestaurantList(),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantList() {
    if (filteredRestaurants.isEmpty) {
      return Center(
        child: Text('No restaurants available.'),
      );
    }

    return ListView.builder(
      itemCount: filteredRestaurants.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredRestaurants[index]['name']),
          subtitle: Text('Rating: ${filteredRestaurants[index]['rating']}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantDetailsScreen(
                  restaurantName: filteredRestaurants[index]['name'],
                  rating: filteredRestaurants[index]['rating'],
                  restaurant: filteredRestaurants[index],
                ),
              ),
            );
          },
          onLongPress: () {
            _shareRestaurant(filteredRestaurants[index]['name']);
          },
        );
      },
    );
  }
}

class UserCircleAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.orange,
      child: Icon(Icons.person),
    );
  }
}
