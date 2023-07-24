import 'package:dummy/ui/post_screen/add_post.dart';
import 'package:dummy/ui/post_screen/delete.dart';
import 'package:dummy/ui/post_screen/show_list_data.dart';
import 'package:dummy/ui/post_screen/update.dart';
import 'package:dummy/widgets/round_button.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show All Operation '),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              RoundButton(
                  title: 'Add Data',
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPostScreen()));
                  }),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                  title: 'View Data',
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowList()));
                  }),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                  title: 'Update Data',
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateDate()));
                  }),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                  title: 'Delete Data',
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DeleteDate()));
                  }),
            ],
          ),
        ),
      ),

    );
  }
}
