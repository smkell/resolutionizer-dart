library resolutionizer;

import 'package:angular/angular.dart';
import 'package:resolutionizer/components/components.dart';
import 'package:resolutionizer/formatters/formatters.dart';
import 'package:resolutionizer/tooltip/tooltip.dart';

export 'package:resolutionizer/components/components.dart';
export 'package:resolutionizer/formatters/formatters.dart';

part 'recipe.dart';

class ResolutionizerApp extends Module {
  ResolutionizerApp() {
    bind(CategoryFilter);
    bind(RatingComponent);
    bind(RecipeBookComponent);
    bind(Tooltip);
  }
}