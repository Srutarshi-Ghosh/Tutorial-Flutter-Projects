import '../models/meal.dart';
import 'package:FoodApp/screens/favourites_screen.dart';
import '../screens/categories_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
    final List<Meal> favouriteMeals;

    TabsScreen(this.favouriteMeals);

    @override
    _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
    List<Map<String, Object>> _pages; 
    int _selectedPageIndex = 0;

    @override
    void initState() {
        _pages = [
            {'page': CategoriesScreen(), 'title': 'Categories'},
            {'page': FavouritesScreen(widget.favouriteMeals), 'title': 'Your Favourites'}
        ];

    super.initState();
  }

    void _selectPage(int index){
        setState(() {
            _selectedPageIndex = index;
        });
    }

    @override
    Widget build(BuildContext context) {
        // return DefaultTabController(
        //     length: 2,
        //     child: Scaffold(
        //         appBar: AppBar(
        //             title: Text("Meals"),
        //             bottom: TabBar(
        //                 tabs: <Widget>[
        //                     Tab(
        //                         icon: Icon(Icons.category),
        //                         text: "Categories",
        //                     ),
        //                     Tab(
        //                         icon: Icon(Icons.star),
        //                         text: "Favourites"
        //                     )
        //                 ],
        //             ),
        //         ),
        //         body: TabBarView(
        //             children: <Widget>[
        //                 CategoriesScreen(),
        //                 FavouritesScreen()
        //             ]
        //         ),
        //     ),
        // );

        return Scaffold(
            appBar: AppBar(
                title: Text(_pages[_selectedPageIndex]['title']),
            ),
            body: _pages[_selectedPageIndex]['page'],
            drawer: MainDrawer(),
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Theme.of(context).primaryColor,
                unselectedItemColor: Colors.black45,
                selectedItemColor: Theme.of(context).accentColor,
                currentIndex: _selectedPageIndex,
                items: [
                    BottomNavigationBarItem(
                        backgroundColor: Theme.of(context).primaryColor,
                        icon: Icon(Icons.category),
                        title: Text("Categories")
                    ),
                    BottomNavigationBarItem(
                        backgroundColor: Theme.of(context).primaryColor,
                        icon: Icon(Icons.star),
                        title: Text("Favourites")
                    )
                ],
                onTap: _selectPage,
            ),
        );

    }
}