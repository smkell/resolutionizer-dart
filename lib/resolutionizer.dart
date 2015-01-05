library resolutionizer;

import 'package:angular/angular.dart';
import 'package:resolutionizer/components/components.dart';

export 'package:resolutionizer/components/components.dart';

class ResolutionizerApp extends Module {
  ResolutionizerApp() {
    bind(RatingComponent);
    bind(RecipeBookComponent);
  }
}