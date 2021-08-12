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
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: Image.asset("assets/images/logo.jpg"),
        ),
        backgroundColor: blueTheme,
      ),
      body: Column(
        children: [
          Image.asset("assets/images/linha.jpg"),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: builder,
              itemCount: listProducts.length,
              separatorBuilder: (BuildContext _, int index) {
                return SizedBox(
                  height: 6,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget builder(BuildContext _, int index) {
    Products _products = listProducts.elementAt(index);
    return Column(
      children: [
        ListTile(
          leading: Image.asset(_products.photo),
          trailing: IconButton(
            icon: (_products.isFavorite)
                ? Icon(
                    Icons.favorite,
                    color: pinkTheme,
                  )
                : Icon(
                    Icons.favorite_outline,
                    color: pinkTheme,
                  ),
            onPressed: () {
              setState(
                () {
                  _products.isFavorite = !_products.isFavorite;
                },
              );
            },
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _products.name,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                _products.description,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                _products.value,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: blueTheme,
                ),
              ),
              Text(
                _products.installments,
                style: TextStyle(
                  fontSize: 10,
                  color: blueTheme,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
