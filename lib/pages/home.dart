import 'package:flutter/material.dart';
import 'package:github_browse/providers/users_providers.dart';
import 'package:github_browse/search/searchDelegate.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController control = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userProvider = UsersProvider();
    String search = '';

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ))
          ],
          title: const Text(
            'Lista de Usuarios',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const Divider(
                color: Colors.black54,
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    // SizedBox(
                    //   height: size.height * 0.06,
                    //   width: size.width * 0.65,
                    //   child: Center(
                    //     child: TextFormField(
                    //       controller: control,
                    //       cursorHeight: 24,
                    //       textAlignVertical: TextAlignVertical.center,
                    //       decoration: InputDecoration(
                    //         prefixIcon: const Icon(Icons.search),
                    //         hintText: 'Buscar',
                    //         enabledBorder: OutlineInputBorder(
                    //             borderSide: const BorderSide(
                    //                 width: 2, color: Color(0xffced0d8)),
                    //             borderRadius: BorderRadius.circular(8)),
                    //         focusedBorder: OutlineInputBorder(
                    //             borderSide: const BorderSide(
                    //                 width: 2, color: Color(0xffced0d8)),
                    //             borderRadius: BorderRadius.circular(8)),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     //-----------
                    //     search = control.text;
                    //     setState(() {});
                    //   },
                    //   child: Align(
                    //     child: Container(
                    //       height: size.height * 0.06,
                    //       width: size.width * 0.27,
                    //       decoration: BoxDecoration(
                    //         color: Colors.transparent,
                    //         border: Border.all(
                    //             width: 2, color: const Color(0xffced0d8)),
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),
                    //       child: const Center(
                    //         child: Text(
                    //           'Buscar',
                    //           style: TextStyle(color: Colors.black),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
