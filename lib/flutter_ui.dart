library flutter_ui;

import 'package:flutter_ui/save_utils.dart';

const String _isFirstKey = "isFirst";
bool isFirst = false;

Future<bool> checkIsFirst() async {
  var result = await SaveUtils.getString(_isFirstKey) ?? "true";
  isFirst = result == "true";
  return isFirst;
}

Future<bool> agreePrivacy() async {
  await SaveUtils.setString(_isFirstKey, "false");
  isFirst = false;
  return isFirst;
}

Future<bool> resetIsFirst() async {
  await SaveUtils.setString(_isFirstKey, "true");
  isFirst = true;
  return isFirst;
}
