import 'package:flutter/material.dart';

class Product {
  String name;
  String description;

  Product(this.name, this.description);
}

void main() => runApp(ProductList(List<Product>.generate(100, (index) {
      return Product('item $index', 'a long description for item $index');
    })));

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList(this.products);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('product list'),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('${products[index].name}'),
              onTap: () async {
                String result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return ProductDetail(products[index]);
                }));
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('return: $result'),
                ));
              },
            );
          },
        ),
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail(this.product);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('${product.name}'),
        ),
        body: Center(
            child: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.pop(context, product.description);
            },
            child: Container(
              child: Column(
                children: <Widget>[
                  Image.asset('images/cherry_delivery.png'),
                  Text('${product.description}')
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
