class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel? rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: double.parse(jsonData['price'].toString()),
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating:
          jsonData['rating'] != null
              ? RatingModel.fromJson(jsonData['rating'])
              : null,
    );
  }
  @override
  @override
  String toString() {
    return '''{
  "id": $id,
  "title": "$title",
  "price": $price,
  "description": "$description",
  "category": "$category",
  "image": "$image",
  "rating": $rating
}''';
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: (jsonData['rate'] as num).toDouble(),
      count: jsonData['count'],
    );
  }

  @override
  @override
  String toString() {
    return '''{
    "rate": $rate,
    "count": $count
  }''';
  }
}
