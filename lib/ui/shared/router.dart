import 'package:flutter/material.dart';
import 'package:flutter_commerce/ui/views/_my_homepage.dart';
import 'package:flutter_commerce/ui/views/product_details_page.dart';
import 'package:flutter_commerce/ui/views/products_page.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return  MaterialPageRoute(
            builder: (_)=> MyHomePage()
        );
      case '/products' :
        return MaterialPageRoute(
            builder: (_)=> ProductsPage()
        ) ;
      case '/products/details' :
        return MaterialPageRoute(
            builder: (_)=> ProductDetailsPage()
        ) ;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}