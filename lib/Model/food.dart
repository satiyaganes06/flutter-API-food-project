class FoodDetail{
  final String name;
  final String image;
  final double rating;
  final String totalTime;

  FoodDetail({required this.name, required this.image, required this.rating, required this.totalTime});

  factory FoodDetail.fromJson(dynamic json){
    return FoodDetail(
      name: json['name'] as String,
      image: json['images'][0]['hostedLargeUrl'] as String,
      rating: json['rating'] as double,
      totalTime: json['totalTime'] as String
    );
  }

  static List<FoodDetail> foodsFromSnapshot(List snapshot){
    return snapshot.map((data){
      return FoodDetail.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $name, image: $image, rating: $rating, totalTime: $totalTime}';
  }
}