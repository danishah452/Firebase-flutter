import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseflutter/login.dart';
import 'package:flutter/material.dart';

import 'auth.dart';


class Homepage extends StatefulWidget {

  @override
  _HomepageState createState() => _HomepageState();

}

class _HomepageState extends State<Homepage> {

  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _priceController=TextEditingController();
  final TextEditingController _qtyController=TextEditingController();
  final TextEditingController _pictureController=TextEditingController();

  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('items');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(
            "Home",
            style: TextStyle(
              fontSize: 32.0,
              fontFamily: "lato",
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          elevation: 0.0,
          backgroundColor: Color(0xff070706),
          actions: [
            GoogleImage().getProfileImage(),
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),

              onPressed: () async {
                await auth.signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
              },
            ),
          ],
        ),
        body: SafeArea(
          left: false,
          right: false,
          // top: false,
          child: Expanded(
              child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                 width: MediaQuery.of(context).size.width,
height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                     child:  Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20),
                       child: TextFormField(
                         controller: _textEditingController,
                decoration: InputDecoration(
                    labelText: 'Add Item Name',
                    labelStyle: TextStyle(
                        fontFamily: 'Trueno',
                        fontSize: 21,
                        color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                    )),


                       ),
                     ),

                      ),
                    Container(
                      child:  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: _priceController,
                          decoration: InputDecoration(
                              labelText: 'Add Price',
                              labelStyle: TextStyle(
                                fontFamily: 'Trueno',
                                fontSize: 21,
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              )),


                        ),
                      ),

                    ),
                    Container(
                      child:  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: _qtyController,
                          decoration: InputDecoration(
                              labelText: 'Add Qty',
                              labelStyle: TextStyle(
                                fontFamily: 'Trueno',
                                fontSize: 21,
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              )),


                        ),
                      ),

                    ),
                    Container(
                      child:  Padding(
                        padding: const EdgeInsets.symmetric(vertical:20.0,horizontal: 20),
                        child: TextFormField(
                          controller: _pictureController,
                          decoration: InputDecoration(
                              labelText: 'Add Picture',
                              labelStyle: TextStyle(
                                fontFamily: 'Trueno',
                                fontSize: 21,
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              )),


                        ),
                      ),

                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      child: Container(
                        width: 200,
                        height: 50,
                        child: MaterialButton(
                          color: Colors.green,
                          elevation: 7,
                          child: Text(
                            'Add',
                            style: TextStyle(color: Colors.white, fontFamily: 'Trueno'),
                          ),
                          onPressed: () async {
                            await collectionReference.add({
                              'name': _textEditingController.text,
                              'price':_priceController.text,
                              'Qty':_qtyController.text,
                              'picture':_pictureController.text,

                            }).then((value) => _textEditingController.clear());

                          }),
                      ),


                    ),
      SizedBox(height: 10,),
      Expanded(
        child: StreamBuilder(stream: collectionReference.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(snapshot.hasData){
              return ListView(
                children: snapshot.data.docs.map((e) => Column(
                  children: [
                    ListTile(
                      title: Text(e['name'],
                    ),
                      subtitle: Text(e['price']),

                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(e['picture']),


                      ),
                      trailing:  InkWell(
                        child: Icon(
                          Icons.delete_forever,
                          color: Colors.green,
                        ),
                        onTap: ()async {
                      await collectionReference.doc('ve1MqbkNdXTEI581Occ7').delete().then((value) => print('deleted'));
                        },
                      ),

                    ),
                    Divider(color: Colors.black.withOpacity(0.6), thickness: 2,)
                  ],
                )).toList(),
              );
            }
            return Center(child: CircularProgressIndicator(),);
          },


        ),
      )],
                ),
              ),
            ),
          ),
        ),

      ),
    );
  }
}
