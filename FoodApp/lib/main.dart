import 'package:FoodApp/dummy_data.dart';
import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/categories_meal_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
    @override
    _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    Map<String, bool> _filters = {
        'glutenFree': false,
        'vegan': false,
        'vegeterian': false,
        'lactoseFree': false
    };
    List<Meal> _availableMeals = DUMMY_MEALS;
    List<Meal> _favouriteMeals = [];

    void _setFilters(Map<String, bool> filterData){
        setState(() {
            _filters = filterData;
            _availableMeals = DUMMY_MEALS.where((meal) {
                if(_filters['glutenFree'] && !meal.isGlutenFree)
                    return false;
                if(_filters['vegan'] && !meal.isVegan)
                    return false;
                if(_filters['vegeterian'] && !meal.isVegetarian)
                    return false;
                if(_filters['lactoseFree'] && !meal.isLactoseFree)
                    return false;
                return true;

            }).toList();
        });
    }

    void _toggleFavourite(String mealId){
        final existingIndex = _favouriteMeals.indexWhere((meal)=> meal.id == mealId);
        if(existingIndex >= 0)
            setState(() {
                _favouriteMeals.removeAt(existingIndex);
            });
        else
            setState(() {
                _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
            });       
    }

    bool isMealFavourite(String id){
        return _favouriteMeals.any((meal) => meal.id == id);
    }

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: "DeliMeals",
            theme: ThemeData(
                primarySwatch: Colors.blue, 
                accentColor: Colors.amber,
                canvasColor: Color.fromRGBO(255, 254, 229, 1),
                fontFamily: "Raleway",
                textTheme: ThemeData.light().textTheme.copyWith(
                    bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                    bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                    subtitle1: TextStyle(
                        fontSize: 20,
                        fontFamily: "RobotoCondensed",
                        fontWeight: FontWeight.bold
                    )
                ),
            ),
            home: TabsScreen(_favouriteMeals),
            routes: {
                DisplayedMealsScreen.routeName: (ctx)=> DisplayedMealsScreen(_availableMeals),
                MealDetailScreen.routeName: (ctx)=> MealDetailScreen(_toggleFavourite, isMealFavourite),
                FiltersScreen.routeName: (ctx)=> FiltersScreen(_filters, _setFilters)
            },
            onUnknownRoute: (settings){
                return MaterialPageRoute(builder: (ctx)=> CategoriesScreen());
            },
        );
    }
}


