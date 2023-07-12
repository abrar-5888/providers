import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/movies_provider.dart';

class AnotherScreen extends StatelessWidget {
  const AnotherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favList = context.watch<Movies>().favList;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Another Screen'),
        ),
        body: ListView.builder(
          itemCount: favList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Movie ${favList[index]}'),
              trailing: TextButton(
                onPressed: () {
                  // Remove the movie from the favorites list
                  context.read<Movies>().removeFromFavorites(favList[index]);
                },
                child: Text(
                  'Remove',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
