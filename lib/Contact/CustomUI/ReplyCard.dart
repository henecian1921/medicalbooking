import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width-45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          //color: Color(0xffdcf8c6),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 60, top: 5, bottom: 20),
                child: Text(
                  "Hello",
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child:
                    Text(
                      "20:05",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600]
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
