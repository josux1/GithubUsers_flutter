import 'package:flutter/material.dart';

class SearchGithubBar extends StatelessWidget {
  const SearchGithubBar({
    super.key,
    required this.controller,
    required this.onSearch,
    required this.onChanged,
    required this.onClear,
  });
  final TextEditingController controller;
  final void Function()? onSearch;
  final void Function()? onChanged;
  final void Function()? onClear;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textFieldStyle = OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Color(0xffced0d8)),
        borderRadius: BorderRadius.circular(20));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: size.height * 0.06,
          width: size.width * 0.65,
          child: Center(
            child: TextFormField(
              controller: controller,
              cursorHeight: 24,
              onChanged: (value) {
                onChanged!();
                // setState(() {});
              },
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: controller.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          onClear!();
                          // controller.clear();
                          // usersList.clear();
                          // setState(() {
                          //   isLoading = false;
                          // });
                        },
                        icon: const Icon(Icons.clear))
                    : null,
                hintText: 'Search',
                enabledBorder: textFieldStyle,
                focusedBorder: textFieldStyle,
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.06,
          child: ElevatedButton(
              onPressed: () {
                onSearch!();
                //  _searchUser(userProvider);
              },
              child: const Text('Search')),
        ),
      ],
    );
  }
}
