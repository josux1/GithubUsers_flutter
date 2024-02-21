import 'package:flutter/material.dart';
import 'package:github_browse/models/user.dart';
import 'package:github_browse/repository/users_providers.dart';
import 'package:github_browse/search/search_delegate.dart';
import 'package:github_browse/widgets/search_bar.dart';
import 'package:github_browse/widgets/users_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController control = TextEditingController();
  List<Item> usersList = [];
  bool isLoading = false;

  @override
  void dispose() {
    control.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userProvider = UsersProvider();

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () =>
                    showSearch(context: context, delegate: DataSearch()),
                icon: const Icon(Icons.search, color: Colors.black))
          ],
          title: const Text('Github Users'),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              SearchGithubBar(
                controller: control,
                onSearch: () => _searchUser(userProvider),
                onChanged: () => setState(() {}),
                onClear: () => _onClear(),
              ),
              if (isLoading) const Center(child: LinearProgressIndicator()),
              if (!isLoading && usersList.isNotEmpty)
                UsersList(usersList: usersList),
              if (!isLoading && usersList.isEmpty)
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.3),
                  child: const Column(
                    children: [
                      Icon(Icons.person_search_rounded,
                          color: Colors.grey, size: 50),
                      Center(child: Text('Search some users pal ;)')),
                    ],
                  ),
                )
            ],
          ),
        ));
  }

  void _onClear() {
    control.clear();
    usersList.clear();
    setState(() => isLoading = false);
  }

  Future<void> _searchUser(UsersProvider userProvider) async {
    FocusScope.of(context).unfocus();
    if (control.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      usersList = await userProvider.getUsers(control.text);
      setState(() {
        isLoading = false;
      });
    } else {
      usersList.clear();
      setState(() {
        isLoading = false;
      });
    }
  }
}
