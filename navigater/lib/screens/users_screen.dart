import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../services/api.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  bool loading = false;
  int currentPage = 1; //hng. sayfadayım?
  int totalPages = 1; //kaç sayfam var?
  List<dynamic> users = [
    //kullanıcıları buraya yerlestırcz
  ];

  showError() {
    showCupertinoDialog(
      context: context,
      barrierDismissible:
          true, //buton dışında herhangi bi yere tıklanınca kapansın mı kapanmasın mı?
      builder: (context) => CupertinoAlertDialog(
        title: Row(
          children: [
            Icon(Icons.warning),
            Gap(12.0),
            Text("Error"),
          ],
        ),
        content: Text("Check your ınternett Connetion and try again"),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Ok"),
          ),
        ],
      ),
    );
  }

  loadUsers() async {
    setState(() {
      loading = true;
    });

    API api = API();
    var result = await api.getUsers();

    if (result is Exception) {
      showError();
      setState(() {
        loading = false;
      });
    } else {
      //dogru calısırsa
      setState(() {
        currentPage = result["page"];
        totalPages = result["total_pages"];
        users = result["data"];
        loading = false;
      });
    }
  }

  List<Widget> drawUsers() {
    List<Widget> r = [];

    for (var element in users) {
      r.add(
        UserTile(element: element),
      );
    }
  
  return r;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (loading) LinearProgressIndicator(),
              ...drawUsers(),
              Container(
                margin:EdgeInsets.all(12.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(Icons.arrow_left_sharp),
                    ),
                    Text("$currentPage/$totalPages"),
                    InkWell(
                      onTap: () {},
                      child: Icon(Icons.arrow_right_sharp),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.element,
  });

  final element;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(element["avatar"]),
            radius: 42,
          ),
          Gap(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${element["first_name"]} ${element["last_name"]}"),
              Text(element["email"]),
            ],
          ),
        ],
      ),
    );
  }
}
