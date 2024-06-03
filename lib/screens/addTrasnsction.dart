import 'package:athang_expense_tracker/screens/addAcount.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:athang_expense_tracker/data/model/account/account_modle.dart';
import 'package:athang_expense_tracker/data/model/account/account_repo.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  List<AccountModel> _accountList = []; // Variable to hold the list of accounts

  @override
  void initState() {
    super.initState();
    loadMyAccounts();
  }

  Future<void> loadMyAccounts() async {
    final accounts = await AccountRepo().loadAccounts();
    setState(() {
      _accountList = accounts; // Update the account list
    });
  }

  DateTime? selectedDate;

  String selectedAccountType = 'Account'; // Default value

  final List<String> accountTypes = ['Savings', 'Checking', 'Credit'];

  final List<String> expenseTypes = ['Expense 1', 'Expense 2', 'Expense 3'];

  //String selectedAccountType = 'Account'; // Default value
  String selectedExpenseType = 'Expense'; // Default value

  // // Variable to store the picked image
  // File? _image;

  // Function to pick an image
  Future<void> _confirm() async {}

  // Function to pick a date
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(14),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Your other widgets here
          Container(
            width: double.infinity,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Enter your statement',
                filled: true,
                fillColor: Color.fromARGB(255, 218, 197, 197),
              ),
            ),
          ),
          SizedBox(height: 20), // Spacer for better visual separation
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _pickDate(context),
              child: Text(
                selectedDate == null
                    ? 'Select Date?'
                    : 'Selected Date: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}',
              ),
            ),
          ),
          SizedBox(height: 20), // Spacer for better visual separation
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey), // Border color
              color: Colors.white, // Dropdown background color
            ),
            child: DropdownButton<String>(
              hint: Text('Expense'), // Set default label
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedExpenseType = newValue;
                  });
                }
              },
              
              items: expenseTypes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(value),
                  ),
                );
              }).toList(),
              //icon: Icon(Icons.arrow_drop_down),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Amount in Nu.',
                filled: true,
                fillColor: const Color.fromARGB(255, 223, 208, 208),
              ),
            ),
          ),
          SizedBox(height: 20), // Spacer for better visual separation
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _confirm,
              child: Text('Confirm'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.redAccent),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the second screen when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountCatAdd()),
                  );
                },
                child: Text('Add Account'),
              )),
        ],
      ),
    );
  }
}
