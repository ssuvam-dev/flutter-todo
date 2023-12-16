import 'package:flutter/material.dart';

class EmptyChartState extends StatelessWidget {
  const EmptyChartState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                  BoxShadow(color: Color.fromRGBO(138, 138, 141, 0.898), blurRadius: 4, offset: Offset(4, 4)),
                    ],
                    borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Center(
                child: Text(
              "Not Enough Data to show chart",
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xFFff595e),
                fontWeight: FontWeight.w600
              ),
            ),
              ),
    );
  }
}