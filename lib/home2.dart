import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';
import 'cart_screen.dart';
import 'model.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List <ItemModel>Itemslist = [];
  list(){
    Itemslist.add(ItemModel(name:"Apple", price:300, qty:12));
    Itemslist.add(ItemModel(name:"Orange", price:250, qty:12));
    Itemslist.add(ItemModel(name:"Peach", price:400, qty:12));
    Itemslist.add(ItemModel(name:"Mango", price:320,  qty:12));
    Itemslist.add(ItemModel(name:"Banana", price:200,  qty:12));
    Itemslist.add(ItemModel(name:"Grapes", price:200,  qty:12));
    Itemslist.add(ItemModel(name:"Cherry", price:360,  qty:12));
    Itemslist.add(ItemModel(name:"PineApple", price:190,  qty:12));
    Itemslist.add(ItemModel(name:"Apricot", price:450,  qty:12));
    Itemslist.add(ItemModel(name:"Guava", price:150,  qty:12));
    Itemslist.add(ItemModel(name:"Strawberry", price:130,  qty:12));
    Itemslist.add(ItemModel(name:"Berries", price:110,  qty:12));

  }
CartProvider cartProvider;


  @override
  void initState(){
    list();
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog"),
        actions: [
          IconButton(
              icon:Icon(Icons.add_shopping_cart),
            onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Cart()));
            },

          )
        ],
      ),
      body:ListView.builder(
        itemCount: Itemslist.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Text(
                  Itemslist[index].name,
              ),
              subtitle: Text(
                 "\$  "+  Itemslist[index].price.toString(),

              ),
              trailing: IconButton(
                icon: Icon(Icons.add,color: Colors.green,),
                onPressed: (){
                  cartProvider.addToCart(Itemslist[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
