import 'package:flutter/material.dart';
import 'package:github_browse/models/user.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key, required this.usersList});

  final List<Item> usersList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.75,
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: usersList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final user = usersList[index];

            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.avatarUrl),
                radius: 15,
              ),
              title: Text(user.login),
              subtitle: Text(user.url),
            );
          },
        ),
      ),
    );
  }
}
