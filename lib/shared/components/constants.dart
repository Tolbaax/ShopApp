import '../../modules/login/login_screen.dart';
import '../network/local/cache_helper.dart';
import 'components.dart';

void signOut(context)
{
  CacheHelper.removeData(key: 'token').then((value) {
    if(value)
    {
      navigateAndRemoveUntil(context, LoginScreen());
    }
  });
}

void printFullText(String text)
{
  final pattern = RegExp('.{1,800}'); //800 is the size of each chunk
  pattern.allMatches(text).forEach((element) => print(element.group(0)));
}

String token = '';