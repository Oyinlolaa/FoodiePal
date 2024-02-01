class Restaurant {
  final String name;
  final String cuisine;
  double rating;
  final List<String> reviews;

  Restaurant({required this.name, required this.cuisine, this.rating = 0.0, this.reviews = const []});
}
