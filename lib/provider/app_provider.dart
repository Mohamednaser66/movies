import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/routes_manger.dart';
import 'package:movie/dialog/dialog.dart';

import '../apis_service/apis_service.dart';
import '../authentication/sign_up/data/user_regester_Data.dart';
import '../authentication/sign_up/data/user_regester_request.dart';

class AppProvider extends ChangeNotifier {
  bool isSecure = true;
  bool confirmPassword = true;
  bool isLoading = false;
  String? dialogMessage;

  void clickConfirmPassword() {
    confirmPassword = !confirmPassword;
    notifyListeners();
  }

  void clickPassword() {
    isSecure = !isSecure;
    notifyListeners();
  }

  void loadingData(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void signUp(UserRegesterRequest request, BuildContext context) async {
    Dialogs.showLoadingDialog(context, 'Loading');
    var result = await ApisService.regesterUser(request);
    Dialogs.hideDialog(context);
    result.fold((success) {

      dialogMessage = success.message;
      Dialogs.showMessageDialog(context, message: dialogMessage??'',negTitle: 'ok',negAction: () => Navigator.pushNamed(context, RoutesManger.signIn),);
      notifyListeners();
    }, (errorMessage) {
      dialogMessage = errorMessage;
      Dialogs.showMessageDialog(context, message: dialogMessage??'',negTitle: 'try again',negAction: () {});
      notifyListeners();
    });
  }
}
