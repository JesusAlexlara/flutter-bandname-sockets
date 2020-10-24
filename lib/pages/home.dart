import 'package:band_names/models/band.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Band> bands = [
    Band(id: '1', name: 'Metallica', vote: 3),
    Band(id: '2', name: 'Queen', vote: 5),
    Band(id: '3', name: 'Héroes del silencio', vote: 1),
    Band(id: '4', name: 'Bon Jovi', vote: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Band Names', style: TextStyle(color: Colors.black87),),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) =>_bandTitle(bands[i])
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        elevation: 1,
        onPressed: _addNewBand,
      ),
   );
  }

  Widget _bandTitle(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: ( direction ) {
        print('direction $direction');
      } ,
      background: Container(
        padding: EdgeInsets.only( left: 10.0 ),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Delete Band', style: TextStyle(color: Colors.white)),
        )
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.name.substring(0, 2)),
          backgroundColor: Colors.blue[100]
        ),
        title: Text( band.name ),
        trailing: Text( '${ band.vote }', style: TextStyle( fontSize: 20 ) ),
        onTap: () {
          print(band.name);
        },
      ),
    );
  }

  _addNewBand() {

    final textController = new TextEditingController();

    showDialog(
      context: context,
      builder: ( context ) {
        return AlertDialog(
          title: Text('New band name:'),
          content: TextField(
            controller: textController,
          ),
          actions: <Widget>[
            MaterialButton(
              child: Text('add'),
              textColor: Colors.blue,
              elevation: 5,
              onPressed: () => addBandToList( textController.text )
            )
          ],
        );
      }
    );
  }

  void addBandToList(String name) {

    print(name);
    if (name.length > 1) {
      this.bands.add( new Band( id: DateTime.now().toString(), name: name, vote: 0 ) );
    }
    setState(() {});
    Navigator.pop(context);
  }
}