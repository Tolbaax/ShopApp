import '../../modules/login/login_screen.dart';
import '../network/local/cache_helper.dart';
import 'components.dart';

// save token when user log in and use it in all app not token in shared preferences
String? token;

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      navigateAndRemoveUntil(context, LoginScreen());
    }
  });
}
