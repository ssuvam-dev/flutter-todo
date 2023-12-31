import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/components/app_bar.dart';
import 'package:todo/controller/taskcontroller.dart';
import 'package:todo/models/tasklist.dart';
import 'package:todo/models/tasks.dart';
import 'package:todo/utils/colors.dart';
import 'package:get/get.dart';

class CreateTask extends StatefulWidget {
   CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _detailController = TextEditingController();
    final TextEditingController _dateController =TextEditingController();
    String priority="High";
  TaskController _controller = Get.put(TaskController());
    void _showDatePicker()
    {
      showDatePicker(
        context: context, 
        initialDate: DateTime.now(), 
        firstDate: DateTime(2000), 
        
        lastDate: DateTime(2025))
        .then((value){
          setState(() {
              
              _dateController.text = DateFormat('yyyy-MM-dd').format(value!).toString();
          });
        });

    }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: MyAppBar(apptitle: 'Add Task',showDeleteButton: false,isFixedTitle: true,),
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
            SizedBox(
              height: 20.0,
            ),
           DropdownButton<String>(
            isExpanded: true,
            style: TextStyle(
              color: themeColor,
              fontSize: 15.0
            ),
            value: priority,
              items: <String>['High', 'Medium', 'Low'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  priority = value.toString();
                });
              },
),
SizedBox(
              height: 20.0,
            ),
     TextFormField(
              controller: _dateController,
              onTap: _showDatePicker,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.calendar_month),
                suffixIconColor: themeColor,
                hintText: "Choose Date",
                contentPadding: EdgeInsets.fromLTRB(0,10,0,0),
                focusedBorder: UnderlineInputBorder()
              ),
            
              validator: (value){
                if (value == null || value.isEmpty) {
                    return 'Choose a specific date';
                  }
                return null;
              },
            ),

            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Remainder",
                        style: TextStyle(
                          fontSize: 16.0
                        ),
                      ),
                      Container(
                    margin: EdgeInsets.only(left: 1.0,bottom: 1.0),
                    padding: EdgeInsets.only(left: 10.0,right: 10.0,top:1.0),
                     decoration: BoxDecoration(
                color: Colors.amber,
                boxShadow: const [
                  BoxShadow(
                  color: Color.fromRGBO(138, 138, 141, 0.898), 
                  blurRadius: 1.0,
                  offset: Offset(1, 1)),
                ],
                borderRadius: BorderRadius.circular(9),
          ),
                      child: Text("Pro"),
                  ),
                    ],
                  ),
                  
                  CupertinoSwitch(
                    value: false, 
                     onChanged:(value) {
                      //  Get.defaultDialog(
                      //   title: "Oops!",
                      //   titlePadding: EdgeInsets.only(top: 10.0),
                      //   content: Text("Only for Pro users")
                      //  );

                      Get.snackbar(
                        "Sorry", 
                      "You are not subscribed user",
                      snackPosition: SnackPosition.BOTTOM
                      );
                     }
                  ),
                ],
              ),
            ),
          
            GetBuilder<TaskController>(
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.only(top:30.0),
                  child: ElevatedButton(
                    onPressed: (){
                          if (_formKey.currentState?.validate() ?? false) {
                        TaskList newTask = TaskList(
                          task: _titleController.text,
                          description: _detailController.text,
                          isCompleted: false,
                          priority: priority,
                          date: _dateController.text
                        );
                        _controller.addNewTask(newTask);
                         Get.snackbar(
                          _titleController.text,
                          "Task Added Successfully"
                          );
                        _titleController.text='';
                        _detailController.text='';
                        _dateController.text='';
                        priority="High";
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
                );
              }
            )
          ],
        ),
    ),
  );
  }
}