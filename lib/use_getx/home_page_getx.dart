import 'package:demo_rest_api/use_getx/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class HomePageGetX extends StatelessWidget {
  const HomePageGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController controller = Get.put(UserController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () {
            if (controller.isLoading.value)
              return Center(child: CircularProgressIndicator());
            else
              return ListView.builder(
                itemCount: controller.userList.length,
                itemBuilder: (context, index) {
                  return UserCard(user: controller.userList[index]);
                },
              );
          },
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFF0F1F5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: 80.0,
            width: 80.0,
            margin: EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.picture.picUrl),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  user.name.firstName + " " + user.name.lastName,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(
                    user.email,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 3.0),
                  child: Text(
                    user.phone,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
