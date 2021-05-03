import 'package:firebaseflutter/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
            ),
      body:Consumer<CartProvider>(
        builder: (context,data,child){
        return  ListView.builder(
            itemCount: data.cartItemsList.length,
            itemBuilder: (context, index){
            return  data.cartItemsList== null || data.cartItemsList.length ==0
                  ? Text("Not Items in the Cart")
              : Card(
                child: ListTile(
                  title: Text(
                    data.cartItemsList[index].name,
                  ),
                  subtitle: Text(
                    "\$  "+  data.cartItemsList[index].price.toString(),
                  ),
trailing:  IconButton(
  icon: Icon(Icons.remove_circle_outline_outlined,color: Colors.green,),
  onPressed: (){
    data.remove(data.cartItemsList[index]);
  },
),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Consumer<CartProvider>(builder:( _,data,child){
          return Text("Total= ${data.cartvalue}",
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),);
      },
     ),
    );
  }
}
