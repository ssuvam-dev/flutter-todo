import 'package:flutter/material.dart';
import 'package:todo/components/app_bar.dart';
import 'package:todo/controller/taskcontroller.dart';
import 'package:todo/models/tasklist.dart';
import 'package:todo/utils/colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditTodo extends StatefulWidget {
   EditTodo({
    super.key,
    required this.task,
   });
   final TaskList task;
  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
      final _formKey = GlobalKey<FormState>();
      final TextEditingController _titleController = TextEditingController();
      final TextEditingController _detailController = TextEditingController();
      final TextEditingController _dateController =TextEditingController();
      TaskController _controller = Get.put(TaskController());
      late String _priority;
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
  void initState() {
    super.initState();
    _titleController.text = widget.task.task??'';
    _detailController.text = widget.task.description??'';
    _dateController.text = widget.task.date??'';
    _priority = widget.task.priority??"";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(apptitle: "Edit Task",showDeleteButton: false,isFixedTitle: true,),
      body: EditForm(context),
    );
  }

  Padding EditForm(context) {
    return Padding(
    padding: const EdgeInsets.all(20.0),
    child: GetBuilder<TaskController>(
      builder: (_) {
        return Form(
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
                  maxLines: 2,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                    return null;
                  },
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
                value: _priority,
                  items: <String>['High', 'Medium', 'Low'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _priority=value!;
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
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: (){
                            if (_formKey.currentState?.validate() ?? false){
                                
                                TaskList newTask = TaskList(
                                  task: _titleController.text,
                                  description: _detailController.text,
                                  isCompleted: false,
                                  priority: _priority,
                                  date: _dateController.text
                                );
                                _controller.updateTask(newTask,widget.task);
                                Get.snackbar(
                                  _titleController.text
                                  ,
                                  "Task Updated Successfully"
                                  );
                            }

                          },
                           style: ElevatedButton.styleFrom(
                          backgroundColor: themeColor,
                          
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          shadowColor: Colors.grey[400],
                          elevation: 4
                        ),
                          child: const Text('Update')
                        ),
                      ),
                
                       SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.pop(context); 
                          },
                           style: ElevatedButton.styleFrom(
                          backgroundColor: themeColor,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          shadowColor: Colors.grey[400],
                          elevation: 4
                        ),
                          child: const Text('Cancel')
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
        );
      }
    ),
  );
  }
}