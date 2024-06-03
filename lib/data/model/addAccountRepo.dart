import 'dart:convert';
import 'package:athang_expense_tracker/data/model/account/account_modle.dart';
import 'package:athang_expense_tracker/plugins/http.dart';

class AccountService {
  Future loadAccounts() async{
    final res = await GetRequest('account/me');
    print(jsonDecode(res.body));
    List<AccountModel> tempAccounts = [];
    for(final acc in jsonDecode(res.body)['data']){
      tempAccounts.add(AccountModel.fromJson(acc));
    }
    return tempAccounts;
  }

  Future<void> addAccounts(AccountModel account) async{
    final res = await PostRequest('account', {
      //"id":account.id,
      "title": account.title,
      "openingBalance": account.openingBalance,
      // Add other parameters as needed
    });
    // Handle response if needed
  }
}
