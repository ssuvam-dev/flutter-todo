import 'package:flutter/material.dart';
import 'package:todo/components/app_bar.dart';
import 'package:todo/utils/colors.dart';

class CompletedTask extends StatefulWidget {
  const CompletedTask({super.key});

  @override
  State<CompletedTask> createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(apptitle: "Completed Task",),
        body: Container(
          color: bgColor,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Column(
              children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(128,129,143,0.9),
                          blurRadius: 3,
                          offset: Offset(0,4)
                        )
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:const Padding(
                      padding: EdgeInsets.all(20),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Heading inside completed',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: themeColor,
                                    fontWeight: FontWeight.w600,
                                  ),),
                                  Padding(
                                    padding: EdgeInsets.only(top: 4.0),
                                    child: Text('Completed SubHeading',
                                      style: TextStyle(
                                        fontSize:15
                                      ),
                                    )
                                    
                                    )
                                ],
                            ),
                          ),
                    
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: iconColor,
                                  ),
                                              
                                Icon(
                                  Icons.delete_forever,
                                  color: iconColor,
                                ),
                                              
                                Icon(
                                  Icons.check_circle_outline,
                                  color: iconColor,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  )
              ],
            ),
          ),
        ),
  

    
    );
  }
}
