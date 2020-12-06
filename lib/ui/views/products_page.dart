import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_commerce/core/models/product.dart';
import 'package:flutter_commerce/core/repository/data_repo.dart';
import 'package:flutter_commerce/core/repository/firebase_repo.dart';
import 'package:flutter_commerce/utils/TextStyles.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Product> products;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<FirebaseRepository>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            appBar(),
            Container(
              child: StreamBuilder(
                  stream: productProvider.fetchProductsAsStream(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      products = snapshot.data.docs
                          .map((doc) => Product.fromMap(doc.data(), doc.id))
                          .toList();
                      final ThemeData theme = Theme.of(context);

                      return GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: List.generate(products.length, (index) {
                          return GestureDetector(
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  AspectRatio(
                                    aspectRatio: 18.0 / 10.0,
                                    child: Image.network(
                                      products[index].imageUrl,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            products[index].name,
                                            style: theme.textTheme.headline6,
                                            maxLines: 1,
                                          ),
                                          SizedBox(height: 8.0),
                                          Text(
                                            "৳ "+products[index].price.toString(),
                                            style: theme.textTheme.subtitle2,
                                          ),
                                          SizedBox(height: 8.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){
                              StaticHolderDataRepo().setProduct(products[index]);
                              Navigator.pushNamed(context, '/products/details');
                            },
                          );
                          // return ProductCard(productDetails: products[index]);
                        }),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          mini: true,
          onPressed: _insertNewItem,
          tooltip: 'Add item',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void _insertNewItem() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Add new item"),
    ));
  }

  Widget appBar() {
    return Container(
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black87,
              size: 28,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "products",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
                SizedBox(height: 8.0),
                Text(
                  StaticHolderDataRepo().getCategories()[StaticHolderDataRepo().index].name,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2F2F3E)),
                ),
              ],
            ),
          ),
          Icon(
            Icons.shopping_basket,
            color: Colors.white,
            size: 28,
          ),
        ],
      ),
    );
  }
}
