import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MSProgressHUDType {
  /// 成功
  success,

  /// 失败
  error,

  /// 加载中
  loading,
}

class MSProgressHUD {
  static showSuccess(BuildContext context, {String message}) async {
    if (message != null) {
      _show(MSProgressHUDType.success, context, message: message);
    } else {
      _show(MSProgressHUDType.success, context);
    }
    Future.delayed(Duration(seconds: 2), () {
      dismiss(context);
    });
  }

  static showError(BuildContext context, {String message}) {
    dismiss(context);
    if (message != null) {
      _show(MSProgressHUDType.error, context, message: message);
    } else {
      _show(MSProgressHUDType.error, context);
    }
    Future.delayed(Duration(seconds: 2), () {
      dismiss(context);
    });
  }

  static showLoading(BuildContext context, {String message}) {
    if (message != null) {
      _show(MSProgressHUDType.loading, context, message: message);
    } else {
      _show(MSProgressHUDType.loading, context);
    }
  }

  static _show(MSProgressHUDType type, BuildContext context, {String message}) {
    Navigator.push(
        context,
        new ProgressHUD(
            barrierLabel:
                MaterialLocalizations.of(context).modalBarrierDismissLabel,
            message: message == null ? "" : message,
            progressType: type));
  }

  static dismiss(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}

class ProgressHUD<T> extends PopupRoute<T> {
  String message;
  MSProgressHUDType progressType;

  ProgressHUD({this.barrierLabel, this.message, this.progressType});

  @override
  Color get barrierColor => null;

  @override
  Duration get transitionDuration => Duration(seconds: 1);

  @override
  bool get barrierDismissible => false;

  @override
  String barrierLabel;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Colors.black87),
            ),
            getProgressHUDWidget()
          ],
        ),
      ),
    );
  }

  Widget getProgressHUDWidget() {
    double iconSize = 50;
    Widget widget;
    switch (this.progressType) {
      case MSProgressHUDType.success:
        widget = Icon(Icons.check, color: Colors.white, size: iconSize);
        break;
      case MSProgressHUDType.error:
        widget = Icon(Icons.close, color: Colors.white, size: iconSize);
        break;
      case MSProgressHUDType.loading:
        widget = CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        );
        break;
    }

    if (this.message == "") {
      return widget;
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          widget,
          Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Text(this.message,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none)))
        ],
      );
    }
  }
}
