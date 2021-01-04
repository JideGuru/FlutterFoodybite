import 'package:flutter/material.dart';
import 'package:flutter_foodybite/util/categories.dart';
import 'package:flutter_foodybite/widgets/category_item.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Categories'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(
          5.0,
        ),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            categories.length,
            (index) {
              var cat = categories[index];
              return Container(
                padding: EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        cat["img"],
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            // Add one stop for each color. Stops should increase from 0 to 1
                            stops: [0.2, 0.7],
                            colors: [
                              cat['color1'],
                              cat['color2'],
                            ],
                            // stops: [0.0, 0.1],
                          ),
                        ),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.height,
                      ),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.height,
                          padding: const EdgeInsets.all(1),
                          // constraints: BoxConstraints(
                          //   minWidth: 20,
                          //   minHeight: 20,
                          // ),
                          child: Center(
                            child: Text(
                              cat["name"],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
