import 'package:flutter/material.dart';
import 'package:flutter_commerce/core/models/category.dart';
import 'package:flutter_commerce/core/repository/data_repo.dart';
import 'package:flutter_commerce/ui/shared/router.dart';
import 'package:flutter_commerce/utils/TextStyles.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  var categories = StaticHolderDataRepo().getCategories();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(categories.length, (index) {
          return GestureDetector(
            onTap: (){
              StaticHolderDataRepo().setIndex(index);
              Navigator.pushNamed(context, '/products');
            },
            child: Container(
              child: Card(
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        categories[index].imageUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.black26,
                        padding: EdgeInsets.all(1),
                        child: Text(
                          categories[index].name.toUpperCase(),
                          style: TextStyles.bold14,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
