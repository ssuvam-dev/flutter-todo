import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
   ButtonComponent(
    {
      super.key,
      required this.name,
      bool this.colorButton=false,
    }
    );
    bool colorButton;
    String name;
  @override
  Widget build(BuildContext context) {
    return Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    
                    decoration: BoxDecoration(
                    color: colorButton ? Color.fromRGBO(106, 99, 246, 1) : Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      border:Border.all(
                        color: Color.fromRGBO(106, 99, 246, 1)
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 20.0),
                      child: Center(
                        child: Text(name,style: TextStyle(
                           color: !colorButton ? Color.fromRGBO(106, 99, 246, 1) : Colors.white,
                          fontSize: 20.0,
                        ),),
                      ),
                    ),
            );
  }
}