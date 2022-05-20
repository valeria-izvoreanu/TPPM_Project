import 'package:flutter/material.dart';
import 'package:mobile_app/mobile/playlistview.dart';
import 'package:mobile_app/utils.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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

  Widget body(context){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildTitle("Frequent Playlists"),
          SizedBox(
              height: 230,
              child:_buildPlaylistsTiles(context)),
          _buildTitle("Made For User"),
          SizedBox(
              height: 250,
              child:_buildMadeForUser(context)),
          _buildTitle("Other Categories"),
          SizedBox(
            height: 80.0,
            width: (MediaQuery.of(context).size.width),
            child: _buildOtherCategories()
          )
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
          _playlistTile("Title", "60", context),
          _playlistTile("Title", "60", context),
          _playlistTile("Title", "60", context),
        ],
      ),
    );
  }

  Widget _playlistTile(name, songNr, context){
    return  ListTile(
      leading: FlutterLogo(size: 56.0),
      title: Text(name),
      subtitle: Text(songNr+" songs"),
      trailing: Icon(
          Icons.play_circle_fill,
          color: Colors.amber,
          size: 30.0,
          semanticLabel: 'Play Playlist'
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PlaylistView(playlist: Playlist("name", "60 songs"))),
        );
      },
    );
  }

  Widget _buildMadeForUser(context) {
    return  Material(
      child: ListView(
        children: <Widget>[
          _playlistCard("name", "description", context),
          _playlistCard("name", "description", context),
          _playlistCard("name", "description", context),
        ],
      ),
    );
  }

  Widget _playlistCard(name, description, context){
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
            leading: Icon(Icons.album),
            title: Text(name),
            subtitle: Text(description),
          )
      ),
    );
  }

  Widget _buildCategories(name){
    return SizedBox(
        width: 100,
        height: 100,
        child:Column(
          children: [
            FlutterLogo(size: 56.0),
            SizedBox(
                height: 20,
                child: Text(name),
            ),
          ],
        )
    );
  }

  Widget _buildOtherCategories(){
    return ListView(
        scrollDirection: Axis.horizontal,
        children:<Widget>[
          _buildCategories("Funny"),
          _buildCategories("Funny"),
          _buildCategories("Funny"),
          _buildCategories("Funny"),
          _buildCategories("Funny"),
          _buildCategories("Funny"),
      ]
    );
  }
}
