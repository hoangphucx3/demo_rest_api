
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import 'data_sources/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<User>>(
          future: ApiServices().fetchUser(),
          builder: (context, snapshot) {
            if((snapshot.hasError) || (!snapshot.hasData))
              return Container(
                child: Center(child: CircularProgressIndicator()),
              );
            List<User>? userList = snapshot.data;
            return ListView.builder(
                itemCount: userList?.length,
                itemBuilder: (BuildContext context, int index) {
                  return UserCard(user: userList![index]);
                }
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
      margin: EdgeInsets.only(top: 20.0),
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
          Column(
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
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

