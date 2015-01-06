library resolutionizer.test;

import 'package:unittest/unittest.dart';
import 'package:di/di.dart';
import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';
import 'package:resolutionizer/resolutionizer.dart';

main() {
  testComponents();
}

void testComponents() {
  setUp(() {
    setUpInjector();
    module((Module m) => m.install(new ResolutionizerApp()));
  });
  tearDown(tearDownInjector);

  group('recipe book component', () {

    test('should load recipes', async(inject((Injector injector, MockHttpBackend backend) {

      backend.expectGET('recipes.json').respond('[{"name": "test1"}]');
      backend.expectGET('categories.json').respond('["c1"]');

      var recipeBook = injector.get(RecipeBookComponent);
      expect(recipeBook.allRecipes, isEmpty);

      microLeap();
      backend.flush();
      microLeap();

      expect(recipeBook.allRecipes, isNot(isEmpty));
    })));

    test('should select recipe', async(inject((Injector injector, MockHttpBackend backend) {

      backend.expectGET('recipes.json').respond('[{"name": "test1"}]');
      backend.expectGET('categories.json').respond('["c1"]');

      var recipeBook = injector.get(RecipeBookComponent);
      expect(recipeBook.allRecipes, isEmpty);

      microLeap();
      backend.flush();
      microLeap();

      var recipe = recipeBook.allRecipes[0];
      recipeBook.selectRecipe(recipe);
      expect(recipeBook.selectedRecipe, same(recipe));
    })));
  });

  group('rating component', () {

    test('should show the right number of stars', inject((RatingComponent rating) {
      rating.maxRating = '5';
      expect(rating.stars, equals([1,2,3,4,5]));
    }));

    test('should handle click', inject((RatingComponent rating) {
      rating.maxRating = '5';
      rating.handleClick(3);
      expect(rating.rating, equals(3));

      rating.handleClick(1);
      expect(rating.rating, equals(1));

      rating.handleClick(1);
      expect(rating.rating, equals(0));

      rating.handleClick(1);
      expect(rating.rating, equals(1));
    }));
  });

  group('category filter', () {
    test('should return subset', inject((CategoryFilter filter) {
      var r1 = new Recipe(null, null, 'C1', null, null, null, null);
      var r2 = new Recipe(null, null, 'C2', null, null, null, null);
      var list = [r1, r2];
      var map = {"C1": false, "C2": true};
      expect(filter(list, map), equals([r2]));
    }));
  });

  group('syrup filter', () {
    test('should return maple syrup', inject((SyrupFilter filter) {
      var s1  = "sugar";
      var s2 = "powdered sugar";
      var s3 = "Add all of the sugar to a bowl.";
      var s4 = "Add all of the powdered sugar to a bowl.";

      expect(filter(s1), equals("maple syrup"));
      expect(filter(s2), equals("maple syrup"));
      expect(filter(s3), equals("Add all of the maple syrup to a bowl."));
      expect(filter(s4), equals("Add all of the maple syrup to a bowl."));
    }));
  });

  group('fahrenheit to celcius filter', () {
    test('should convert fahrenheit to celcius', inject((FahrenheitToCelciusFilter filter) {
      var f1 = "300 degrees F";
      var c1 = "150 degrees C";

      expect(filter(f1), equals(c1));
    }));
  });
}