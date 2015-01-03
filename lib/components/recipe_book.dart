part of resolutionizer.components;

/// A RecipeBookComponent provides a re-usable component for managing and viewing a collection of recipes.
@Component(
  selector: 'recipe-book',
  templateUrl: 'recipe_book.html'
)
class RecipeBookComponent {
  List<Recipe> recipes = [];
  Recipe selectedRecipe;

  RecipeBookComponent() {
    recipes = _loadData();
  }

  void selectRecipe(Recipe recipe) {
    selectedRecipe = recipe;
  }

  List<Recipe> _loadData() {
    return [
        new Recipe('My Appetizer','Appetizers',
        ["Ingredient 1", "Ingredient 2"],
        "Some Directions", 1),
        new Recipe('My Salad','Salads',
        ["Ingredient 1", "Ingredient 2"],
        "Some Directions", 3),
        new Recipe('My Soup','Soups',
        ["Ingredient 1", "Ingredient 2"],
        "Some Directions", 4),
        new Recipe('My Main Dish','Main Dishes',
        ["Ingredient 1", "Ingredient 2"],
        "Some Directions", 2),
        new Recipe('My Side Dish','Side Dishes',
        ["Ingredient 1", "Ingredient 2"],
        "Some Directions", 3),
        new Recipe('My Awesome Dessert','Desserts',
        ["Ingredient 1", "Ingredient 2"],
        "Some Directions", 5),
        new Recipe('My So-So Dessert','Desserts',
        ["Ingredient 1", "Ingredient 2"],
        "Some Directions", 3),
    ];
  }
}

class Recipe {
  final String name;
  final String category;
  final List<String> ingredients;
  final String directions;
  int rating;

  Recipe(this.name, this.category, this.ingredients, this.directions, this.rating);
}