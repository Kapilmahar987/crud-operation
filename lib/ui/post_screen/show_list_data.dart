import 'package:dummy/ui/post_screen/add_post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ShowList extends StatefulWidget {
  const ShowList({Key? key}) : super(key: key);

  @override
  State<ShowList> createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final ref  = FirebaseDatabase.instance.ref('post');

    return Scaffold(
      appBar: AppBar(
        title: Text('View All Data'),
      ),
      body: Column(
        children: [
          Expanded(child:
           FirebaseAnimatedList(
              query: ref,
              itemBuilder: (Context, snapsot,animation,index){
                return ListTile(
                  title: Text(snapsot.child('title').value.toString()),
                  subtitle: Text(snapsot.child('id').value.toString()),

                );
              }),
          ),
        ],
      ),
    );
  }
}
