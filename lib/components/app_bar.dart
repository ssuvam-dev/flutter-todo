import 'package:flutter/material.dart';
import 'package:todo/utils/colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String apptitle;
  final int now = DateTime.now().day;

  MyAppBar({
    super.key, 
    required this.apptitle,
  }
);

@override
Size get preferredSize =>const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        backgroundColor:themeColor,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              apptitle,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700
              ),
            ),

            Stack(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 30.0,
                  ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8,12,10,10),
                  child: Text(
                    now.toString(),
                  style: TextStyle(
                    fontSize: 12
                  ),
                ),
                  ),
               
              ],
            )
          ],
        ),
        
    );
  }
}