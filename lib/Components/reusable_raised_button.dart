import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color btnColor;
  final Function onPress;
  final IconData iconData;

  ReusableButton(
      {this.text, this.textColor, this.btnColor, this.onPress, this.iconData});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPress,
      child: Row(
        children: [
          Icon(
            iconData,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              // fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
      color: btnColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      autofocus: true,
    );
  }
}
