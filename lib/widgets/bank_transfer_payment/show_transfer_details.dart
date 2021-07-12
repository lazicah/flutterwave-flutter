import 'package:flutter/material.dart';
import 'package:flutterwave/models/responses/bank_transfer_response/bank_transfer_response.dart';

class AccountDetails extends StatelessWidget {
  final Function _onTransferMade;
  final BankTransferResponse _bankTransferResponse;

  AccountDetails(this._bankTransferResponse, this._onTransferMade);

  @override
  Widget build(BuildContext context) {
    final authorization = this._bankTransferResponse.meta!.authorization;
    final String note = authorization!.transferNote;

    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            note != null && note.isNotEmpty && note != "N/A"
                ? note
                : "Please make a bank transfer to this account",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          SizedBox(height: 70),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: Text('Amount'),
                trailing: Text(
                  authorization.transferAmount.toString(),
                ),
              ),
              ListTile(
                title: Text(
                  "Account Number",
                ),
                trailing: Text(
                  authorization.transferAccount,
                ),
              ),
              ListTile(
                title: Text(
                  "Bank Name",
                ),
                trailing: Text(
                  authorization.transferBank,
                ),
              ),
              ListTile(
                title: Text(
                  "Beneficiary Name",
                ),
                trailing: Text(
                  this._extractNameFromNote(authorization.transferNote),
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(5, 10, 20, 5),
                child: ElevatedButton(
                  onPressed: _handleTransferMade,
                  child: Text(
                    "I have made the transfer",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _handleTransferMade() {
    this._onTransferMade();
  }

  String _extractNameFromNote(final String note) {
    if (note == null || note.isEmpty || note == "N/A") return "";
    final list = note.split(" ");
    final lastName = list.elementAt(list.length - 1);
    final firstName = list.elementAt(list.length - 2);
    return "$firstName $lastName";
  }
}
