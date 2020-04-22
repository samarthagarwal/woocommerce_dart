import 'package:flutter/material.dart';
import 'package:woocommerce_api/woocommerce_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'WooCommerce API Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future _getProducts() async {
    // Initialize the API
    WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
        url: "https://www.yourwebsite.com",
        consumerKey: "ck_your_consumer_key",
        consumerSecret: "cs_your_consumer_secret");

    // Get data using the "products" endpoint
    var products = await wooCommerceAPI.getAsync("products");
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            // Create a list of products
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    child:
                        Image.network(snapshot.data[index]["images"][0]["src"]),
                  ),
                  title: Text(snapshot.data[index]["name"]),
                  subtitle:
                      Text("Buy now for \$ " + snapshot.data[index]["price"]),
                );
              },
            );
          }

          // Show a circular progress indicator while loading products
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
