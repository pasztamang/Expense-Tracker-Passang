
import 'dart:convert';

import 'package:athang_expense_tracker/data/model/account/account_modle.dart';
import 'package:athang_expense_tracker/data/model/account/account_repo.dart';

import 'package:athang_expense_tracker/plugins/http.dart';
import 'package:athang_expense_tracker/widget/common/accountCard.dart';
import 'package:flutter/material.dart';

class currentBalance extends StatefulWidget {
  const currentBalance({super.key});
  @override
  State<currentBalance> createState() => _MyWidgetState();
}
class _MyWidgetState extends State<currentBalance> {
  List<AccountModel> LoadAccount=[];
  @override
  void initState(){
    loadMyAccounts();
  }

Future<void>loadMyAccounts()async{
    final res=await AccountRepo().loadAccounts();
    setState(() {
      LoadAccount=res;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
         padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Current Balance",style:TextStyle(fontWeight: FontWeight.bold)),
              Container(
                 margin: EdgeInsets.only(top: 12),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...LoadAccount.map((v)=> accountCard(
                      v.id,v.title, v.img, v.openingBalance,
                     )).toList(),
                     
                      //accountCard(),
                      // accountCard(),
                      // accountCard(),
                      // accountCard(),
                    ],
                  ),
                )
                
              ),
              
              ],
          ), 
             
      );
    
  }
}