import 'package:employinformationapp/screen/modelfromjason.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final textstyle = const TextStyle(fontSize: 17);
  final User? user;
  const Details({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Details",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.brown),
                  shape: BoxShape.circle,
                ),
                child: Image.network(user!.image)),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.brown,
              ),
              child: const Center(
                child: Text(
                  "Personal Information",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textinfo("Name"),
                      textinfo("Adress"),
                      textinfo("City"),
                      textinfo("State"),
                      textinfo("Email"),
                      textinfo("Gender"),
                      textinfo("Age"),
                      textinfo("Blood Group"),
                      textinfo("Height"),
                      textinfo("Weight")
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(text: ":- ${user!.firstName}"),
                          TextSpan(text: ":-${user!.lastName}")
                        ]),
                        style: textstyle,
                      ),
                      Text(
                        ":- ${user!.address}",
                        style: textstyle,
                      ),
                      Text(":- ${user!.address.city}", style: textstyle),
                      Text(":- ${user!.address.state}", style: textstyle),
                      Text(":- ${user!.email}", style: textstyle),
                      Text(":- ${user!.gender}", style: textstyle),
                      Text(":- ${user!.age}", style: textstyle),
                      Text(":- ${user!.bloodGroup}", style: textstyle),
                      Text(":- ${user!.height}", style: textstyle),
                      Text(":- ${user!.weight}", style: textstyle)
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              width: double.infinity,
              child: Text(
                "Designation Information",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Column(
                    children: [],
                  ),
                  Column(
                    children: [],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Text textinfo(name) => Text(
        name,
        style: const TextStyle(fontSize: 16),
      );
}
