import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/services/authservice.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class Dasboard extends StatefulWidget {
  Dasboard({Key key}) : super(key: key);

  @override
  _DasboardState createState() => _DasboardState();
}

class _DasboardState extends State<Dasboard> {
  Map branchM = {};
  @override
  Widget build(BuildContext context) {
    branchM = ModalRoute.of(context).settings.arguments;
    String branch = branchM['branch'];
    return Scaffold(
      appBar: AppBar(
        title: Text(branch),
        backgroundColor: Colors.red[900],
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection(branch).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return new ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  return Card(
                    child: new SwitchListTile(
                      value: document['avail'],
                      title: new Text(document['name']),
                      subtitle: new Text(
                          "Price     " + document['price'] + " dollar"),
                      onChanged: (bool value) {
                        document['avail']==true ?
                        document.reference.updateData({
                          'avail': false,
                        })
                        :document.reference.updateData({
                          'avail': true,
                        });

                      },
                    ),
                  );
                }).toList(),
              );
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Food Delivery App'),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/header.jpg')),
              ),
            ),
            ListTile(
              title: Text('Signout'),
              leading: Icon(Icons.verified_user),
              onTap: () {
                AuthService().signOut();
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(context, AuthService().handleAuth());
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
