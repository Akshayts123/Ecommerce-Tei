import 'package:flutter/material.dart';
import 'package:get/get.dart';


class buildUserActivity extends StatelessWidget {
  const buildUserActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // * post, followers, following, articles
        Expanded(
          child: Container(
            child: ListTile(
              title: Center(
                  child: Text(
                    "3",
                    style:context.textTheme.titleMedium,
                  )),
              subtitle: Center(child: Text("Posts",style:context.textTheme.titleMedium,)),
            ),
          ),
        ),

        Expanded(
          child: Container(
            child: ListTile(
              title: Center(
                  child: Text(
                    "12",
                    style:context.textTheme.titleMedium,
                  )),
              subtitle: Center(child: Text("Followers",style:context.textTheme.titleMedium,)),
            ),
          ),
        ),

        Expanded(
          child: Container(
            child: ListTile(
              title: Center(
                  child: Text(
                    "4",
                    style:context.textTheme.titleMedium,
                  )),
              subtitle: Center(child: Text("Following",style:context.textTheme.titleMedium,)),
            ),
          ),
        ),

        Expanded(
          child: Container(
            child: ListTile(
              title: Center(
                  child: Text(
                    "3",
                    style:context.textTheme.titleMedium,
                  )),
              subtitle: Center(child: Text("Articles",style:context.textTheme.titleMedium,)),
            ),
          ),
        ),
      ],
    );
  }
}

