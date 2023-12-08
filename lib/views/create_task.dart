import 'package:flutter/material.dart';
import 'package:todo/components/app_bar.dart';
import 'package:todo/models/tasklist.dart';
import 'package:todo/models/tasks.dart';
import 'package:todo/utils/colors.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _detailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: MyAppBar(apptitle: 'Add Task'),
      body: createTaskStructure(),
    );
  }

  Padding createTaskStructure() {
    return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: "Title",
                contentPadding: EdgeInsets.fromLTRB(0,10,0,0),
                focusedBorder: UnderlineInputBorder()
              ),
            
              validator: (value){
                if (value == null || value.isEmpty) {
                    return 'Describe your task';
                  }
                return null;
              },
            ),

          TextFormField(
            controller: _detailController,
              decoration: const InputDecoration(
                hintText: "Detail",
                contentPadding: EdgeInsets.fromLTRB(0,30,0,0),
                focusedBorder: UnderlineInputBorder()
              ),
              maxLines: 3,
             
            ),

            Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: ElevatedButton(
                onPressed: (){
                      if (_formKey.currentState?.validate() ?? false) {
                    // Create a new TaskList instance based on user input
                    TaskList newTask = TaskList(
                      task: _titleController.text,
                      description: _detailController.text,
                      isCompleted: false,
                    );
                    globalTasks.add(newTask);
                    _titleController.text='';
                    _detailController.text='';
                    setState(() {
                      
                    });
                    
                }
                },
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