import 'package:flutter/material.dart';
import 'package:mobile_app/utils.dart';
class PlaylistView extends StatelessWidget {
  const PlaylistView({super.key, required this.playlist});

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.amber,
            //scaffoldBackgroundColor: Colors.black,
            brightness: Brightness.dark
        ),
        home:Scaffold(
          appBar: AppBar(
            title: const Text('Spotify'),
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black,
          ),
          body: Center(
            child: body(context),
          ),
          bottomNavigationBar: bottomNavBar(context),
        )
    );
  }

  Widget body(context) {
    return Material(
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildTitle(playlist.title, playlist.description),
              SizedBox(
                  height: (MediaQuery.of(context).size.height)-220,
                  child:_buildPlaylistsTiles()),
            ],
          ),
        )
    );
  }

  Widget _buildTitle(name, songNr) {
    return ListTile(
      leading: FlutterLogo(size: 56.0),
      title: Text(name),
      subtitle: Text(songNr+" songs"),
      trailing: Icon(
          Icons.play_circle_fill,
          color: Colors.amber,
          size: 45.0,
          semanticLabel: 'Play Playlist'
      ),
    );
  }

  Widget _buildPlaylistsTiles() {
    return  Material(
      child: ListView(
        //scrollDirection: Axis.vertical,
        children: <Widget>[
          _playlistCard("Title", "60"),
          _playlistCard("Title", "60"),
          _playlistCard("Title", "60"),
          _playlistCard("Title", "60"),
          _playlistCard("Title", "60"),
          _playlistCard("Title", "60"),
          _playlistCard("Title", "60"),
          _playlistCard("Title", "60"),
          _playlistCard("Title", "60"),
          _playlistCard("Title", "60"),
          _playlistCard("Title", "60"),
          _playlistCard("Title", "60"),
        ],
      ),
    );
  }


  Widget _playlistCard(name, songNr){
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: ListTile(
          leading: FlutterLogo(size: 56.0),
          title: Text(name),
          subtitle: Text(songNr+" songs"),
          trailing: Icon(Icons.more_vert),
        ),
      ),
    );
  }
}