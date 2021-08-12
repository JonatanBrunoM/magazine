import 'package:flutter/material.dart';
import 'package:magazine/models/products.dart';
import 'package:magazine/provider/list_products.dart';
import 'package:magazine/style.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ofertas do dia",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Image.asset(
          "assets/images/logo.jpg",
          width: 30,
          height: 30,
        ),
        backgroundColor: blueTheme,
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Image.asset("assets/images/linha.jpg"),
          ],
        ),
      ),
    );
  }

  Widget builder(BuildContext _, int index) {
    Products _products = listProducts.elementAt(index);
    return ListTile(
      leading: IconButton(
        icon: (_products.isFavorite)
            ? Icon(
                Icons.favorite,
                color: pinkTheme,
              )
            : Icon(
                Icons.favorite_outlined,
                color: pinkTheme,
              ),
        onPressed: () {
          setState(() {
            _products.isFavorite = !_products.isFavorite;
          });
        },
      ),
    );
  }
}
