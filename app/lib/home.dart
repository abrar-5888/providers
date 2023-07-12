import 'package:flutter/material.dart';
import '/another_screen.dart';

import 'package:app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var fav = context.watch<Movies>().favList;
    print(fav);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.shopping_cart_rounded),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AnotherScreen(),
            ));
          }),
      appBar: AppBar(
        title: Text('Providers in StateLess Widget'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text('Movies $index'),
              trailing: GestureDetector(
                child: Icon(Icons.favorite,
                    color: fav.contains(index) ? Colors.red : Colors.grey),
                onTap: () {
                  if (!fav.contains(index)) {
                    context.read<Movies>().addToFavorites(index);
                    print(fav);
                  } else if (fav.contains(index)) {
                    context.read<Movies>().removeFromFavorites(fav[index]);
                  }
                },
              ));
        },
        itemCount: 20,
      ),
    );
  }
}
