# woocommerce_api

A dart package to interact with the WooCommerce API. It uses OAuth1.0a behind the scenes to generate the signature and URL string. It then makes calls and return the data back to the calling function.

## Getting Started

- Import the package

`import 'package:woocommerce_api/woocommerce_api.dart';`

- Initialize the SDK

```
WooCommerceAPI wc_api = new WooCommerceAPI(
    "http://www.mywoocommerce.com",
    "ck_...",
    "cs_..."
);
```

- Use functions

```
List _products = new List();

wc_api.getAsync("products?page=2").then((val) {  
    List products = val;
    print("Got " + products.length + "products received");
});
```
