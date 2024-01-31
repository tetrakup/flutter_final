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
  int totalPages = 5; //kaç sayfam var?
  List<dynamic> users = [
    //kullanıcıları buraya yerlestırcz
  ];

  //show error baslangic
  /*showError() {
    showCupertinoDialog(
      context:context,
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
  }*/ //showerror sonu
  showError(BuildContext context) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: Row(
          children: [
            Icon(Icons.warning),
            Gap(12.0),
            Text("Error"),
          ],
        ),
        content: Text("Check your internet connection and try again"),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Ok"),
          ),
        ],
      ),
    );
  }

  //----------------------------------------------------------------
 /* loadUsers({int page = 1}) async {
    if (currentPage < 1 || currentPage > totalPages) {
      //eğer 1den küçük ve total sayfa sayısından büyükse
      return;
    }
    setState(() {
      loading = true;
    });

    API api = API();
    var result = await api.getUsers(page: page);

    if (result is Exception) {
      showError(context as BuildContext);
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
  }*/
  loadUsers({int page = 1}) async {
  if (currentPage < 1 || currentPage > totalPages) {
    return;
  }
  setState(() {
    loading = true;
  });

  API api = API();
  var result = await api.getUsers(page: page);

  if (result is Exception) {
    showError(context as BuildContext); // Burada showError fonksiyonuna BuildContext parametresi geçiyoruz
    setState(() {
      loading = false;
    });
  } else {
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
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            // Burada başka bir sayfaya yönlendirme yapabilirsiniz
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UsersScreen()),
            );
          },
          child: Text('Click to return to Register'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (loading) LinearProgressIndicator(),
            if(!loading)...drawUsers(),
              Container(
                margin: EdgeInsets.all(12.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => loadUsers(page: currentPage - 1),
                      child: Icon(
                        Icons.arrow_left_sharp,
                        color: currentPage == 1
                            ? Colors.grey.shade300
                            : Colors.black,
                      ),
                    ),
                    Text("$currentPage/$totalPages"),
                    InkWell(
                      onTap: () => loadUsers(page: currentPage + 1),
                      child: Icon(
                        Icons.arrow_right_sharp,
                        color: currentPage == totalPages
                            ? Colors.grey.shade300
                            : Colors.black,
                      ),
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
