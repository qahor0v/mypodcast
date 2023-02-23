import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetPodcastPage extends StatefulWidget {
  static const String id = "rgare";

  const GetPodcastPage({Key? key}) : super(key: key);

  @override
  State<GetPodcastPage> createState() => _GetPodcastPageState();
}

class _GetPodcastPageState extends State<GetPodcastPage> {
  final CollectionReference _newest_podcasts =
      FirebaseFirestore.instance.collection("newest_podcasts");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GET"),
      ),
      body: StreamBuilder(
          stream: _newest_podcasts.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(documentSnapshot["name"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          const SizedBox(height: 5,),
                          Text(documentSnapshot["duration"],style: TextStyle(fontSize: 16),),
                          const SizedBox(height: 5,),
                          Text(documentSnapshot["releaseDate"],style: TextStyle(fontSize: 16),),
                          const SizedBox(height: 5,),
                          Text(documentSnapshot["synopsis"],style: TextStyle(fontSize: 16),),
                          const SizedBox(height: 5,),
                          Text(documentSnapshot["details"],style: TextStyle(fontSize: 16),),
                          const SizedBox(height: 15,),
                        ],
                      ),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
