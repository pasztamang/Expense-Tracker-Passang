import 'package:athang_expense_tracker/widget/common/recentTransctionList.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class transctionCard extends StatelessWidget {
  num id;
  String updatedAt;
  String title;
  String note;
  num amount;

  transctionCard(this.id, this.updatedAt,  this.title, this.note, this.amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(right: 16),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          height: 30,
          width: 50,
          //margin: const EdgeInsets.only(bottom: 16),
          child: Image.network(
            "https://static.vecteezy.com/system/resources/previews/006/732/119/non_2x/account-icon-sign-symbol-logo-design-free-vector.jpg",
            fit: BoxFit.cover,
          ),
        ),
        title: Text(title,style: TextStyle(fontSize: 14)),
        subtitle: Text(DateFormat.yMMMd().format(DateTime.parse(updatedAt)),
        style: TextStyle(fontSize: 10),),
        trailing: Text("${amount}", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
