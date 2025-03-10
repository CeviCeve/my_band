import 'package:flutter/material.dart';

class SearchElement extends StatefulWidget {
  final TextEditingController controller;

  const SearchElement({super.key, required this.controller});

  @override
  _SearchElementState createState() => _SearchElementState();
}

class _SearchElementState extends State<SearchElement> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(0, 204, 220, 57),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromARGB(255, 158, 158, 184)),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: widget.controller,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Найти',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 158, 158, 184),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Color.fromARGB(255, 158, 158, 184),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
