import 'package:flutter/material.dart';
import 'package:foodapp/services/authservice.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:foodapp/services/suggestion.dart';
// import 'package:foodapp/views/dashboard.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
                autofocus: true,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder())),
          suggestionsCallback: (pattern) async {
              return CitiesService.getSuggestions(pattern);
          },
          itemBuilder: (context, suggestion) {
              return ListTile(
                title: Text(suggestion),
              );
          },
          onSuggestionSelected: (suggestion) {
              Navigator.pushNamed(context, '/dashboard', arguments: {
                'branch': suggestion,
              });
          },
        ),
            )),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Food Delivery System"),
        backgroundColor: Colors.red[900],
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Food Delivery App'),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assests/header.jpg')),
              ),
            ),
            ListTile(
              title: Text('Signout'),
              leading: Icon(Icons.verified_user),
              onTap: () {
                AuthService().signOut();
              },
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
