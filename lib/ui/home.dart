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
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: <Widget>[
              movieCard(movieList[index], context),
              Positioned(
                  top: 10.0,
                  left: 10.0,
                  child: movieImage(movieList[index].images[0])),
            ]);
            // return Card(
            //   elevation: 4.5,
            //   color: Colors.white,
            //   child: ListTile(
            //     leading: CircleAvatar(
            //       child: Container(
            //         width: 200,
            //         height: 200,
            //         decoration: BoxDecoration(
            //             // color: Colors.blue,
            //             image: DecorationImage(
            //               image: NetworkImage(movieList[index].poster),
            //               fit: BoxFit.cover
            //             ),
            //             borderRadius: BorderRadius.circular(13.9)),
            //         child: null,
            //       ),
            //     ),
            //     trailing: Text('...'),
            //     title: Text(movieList[index].title),
            //     subtitle: Text('${movieList[0].title}'),
            //     // onTap: () =>
            //     //     debugPrint('Movie name: ${movies.elementAt(index)}'),
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => MovieListViewDetails(
            //                     movieName: movieList.elementAt(index).title,
            //                     movie: movieList[index],
            //                   )));
            //     },
            //   ),
            // );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60.0),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.blue.shade900,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 54.0, right: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        'Rating: ${movie.imdbRating} / 10.0',
                        style: TextStyle(
                            fontSize: 15.0, color: Colors.yellowAccent),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('${movie.released}',
                          style: TextStyle(color: Colors.lightGreen)),
                      Text(
                        movie.runtime,
                        style: mainTextStyle(),
                      ),
                      Text(
                        movie.rated,
                        style: mainTextStyle(),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListViewDetails(
                      movieName: movie.title,
                      // movie.title,
                      movie: movie,
                    )))
      },
    );
  }

  TextStyle mainTextStyle() {
    return TextStyle(fontSize: 15.0, color: Colors.yellowAccent);
  }

  Widget movieImage(String imageURL) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageURL ??
                  'https://www.serole.com/wp-content/themes/aaika/assets/images/default.png'),
              fit: BoxFit.cover)),
    );
  }
}

// New route (page/screen)
class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;
  const MovieListViewDetails({Key key, this.movieName, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text('Movie'),
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(thumbnail: movie.images[0]),
          MovieDetailsHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie),
          HorizontalLine()
        ],
      ),
      // body: Center(
      //   child: Container(
      //     child: RaisedButton(
      //       child: Text('Go Back ${this.movie.director}'),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(alignment: Alignment.center, children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(thumbnail), fit: BoxFit.cover))),
          Icon(Icons.play_circle_outline, size: 100, color: Colors.white)
        ]),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x00374a5c), Color(0xff374a5c)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          height: 80,
        )
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeaderWithPoster({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(children: <Widget>[
        MoviePoster(poster: movie.images[1].toString()),
        SizedBox(
          width: 16,
        ),
        Expanded(child: MovieDetailsHeader(movie: movie))
      ]),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;
  const MoviePoster({Key key, this.poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(poster), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeader({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            movie.title,
            style: TextStyle(
                color: Colors.cyanAccent,
                fontWeight: FontWeight.w500,
                fontSize: 24),
          ),
        ),
        Text(
          '${movie.year} . ${movie.genre}'.toUpperCase(),
          style: TextStyle(
              color: Colors.yellowAccent, fontWeight: FontWeight.w400),
        ),
        Text.rich(TextSpan(
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            children: <TextSpan>[
              TextSpan(
                text: movie.plot,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 14),
              ),
              TextSpan(
                text: '. more...',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w300,
                    fontSize: 14),
              )
            ]))
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;

  const MovieDetailsCast({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          MovieField(field: 'Cast', value: movie.actors),
          MovieField(field: 'Directors', value: movie.director),
          MovieField(field: 'Awards', value: movie.awards)
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field, value;

  const MovieField({Key key, this.field, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$field: ',
          style: TextStyle(
              color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w300),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}
