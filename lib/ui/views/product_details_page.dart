import 'package:flutter/material.dart';
import 'package:flutter_commerce/core/models/product.dart';
import 'package:flutter_commerce/core/repository/data_repo.dart';

class ProductDetailsPage extends StatefulWidget {
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
      child: Column(
        children: <Widget>[
          appBar(),
          hero(),
          description,
          SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineButton(
                  child: Text(
                    "Add to cart",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Added item to cart"),
                    ));
                  },
                  textColor: Colors.orange,
                ),
                Text(
                  "৳ " + StaticHolderDataRepo().product.price.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2F2F3E)),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  var description = Container(
      child: Text(
        StaticHolderDataRepo().product.description,
        textAlign: TextAlign.justify,
        style: TextStyle(height: 1.5, color: Color(0xFF6F8398)),
        maxLines: 10,
      ),
      padding: EdgeInsets.all(16));

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
                  StaticHolderDataRepo().product.categoryCode,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
                SizedBox(height: 8.0),
                Text(
                  StaticHolderDataRepo().product.name,
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

  Widget hero() {
    return Container(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              StaticHolderDataRepo().product.imageUrl,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ), //This
          // should be a paged
          // view.
          // Positioned(
          //   child: appBar(),
          //   top: 0,
          // ),
        ],
      ),
    );
  }
}
