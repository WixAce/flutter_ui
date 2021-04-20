import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ConfirmDialog extends StatefulWidget {
  String title, content, agreeText, cancelText;
  Function action;
  Function cancel;
  Function onLinkTap;
  ConfirmDialog(this.title, this.content, this.action, this.cancel,
      {this.onLinkTap, Key key, this.agreeText = "", this.cancelText = ""})
      : super(key: key);

  @override
  _ConfirmDialogState createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    if (widget.agreeText.trim().isEmpty) widget.agreeText = "同意";
    if (widget.cancelText.trim().isEmpty) widget.cancelText = "取消";
    return SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        contentPadding: EdgeInsets.all(20),
        children: [
          Html(
            data: widget.content,
            onLinkTap: (url) {
              widget.onLinkTap(url);
            },
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              /*RaisedButton(
                child: SizedBox(
                  width: 60.0,
                  child: Text(
                    widget.cancelText,
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w400,
                      height: 1.25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                color: const Color(0xff4e8cf6),
                onPressed: () => {widget.cancel.call()},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),*/
              ElevatedButton(
                child: SizedBox(
                  width: 60.0,
                  child: Text(
                    widget.agreeText,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w400,
                      height: 1.25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: () {
                  widget.action.call();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orangeAccent),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ]);
  }
}
