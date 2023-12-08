import 'package:flutter/material.dart';
import 'package:todo/components/app_bar.dart';
import 'package:todo/utils/colors.dart';

class EditTodo extends StatelessWidget {
   EditTodo({
    super.key,
    required this.taskname,
    this.taskdescription ="",
   });
final String taskname,taskdescription;
      final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(apptitle: "Edit Task"),
      body: EditForm(context),
    );
  }

  Padding EditForm(context) {
    return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue:this.taskname,
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
            initialValue: this.taskdescription,
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

            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: ()=>{},
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
    ),
  );
  }
}