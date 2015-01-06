library resolutionizer;

import 'package:angular/angular.dart';
import 'package:resolutionizer/components/components.dart';
import 'package:resolutionizer/formatters/formatters.dart';
import 'package:resolutionizer/routing/recipe_book_router.dart';
import 'package:resolutionizer/services/services.dart';
import 'package:resolutionizer/tooltip/tooltip.dart';

export 'package:resolutionizer/components/components.dart';
export 'package:resolutionizer/formatters/formatters.dart';
export 'package:resolutionizer/services/services.dart';

class ResolutionizerApp extends Module {
  ResolutionizerApp() {

    // Filters
    bind(CategoryFilter);
    bind(FahrenheitToCelciusFilter);
    bind(SyrupFilter);

    // Decorators
    bind(Tooltip);

    // Components
    bind(RatingComponent);
    bind(RecipeBookComponent);
    bind(SearchRecipeComponent);
    bind(ViewRecipeComponent);

    // Services
    bind(QueryService);

    // Routes
    bind(RouteInitializerFn, toValue: recipeBookRouteInitializer);
    bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));
  }
}