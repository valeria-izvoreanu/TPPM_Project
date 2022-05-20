import 'package:flutter/material.dart';
import 'package:mobile_app/utils.dart';
import 'package:mobile_app/mobile/playlistview.dart';
class Playlists extends StatelessWidget {
  const Playlists({Key? key}) : super(key: key);

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildTitle("Your Playlists"),
          SizedBox(
              height: (MediaQuery.of(context).size.height)-220,
              child:_buildPlaylistsTiles(context)),
        ],
      ),
    );
  }

  Widget _buildTitle(text) {
    return Center(child:Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Text(text,
          style: TextStyle(fontSize: 22),
        )));
  }

  Widget _buildPlaylistsTiles(context) {
    return  Material(
      child: ListView(
        //scrollDirection: Axis.vertical,
        children: <Widget>[
          _playlistCard("Title", "60", context),
          _playlistCard("Title", "60", context),
          _playlistCard("Title", "60", context),
          _playlistCard("Title", "60", context),
          _playlistCard("Title", "60", context),
          _playlistCard("Title", "60", context),
          _playlistCard("Title", "60", context),
          _playlistCard("Title", "60", context),
          _playlistCard("Title", "60", context),
          _playlistCard("Title", "60", context),
          _playlistCard("Title", "60", context),
          _playlistCard("Title", "60", context),
        ],
      ),
    );
  }


  Widget _playlistCard(name, songNr, context){
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PlaylistView(playlist: Playlist("name", "60 songs"))),
          );
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
