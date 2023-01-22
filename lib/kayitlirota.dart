import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gmap/simple_map.dart';

class rotalar extends StatefulWidget {
  const rotalar({super.key});

  @override
  State<rotalar> createState() => _rotalarState();
}

class _rotalarState extends State<rotalar> {
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final CollectionReference rotalarRef = _database.collection('rotalar');
    double latt1, lonn1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF673AB7),
        title: Text('Kayıtlı Rotalar'),
      ),
      body: Center(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: rotalarRef.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
                  if (!asyncSnapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<DocumentSnapshot> rotalarList =
                        asyncSnapshot.data!.docs;
                    return Flexible(
                        child: ListView.builder(
                      itemCount: rotalarList.length,
                      itemBuilder: (context, index) {
                        var data =
                            rotalarList[index].data() as Map<String, dynamic>;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shadowColor: Colors.black,
                            elevation: 13,
                            child: ListTile(
                              title: Text(data["lat1"].toString()),
                              subtitle: Text(data["lon1"].toString()),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Text("Sil"),
                                            onTap: () async {
                                              Navigator.pop(context);
                                              await _database
                                                  .collection('rotalar')
                                                  .doc(rotalarList
                                                      .elementAt(index)
                                                      .id)
                                                  .delete();
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ));
                  }
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF673AB7),
        onPressed: () async {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MapScreen()));
        },
        child: Icon(Icons.location_on),
      ),
    );
  }
}
