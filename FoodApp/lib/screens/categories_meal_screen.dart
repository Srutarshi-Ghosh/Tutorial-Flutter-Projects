import 'package:FoodApp/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:FoodApp/dummy_data.dart';
import '../models/meal.dart';

class DisplayedMealsScreen extends StatefulWidget {
    static const routeName = '/category-meals';
    final List<Meal> availableMeals;

    DisplayedMealsScreen(this.availableMeals);

    @override
    _DisplayedMealsScreenState createState() => _DisplayedMealsScreenState();
}

class _DisplayedMealsScreenState extends State<DisplayedMealsScreen> {
    String categoryTitle;
    List<Meal> displayedMeals;
    bool _loadedInitData = false;


    void _removeMeal(String mealId){
        setState(() {
            displayedMeals.removeWhere((meal) => meal.id == mealId);
        });
    }

    @override
    void didChangeDependencies() {
        if(!_loadedInitData){
            final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
            final categoryId = routeArgs['id'];
            categoryTitle = routeArgs['title'];
            displayedMeals = widget.availableMeals.where((meal) => meal.categories.contains(categoryId)).toList();
            _loadedInitData = true;
        }
        super.didChangeDependencies();
    }

    @override
    Widget build(BuildContext context) {
        

        return Scaffold(
            appBar: AppBar(
                title: Text(categoryTitle),
            ),

            body: ListView.builder(
                itemBuilder: (ctx, index){
                    var meal = displayedMeals[index];
                    return MealItem(
                        id: meal.id,
                        title: meal.title,
                        imageUrl: meal.imageUrl,
                        affordability: meal.affordability,
                        complexity: meal.complexity,
                        duration: meal.duration,
                    );
                },
                itemCount: displayedMeals.length,
            ),

        );
    }
}