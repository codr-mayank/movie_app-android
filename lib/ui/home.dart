import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {
  final List movies = [
    'Titanic',
    'Blade Runner',
    'Rambo',
    'The Avengers',
    'Avatar',
    'I Am Legend',
    '300',
    'The Wolf of Wall Street',
    'Interstellar',
    'Game of Thrones',
    'Vikings'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        backgroundColor: Colors.black12,
      ),
      backgroundColor: Colors.deepOrangeAccent.shade200,
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4.5,
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: BorderRadius.circular(13.9)),
                    child: Text('H'),
                  ),
                ),
                trailing: Text('...'),
                title: Text(movies[index]),
                subtitle: Text('sub'),
                // onTap: () =>
                //     debugPrint('Movie name: ${movies.elementAt(index)}'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieListViewDetails()));
                },
              ),
            );
          }),
    );
  }
}

// New route (page/screen)
class MovieListViewDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent.shade200,
        title: Text('Movie'),
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text('Go Back'),
            onPressed: () {},
            // onPressed: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => MovieListView()));
            // },
          ),
        ),
      ),
    );
  }
}
