import 'package:property_management_system/core/helper/http_helper.dart';

class AccountUtils {
  static String setImagePath(String path) {
    List<String> li = path.split('/');
    li.remove(li.first);
    String x = li.join('/');
    return HttpHelper.url + x;
  }
}
