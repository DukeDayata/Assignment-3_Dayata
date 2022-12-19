import 'package:flutter/material.dart';
import 'package:sqflite_demo/database_connector/dbHelper.dart';

import 'product.dart';





class ProductAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductAddState();
  }
}

class ProductAddState extends State {
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtUnitPrice = TextEditingController();
  var dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add New Product",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 20, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              buildNameField(),
              buildDescriptionField(),
              buildUnitPriceField(),
              buildSavebutton(),
            ],
          ),
        ));
  }

  Widget buildNameField() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Product Name",
      ),
      controller: txtName,
    );
  }

  Widget buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Product Description : ",
      ),
      controller: txtDescription,
    );
  }

  Widget buildUnitPriceField() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Product Price: ",
      ),
      controller: txtUnitPrice,
    );
  }

  Widget buildSavebutton() {
    return ElevatedButton(
      child: Text(
          "Add",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: Colors.black)
      ),
      onPressed: () {
        addProduct();
      },
    );
  }

  void addProduct() async {
    // Insert the product into the database.
    var result = await dbHelper.insert(Product(
        name: txtName.text,
        description: txtDescription.text,
        unitPrice: double.tryParse(txtUnitPrice.text)));

    // Check if the insertion was successful.
    if (result != 0) {
      // Pop the current route and pass a true value to the previous route.
      Navigator.pop(context, true);
    } else {
      // Handle the error.
      // ...
    }
  }
}
