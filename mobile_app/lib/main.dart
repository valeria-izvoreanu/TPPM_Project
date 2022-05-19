import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyApp> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.amber,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music_sharp),
                label: 'Your Library',
                backgroundColor: Colors.amber,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: Colors.amber,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.playlist_play_sharp),
                label: 'Playlists',
                backgroundColor: Colors.amber,
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            onTap: _onItemTapped,
          ),
        )
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildTitle("Frequent Playlists"),
          SizedBox(
              height: 230,
              child:_buildPlaylistsTiles()),
          _buildTitle("Made For User"),
          SizedBox(
              height: 250,
              child:_buildMadeForUser()),
          _buildTitle("Other Categories"),
          //TODO
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

  Widget _buildPlaylistsTiles() {
    return  Material(
        child: ListView(
          //scrollDirection: Axis.vertical,
          children: <Widget>[
            _playlistTile("Title", "60"),
            _playlistTile("Title", "60"),
            _playlistTile("Title", "60"),
          ],
        ),
    );
  }

  Widget _playlistTile(name, songNr){
    return  ListTile(
      leading: FlutterLogo(size: 56.0),
      title: Text(name),
      subtitle: Text(songNr+" songs"),
      trailing: Icon(Icons.more_vert),
    );
  }

  Widget _buildMadeForUser() {
    return  Material(
      child: ListView(
        children: <Widget>[
          _playlistCard("name", "description"),
          _playlistCard("name", "description"),
          _playlistCard("name", "description"),
        ],
      ),
    );
  }

  Widget _playlistCard(name, description){
    return Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: ListTile(
            leading: Icon(Icons.album),
            title: Text(name),
            subtitle: Text(description),
          )
        ),
    );
  }
}
