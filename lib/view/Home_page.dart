import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api_servies/get_product_servies.dart';
import 'Post/view/sigin_page.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu_outlined),
        title: Center(child: Text("Home page")),
        actions: [
          InkWell(
            onTap: () async {
              SharedPreferences perfer = await SharedPreferences.getInstance();
              perfer.remove('usernamedata').then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sigin_page(),
                  )));
            },
            child: Icon(Icons.logout),
          )
        ],
      ),
      body: FutureBuilder(
        future: Getproduct_servies.getporuct(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  snapshot.data[index]['title'],
                  maxLines: 1,
                ),
                subtitle: Text(snapshot.data[index]['category']),
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(snapshot.data[index]['image']),
                ),
                trailing: Text(snapshot.data[index]['price'].toString()),
              ),
            );
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
