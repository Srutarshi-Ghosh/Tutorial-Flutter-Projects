import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';


class FiltersScreen extends StatefulWidget {
    static const routeName = "/filters";
    final Function saveFilters;
    Map<String, bool> filterList;

    FiltersScreen(this.filterList, this.saveFilters);

    @override
    _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
    // List<Map<String, Object>> _filterList = [
    //     {'title': 'glutenFree', 'value': false},
    //     {'title': 'vegan', 'value': false},
    //     {'title': 'vegeterian', 'value': false},
    //     {'title': 'lactoseFree', 'value': false}
    // ];

    // Map<String, bool> filterList = {
    //     'glutenFree': false,
    //     'vegan': false,
    //     'vegeterian': false,
    //     'lactoseFree': false
    // };


    Widget _buildSwitchListtile(String item, String title, String description){
        return SwitchListTile(
            title: Text(title),
            value: widget.filterList[item],
            subtitle: Text(description),
            onChanged: (newValue){
                setState(() {
                    widget.filterList[item] = newValue;
                });
            }
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Filters"),
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.save),
                        onPressed: (){
                            widget.saveFilters(widget.filterList);
                        },
                    )
                ],
            ),
            drawer: MainDrawer(),
            body: Column(
                children: <Widget>[

                    Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                            "Adjust your Selection",
                            style: Theme.of(context).textTheme.subtitle1,
                        ),
                    ),

                    Expanded(
                        child: ListView(
                            children: <Widget>[
                                _buildSwitchListtile('glutenFree', "Gluten-Free", "Only include Gluten-Free Items", ),
                                _buildSwitchListtile('vegan', "Vegan", "only include Vegan Items"),
                                _buildSwitchListtile('vegeterian', "Vegeteraian", "Only include Vegeterian Items"),
                                _buildSwitchListtile('lactoseFree', "Lactose-Free", "Only include Lactose-Free Items")
                            ],
                        ),
                    )

                ],
            ),
        );
    }
}