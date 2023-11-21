import 'package:flutter/material.dart';
import 'package:todo/utils/colors.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
    final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Title",
                  contentPadding: EdgeInsets.fromLTRB(0,10,0,0),
                  focusedBorder: UnderlineInputBorder()
                ),
              
                validator: (value){
                  if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                  return null;
                },
              ),

            TextFormField(
                decoration: const InputDecoration(
                  hintText: "Detail",
                  contentPadding: EdgeInsets.fromLTRB(0,30,0,0),
                  focusedBorder: UnderlineInputBorder()
                ),
                maxLines: 3,
                validator: (value){
                  if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                  return null;
                },
              ),

              Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: ElevatedButton(
                  onPressed: ()=>{},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                    minimumSize: const Size.fromHeight(50.0),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    shadowColor: Colors.grey[400],
                    elevation: 4
                  ),
                 child: const Text(
                  "ADD",
                  style: TextStyle(
                    fontSize: 21
                  ),
                 )),
              )
            ],
          ),
      ),
    );
  }
}