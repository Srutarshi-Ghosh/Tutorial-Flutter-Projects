import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
    final List<Meal> favouriteMeals;

    FavouritesScreen(this.favouriteMeals);

    @override
    Widget build(BuildContext context) {
        if(favouriteMeals.isEmpty)
            return Center(
                child: Text("You have no favourites yet - Start adding Some!")
            );
        else{
            return ListView.builder(
                itemBuilder: (ctx, index)=> MealItem(
                        id: favouriteMeals[index].id,
                        title: favouriteMeals[index].title,
                        imageUrl: favouriteMeals[index].imageUrl,
                        affordability: favouriteMeals[index].affordability,
                        complexity: favouriteMeals[index].complexity,
                        duration: favouriteMeals[index].duration,
                    ),
                itemCount: favouriteMeals.length,
            );
        }
    }
}