import 'package:flutter/material.dart';

class PayWithTransferButton extends StatelessWidget {
  final Function _payWithTransfer;

  PayWithTransferButton(this._payWithTransfer);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: this._hanldePayWithTransfer,
        child: Text(
          "PAY",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  void _hanldePayWithTransfer() {
    this._payWithTransfer();
  }
}
