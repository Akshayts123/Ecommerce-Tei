import 'package:e_commerce/views/widgets/heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class buildUserInfo extends StatelessWidget {
  const buildUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Row(
          children: [
            Heading(heading: 'Sangam Shakya'),
            SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "Follow",
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
            ),
          ],
        ),
        subtitle: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Dharan-3, Nepal",
                    style:context.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Male",
                    style:context.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(
                    width: 5 ,
                  ),
                  Text(
                    "Student",
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


