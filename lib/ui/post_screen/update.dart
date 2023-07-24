import 'package:dummy/ui/post_screen/add_post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class UpdateDate extends StatefulWidget {
  const UpdateDate({Key? key}) : super(key: key);

  @override
  State<UpdateDate> createState() => _UpdateDateState();
}

class _UpdateDateState extends State<UpdateDate> {
  final auth = FirebaseAuth.instance;
  final ref  = FirebaseDatabase.instance.ref('post');
  final editController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Data'),
      ),
      body: Column(
        children: [
          Expanded(child:
          FirebaseAnimatedList(
              query: ref,
              itemBuilder: (Context, snapsot,animation,index){
                final title = snapsot.child('title').value.toString();
                return ListTile(
                  title: Text(snapsot.child('title').value.toString()),
                  subtitle:Text(snapsot.child('id').value.toString()),
                  trailing: PopupMenuButton(
                      icon: Icon(Icons.more_vert),
                      itemBuilder: (context)=>[
                        PopupMenuItem(
                            value:1,
                            child:ListTile(
                              onTap: (){
                                Navigator.pop(context);
                                showMyDialog(title,snapsot.child('id').value.toString());
                              },
                              leading: Icon(Icons.edit),
                              title: Text('Edit'),

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

  Future<void> showMyDialog(String title,String id)async {
    editController.text= title;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Update'),
            content: Container(
              child: TextField(
                controller:editController,
                decoration: InputDecoration(
                  hintText: 'Edit',
                ),
              ),
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Cancel'),
              ),
              TextButton(onPressed: (){
                Navigator.pop(context);
                ref.child(id).update({
                  'title':editController.text.toString(),
                });
              }, child: Text('Update'),
              ),
            ],
          );
        }

    );

  }
}
