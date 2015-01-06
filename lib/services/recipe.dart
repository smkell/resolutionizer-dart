part of resolutionizer.services;

class Recipe {
  final String id;
  final String name;
  final String category;
  final List<String> ingredients;
  final String directions;
  final String imgUrl;
  int rating;

  Recipe(this.id, this.name, this.category, this.ingredients, this.directions, this.rating, this.imgUrl);

  Recipe.fromJson(Map<String, dynamic> json)
    : this(json['id'], json['name'], json['category'], json['ingredients'], json['directions'], json['rating'], json['imgUrl']);
}