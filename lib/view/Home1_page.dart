import 'package:flutter/material.dart';
import '../api_servies/get_product_servies.dart';
import '../model/product_responce_model.dart';

class Home1_page extends StatefulWidget {
  const Home1_page({Key? key}) : super(key: key);

  @override
  State<Home1_page> createState() => _Home1_pageState();
}

class _Home1_pageState extends State<Home1_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Getproduct_servies.getproduct_modal(),
        builder: (context, AsyncSnapshot<List<ProductResMod>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final product = snapshot.data![index];
                  return ListTile(
                    title: Text(product.title.toString()),
                    subtitle: Text(product.category.toString()),
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(product.image.toString()),
                    ),
                    trailing: Text(product.price.toString()),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
