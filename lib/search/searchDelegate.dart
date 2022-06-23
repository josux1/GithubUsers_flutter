import 'package:flutter/material.dart';
import 'package:github_browse/models/user.dart';
import 'package:github_browse/providers/users_providers.dart';

class DataSearch extends SearchDelegate {
  final userprovider = UsersProvider();
  String select = '';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 120,
        color: Colors.amber,
        child: Text(select),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
        future: userprovider.getUsers(query),
        builder: (context, AsyncSnapshot<List<Item>> snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data;

            return ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: users!.map((user) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatarUrl),
                      radius: 15,
                    ),
                    title: Text(user.login),
                    subtitle: Text(user.url),
                  );
                }).toList());
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
