class AddStartupModel {
  final String title;
  final String tagline;
  final String description;
  final int rating; 

  AddStartupModel({
    required this.title,
    required this.tagline,
    required this.description,
    required this.rating,
  });


  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'tagline': tagline,
      'description': description,
      'rating': rating,
    };
  }

  factory AddStartupModel.fromMap(Map<String, dynamic> map) {
    return AddStartupModel(
      title: map['title'],
      tagline: map['tagline'],
      description: map['description'],
      rating: map['rating'] ?? 0.0,
    );
  }
}

