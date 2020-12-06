import 'package:flutter_commerce/core/models/category.dart';
import 'package:flutter_commerce/core/models/product.dart';

class StaticHolderDataRepo {
  static final StaticHolderDataRepo _singleton =
      StaticHolderDataRepo._internal();

  int _index = 0;
  Product _product;

  factory StaticHolderDataRepo() => _singleton;

  StaticHolderDataRepo._internal();

  List<Category> getCategories() {
    return [
      Category("Tops", "tops",
          "https://ae01.alicdn.com/kf/H5ff7537866dc402897d75ed0629c8860r/Tom-Hagen-Blouse-Women-Ladies-Tops-Floral-Chiffon-Blouse-for-Women-Tops-Ruffles-Stand-Butterfly-Sleeve.jpg"),
      Category("Blazers", "blazers",
          "https://4.imimg.com/data4/GM/VV/MY-31967571/mens-suit-500x500.jpg"),
      Category("Pants", "pants",
          "https://www.toadandco.com/product_images/T1441816-Starfish-1-P.jpg?resizeid=14&resizeh=816&resizew=632"),
      Category("Shorts", "shorts",
          "https://images.boardriders.com/globalGrey/quiksilver-products/all/default/large/eqyws03644_heritagebeachshort,w_bfm0_frt1.jpg"),
      Category("Skirts", "skirts",
          "https://media1.popsugar-assets.com/files/thumbor/7s12e9wLfIPTxlnIb3vwxS_RK90/fit-in/728xorig/filters:format_auto-!!-:strip_icc-!!-/2019/05/14/869/n/1922564/3115ac5b5cdb1c58727788.79149968_/i/Best-Skirts-2019.jpg"),
      Category("Dresses", "dresses",
          "https://cdn-1.azazie.com/upimg/s600/68/7f/38a2fc0a68093dc21b074802b723687f.jpg"),
      Category("Shoes", "shoes",
          "https://assets.ajio.com/medias/sys_master/root/ajio/catalog/5ef38fcbf997dd433b43d714/-473Wx593H-461205998-black-MODEL.jpg"),
      Category("Accessories", "accessories",
          "https://envato-shoebox-0.imgix.net/8da1/f28e-8a80-49bf-8885-433fa6ad9d72/16122218522016.jpg?auto=compress%2Cformat&fit=max&mark=https%3A%2F%2Felements-assets.envato.com%2Fstatic%2Fwatermark2.png&markalign=center%2Cmiddle&markalpha=18&w=700&s=a3b178c1d5ecb8656e6a13c0dd725a18"),
    ];
  }

  int get index => _index;

  Product get product => _product;

  void setIndex(int index) {
    this._index = index;
  }

  void setProduct(Product product) {
    this._product = product;
  }
}
