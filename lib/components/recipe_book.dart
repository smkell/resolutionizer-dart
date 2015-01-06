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

  // Tooltip
  static final tooltip = new Expando<TooltipModel>();

  TooltipModel tooltipForRecipe(Recipe recipe) {
    if (tooltip[recipe] == null) {
      tooltip[recipe] = new TooltipModel(recipe.imgUrl,
      "I don't have a picture of these recipes, "
      "so here's one of my cat instead!",
      80);
    }
    return tooltip[recipe]; // recipe.tooltip
  }

  List<Recipe> _loadData() {
    return [
        new Recipe('My Appetizer','Appetizers',
        ["Ingredient 1", "Ingredient 2"],
        "Some Directions", 1, 'fonzie1.jpg'),
        new Recipe('My Salad','Salads',
        ["Ingredient 1", "Ingredient 2"],
        "Some Directions", 3, 'fonzie2.jpg'),
        new Recipe('My Soup','Soups',
        ["Ingredient 1", "Ingredient 2"],
        "Some Directions", 4, 'fonzie1.jpg'),
        new Recipe('My Main Dish','Main Dishes',
        ["Ingredient 1", "Ingredient 2"],
        "Some Directions", 2, 'fonzie2.jpg'),
        new Recipe('My Side Dish','Side Dishes',
        ["Ingredient 1", "Ingredient 2"],
        "Some Directions", 3, 'fonzie1.jpg'),
        new Recipe('My Awesome Dessert','Desserts',
        ["Ingredient 1", "Ingredient 2"],
        "Some Directions", 5, 'fonzie2.jpg'),
        new Recipe('My So-So Dessert','Desserts',
        ["Ingredient 1", "Ingredient 2"],
        "Some Directions", 3, 'fonzie1.jpg'),
    ];
  }
}

class Recipe {
  final String name;
  final String category;
  final List<String> ingredients;
  final String directions;
  final String imgUrl;
  int rating;

  Recipe(this.name, this.category, this.ingredients, this.directions, this.rating, this.imgUrl);
}