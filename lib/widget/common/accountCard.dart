
import 'package:flutter/material.dart';

class accountCard extends StatelessWidget {
  num id;
  String title;
  String img;
  num openingBalance;
  accountCard(this.id,this.title,this.img,this.openingBalance);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.black54,
            width: 1.0,
          ),
          left: BorderSide(
            color: Colors.black54,
            width: 1.0,
          ),
          right: BorderSide(
            color: Colors.black54,
            width: 3.0,
          ),
          bottom: BorderSide(
            color: Colors.black54,
            width: 3.0,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 50,
              width: 200,
              margin: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${title}',
                    style: TextStyle(fontSize: 16),
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(img.toString()),
                  )
                  //Icon(Icons.face),
                ],
              )),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nu.${openingBalance}', 
                style: TextStyle(fontSize: 18)),
                Text('Nu.this month',
                    style: TextStyle(fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
