part of resolutionizer.components;

/// A RecipeBookComponent provides a re-usable component for managing and viewing a collection of recipes.
@Component(
  selector: 'recipe-book',
  templateUrl: 'recipe_book.html'
)
class RecipeBookComponent {

  static const String LoadingMessage = "Loading recipe book...";
  static const String ErrorMessage = "Sorry! The cook stepped out of the kitchen and took the book with him!";

  // Loading state indicators
  String message = LoadingMessage;
  bool recipesLoaded = false;
  bool categoriesLoaded = false;

  List<Recipe> recipes = [];
  Recipe selectedRecipe;

  // Filter box
  final categoryFilterMap = <String, bool>{
  };

  Iterable<String> get categories => categoryFilterMap.keys;

  String nameFilterString = "";

  final Http _http;

  RecipeBookComponent(this._http) {
    _loadData();
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
    return tooltip[recipe];
    // recipe.tooltip
  }

  void clearFilters() {
    categoryFilterMap.clear();
    nameFilterString = "";
  }

  void _loadData() {
    recipesLoaded = false;
    categoriesLoaded = false;
    _http.get('recipes.json')
    .then((HttpResponse response) {
      print(response);
      recipes = response.data.map((d) => new Recipe.fromJson(d)).toList();
      recipesLoaded = true;
    })
    .catchError((e) {
      print(e);
      recipesLoaded = false;
      message = ErrorMessage;
    });

    _http.get('categories.json')
      .then((HttpResponse response) {
        print(response);
        for(String category in response.data) {
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