part of resolutionizer.components;

/// A RecipeBookComponent provides a re-usable component for managing and viewing a collection of recipes.
@Component(
  selector: 'recipe-book',
  templateUrl: 'recipe_book.html'
)
class RecipeBookComponent {

  static const String LoadingMessage = "Loading recipe book...";
  static const String ErrorMessage = "Sorry! The cook stepped out of the kitchen and took the book with him!";

  RecipeBookComponent(this._http, this.queryService) {
    _loadData();
  }

  // Loading state indicators
  String message = LoadingMessage;
  bool recipesLoaded = false;
  bool categoriesLoaded = false;

  // Filter box
  final categoryFilterMap = <String, bool>{};
  Iterable<String> get categories => categoryFilterMap.keys;
  String nameFilterString = "";

  // Services
  final Http _http;
  final QueryService queryService;

  Map<String,Recipe> _recipeMap = {};
  Map<String,Recipe> get recipeMap => _recipeMap;

  List<Recipe> _allRecipes = [];
  List<Recipe> get allRecipes => _allRecipes;

  Recipe selectedRecipe;

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
    return tooltip[recipe];
    // recipe.tooltip
  }

  void clearFilters() {
    categoryFilterMap.clear();
    nameFilterString = "";
  }

  void _loadData() {
    queryService.getAllRecipes()
      .then((Map<String, Recipe> allRecipes) {
        _recipeMap = allRecipes;
        _allRecipes = recipeMap.values.toList();
        recipesLoaded = true;
      })
      .catchError((e) {
        print(e);
        recipesLoaded = false;
        message = ErrorMessage;
      });

    queryService.getAllCategories()
      .then((List<String> allCategories) {
        for(String category in allCategories) {
          categoryFilterMap[category] = false;
        }
        categoriesLoaded = true;
      })
      .catchError((e) {
        print(e);
        categoriesLoaded = false;
        message = ErrorMessage;
      });
  }
}