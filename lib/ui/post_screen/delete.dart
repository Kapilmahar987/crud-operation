import 'package:dummy/ui/post_screen/add_post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class DeleteDate extends StatefulWidget {
  const DeleteDate({Key? key}) : super(key: key);

  @override
  State<DeleteDate> createState() => _DeleteDateState();
}

class _DeleteDateState extends State<DeleteDate> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('post');
  final editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Data'),
      ),
      body: Column(
        children: [
          Expanded(child:
          FirebaseAnimatedList(
              query: ref,
              itemBuilder: (Context, snapsot, animation, index) {
                final title = snapsot
                    .child('title')
                    .value
                    .toString();
                return ListTile(
                  title: Text(snapsot
                      .child('title')
                      .value
                      .toString()),
                  subtitle: Text(snapsot
                      .child('id')
                      .value
                      .toString()),
                  trailing: PopupMenuButton(
                      icon: Icon(Icons.more_vert),
                      itemBuilder: (context) =>
                      [
                        PopupMenuItem(
                          value: 1,
                          child: ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              ref.child(snapsot
                                  .child('id')
                                  .value
                                  .toString()).remove();
                            },
                            leading: Icon(Icons.delete),
                            title: Text('Delete'),

                          ),
                        ),
                      ]),

                );
              }),
          ),
        ],
      ),
    );
  }

}