import 'package:demo_rest_api/use_getx/services/remote_services.dart';
import 'package:get/state_manager.dart';

import '../../models/user_model.dart';

class UserController extends GetxController {
  var userList = <User>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  void fetchUser() async {
    try {
      isLoading(true);
      var users = await RemoteServices.fetchUser();
      userList.value = users;
    } finally {
      isLoading(false);
    }
  }
}