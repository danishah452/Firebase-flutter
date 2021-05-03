import 'package:firebaseflutter/model.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  List<ItemModel> cartItemsList =[];
  double cartvalue = 0;

  addToCart (ItemModel itemModel){
    cartItemsList.add(itemModel);
    cartvalue +=itemModel.price;
    notifyListeners();
    print ("Added to Cart");
  }
   remove(ItemModel itemModel) {
     cartItemsList.remove(itemModel);
     cartvalue -= itemModel.price;
    notifyListeners();
    print ("deleted");
  }

}

