
import 'dart:async';
import 'dart:convert';

import 'package:athang_expense_tracker/plugins/http.dart';
import 'package:athang_expense_tracker/widget/common/recentTransctionCard.dart';
import 'package:flutter/material.dart';

class TransctionModel{
  num id;
  String title;
  String updatedAt;
  String note;
  num amount;
  String type;

  TransctionModel({
    this.id=1,
    this.updatedAt="",
    this.title="",
    this.note="",
    this.amount=0,
    this.type="EXPENSE",
});
}

class recentTransctionList extends StatefulWidget {
  const recentTransctionList({super.key});

  @override
  State<recentTransctionList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<recentTransctionList> {
  List<TransctionModel> transctions=[];
  @override
  void initState(){
    loadTransctionData();
  }
  Future<void>loadTransctionData()async{
    final res=await GetRequest('transaction/me');
    print(jsonDecode(res.body)['data']);
    List<TransctionModel>temp=[];
    for(final data in jsonDecode(res.body)['data']){
      temp.add(TransctionModel(
        id:data['id'],
        updatedAt: data['updatedAt'],
        title: data['title'],
        note:data['note'],
        amount: data['amount'],
        type: data['type'],
      ));
    }
    setState(() {
      transctions=temp;
    });
  }

  Widget build(BuildContext context) {
    return Container(
      
         padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Recent Transction",style:TextStyle(fontWeight: FontWeight.bold)),
              Container(
                
                  child: Column(
                    children: [
                     ...transctions.map((v)=> transctionCard(
                      v.id,v.updatedAt, v.title, v.note, v. amount,
                     )).toList(),
                     
                    ],
                  ),
                )
              
              ],
          ), 
             
      );
    
  }
}