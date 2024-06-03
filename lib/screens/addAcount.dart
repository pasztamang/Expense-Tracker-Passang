import 'package:athang_expense_tracker/data/model/addAccountRepo.dart';
import 'package:flutter/material.dart';
import 'package:athang_expense_tracker/data/model/account/account_modle.dart';

class AccountCatAdd extends StatefulWidget {
  const AccountCatAdd({Key? key}) : super(key: key);

  @override
  _AccountCatAddState createState() => _AccountCatAddState();
}

class _AccountCatAddState extends State<AccountCatAdd> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _openingBalanceController = TextEditingController();
  String? _selectedAccountType;

  Future<void> _addAccount() async {
    final String title = _titleController.text;
    final String? acctype = _selectedAccountType;
    final num openingBalance = num.tryParse(_openingBalanceController.text) ?? 0;
    

    if (title.isNotEmpty && openingBalance > 0) {
      final AccountModel account = AccountModel(
        id:0,
        title: title,
        img: "",
        openingBalance: openingBalance,    
      );
      try {
        await AccountService().addAccounts(account);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Account added successfully!')),
        );
        _titleController.clear();
        _openingBalanceController.clear();
        setState(() {
          _selectedAccountType = null;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add account. Please try again later.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter all details correctly')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    final List<String> accountTypes = [
      'Saving',
      'Recurring',
      'Loan',
    ];
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Account"),
          
        ),
       
        body: Container(
          margin: EdgeInsets.only(top: 8),
          child: Column(
            children: [
              Container(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2021/11/05/12/07/dollars-6771227_1280.jpg"),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                height: 50,
                margin: EdgeInsets.only(bottom: 16, left: 18, right: 18, top: 24),
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Account Name',
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                height: 50,
                margin: EdgeInsets.only(bottom: 16, left: 18, right: 18, top: 24),
                child: DropdownButtonFormField<String>(
                  value: _selectedAccountType,
                  items: accountTypes.map((String accountType) {
                    return DropdownMenuItem<String>(
                      value: accountType,
                      child: Text(accountType),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedAccountType = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Account Type',
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                height: 50,
                margin: EdgeInsets.only(bottom: 16, left: 18, right: 18),
                child: TextField(
                  controller: _openingBalanceController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Opening Balance',
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(18),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _addAccount,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black
                    ),
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
