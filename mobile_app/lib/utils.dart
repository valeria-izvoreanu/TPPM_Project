import 'package:flutter/material.dart';
import 'package:mobile_app/mobile/homepage.dart';
import 'package:mobile_app/mobile/playlists.dart';
class Playlist {
  final String title;
  final String description;
  //songs,songnumber etc

  const Playlist(this.title, this.description);
}

Widget bottomNavBar(context){
  return BottomNavigationBar(
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
    //currentIndex: _selectedIndex,
    selectedItemColor: Colors.black,
    onTap: (int index) {
      if (index == 0){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      }else if(index == 3){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Playlists()),
        );
      }
    },
  );
}