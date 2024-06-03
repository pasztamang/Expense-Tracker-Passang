import 'package:athang_expense_tracker/domain/landing/summaryRepo.dart';
import 'package:athang_expense_tracker/domain/landing/summary_model.dart';
import 'package:athang_expense_tracker/widget/common/currentBalance.dart';
import 'package:athang_expense_tracker/widget/common/recentTransctionList.dart';
import 'package:flutter/material.dart';

class SummaryHome extends StatefulWidget {
  @override
  State<SummaryHome> createState() => _SummaryHomeState();
}
class _SummaryHomeState extends State<SummaryHome> {
  SummaryModel summary = SummaryModel();

  @override
  void initState() {
    loadData();
  }

  Future<void> loadData() async {
    SummaryModel res = await loadSummaryData();
    setState(() {
      summary = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    border: Border(
                      top: BorderSide(
                        color: Colors.white,
                        width: 2.0, // Adjust the width as needed
                      ),
                    ),
                  ),
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Text(
                              "Current Balance",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              "Nu. ${summary.openingBalance}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Text(
                              "Target Budget",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              "Nu. 0",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  child: Container(
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
                    margin: EdgeInsets.symmetric(horizontal: 32, vertical: 70),
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Text(
                                "Total Income",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 12),
                              ),
                              Text(
                                "Nu. ${summary.income}",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Text(
                                "Total Expense",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 12),
                              ),
                              Text(
                                "Nu. ${summary.expenses}",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          currentBalance(), // Ensure this widget is imported and defined
          recentTransctionList() // Ensure this widget is imported and defined
        ],
      ),
    );
  }
}
