import 'package:dummy/widgets/round_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


  class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
  }

  class _AddPostScreenState extends State<AddPostScreen> {
  final postController = TextEditingController();
  bool loading =false;
  final databaseRef = FirebaseDatabase.instance.ref('post');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Post'),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
           SizedBox(
             height: 30,
           ),
            TextField(
              controller: postController,
              decoration: InputDecoration(
               hintText: 'Enter the name',
                border: OutlineInputBorder(),

              ),
            ),
            SizedBox(
              height: 30,
            ),
            RoundButton(
                title: 'Add Name', onTap: (){
                  setState(() {
                    loading=true;
                  });
                  String id =DateTime.now().millisecondsSinceEpoch.toString();
                  databaseRef.child(id).set({
                'title':postController.text.toString(),
                'id':id,
              });
            }),
          ],
        ),
      ),
    );
  }
}




