import 'package:flutter/material.dart';

import 'model/movie.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

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
          itemCount: movieList.length,
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
                    child: Text('M'),
                  ),
                ),
                trailing: Text('...'),
                title: Text(movieList[index].title),
                subtitle: Text('${movieList[0].title}'),
                // onTap: () =>
                //     debugPrint('Movie name: ${movies.elementAt(index)}'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieListViewDetails(
                                movieName: movieList.elementAt(index).title,
                              )));
                },
              ),
            );
          }),
    );
  }
}

// New route (page/screen)
class MovieListViewDetails extends StatelessWidget {
  final String movieName;

  const MovieListViewDetails({Key key, this.movieName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text('Movie'),
      ),
      backgroundColor: Colors.deepOrangeAccent.shade200,
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text('Go Back ${this.movieName}'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
