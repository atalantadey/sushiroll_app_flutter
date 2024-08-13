class Food {
  String name;
  String price;
  String image;
  String rating;
  Food({
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
  });

  String get _name => name;
  String get _price => price;
  String get _rating => rating;
  String get _image => image;
}
