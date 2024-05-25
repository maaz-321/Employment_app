import 'package:employinformationapp/screen/datamodel.dart';
import 'package:employinformationapp/screen/modelfromjason.dart';
import 'package:employinformationapp/screen/secondpage.dart';
import 'package:flutter/material.dart';

class EmployDetails extends StatefulWidget {
  const EmployDetails({super.key});

  @override
  State<EmployDetails> createState() => _EmployDetailsState();
}

class _EmployDetailsState extends State<EmployDetails> {
  // ignore: non_constant_identifier_names
  List<User> Usermodel = [];
  bool isloading = false;

  myuserfunc() {
    isloading = true;
    fetch().then((value) {
      setState(() {
        isloading = false;
        Usermodel = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    myuserfunc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Employees Details",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: isloading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: const EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: Usermodel.length,
                  itemBuilder: (context, index) {
                    final users = Usermodel[index];
                    return Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details(user: users)));
                        },
                        child: Column(
                          children: [
                            Material(
                              elevation: 1,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.blue[100],
                                    backgroundImage: NetworkImage(users.image),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(TextSpan(
                                          children: [
                                            TextSpan(text: users.firstName),
                                            TextSpan(text: users.lastName),
                                          ],
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))),
                                      Text(users.company.department)
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
    );
  }
}
