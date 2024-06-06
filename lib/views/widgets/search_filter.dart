import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class buildSearchRow extends StatelessWidget {
  const buildSearchRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: context.theme.focusColor,
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.5, color: context.theme.selectedRowColor),
                  ),
                  hoverColor: context.theme.primaryColor,
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    gapPadding: 15,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  hintStyle: context.theme.textTheme.titleSmall,
                  hintText: "Search products",
                  fillColor: context.theme.splashColor),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: context.theme.splashColor,
                border: Border.all(
                    width: 0.5, color: context.theme.selectedRowColor)),
            child: _buildFilterBtn(),
          ),
        ],
      ),
    );
  }
}

IconButton _buildFilterBtn() {
  return IconButton(
    alignment: Alignment.center,
    icon: const Icon(CupertinoIcons.sort_down, size: 20),
    onPressed: () => print("Filter clicked"),
    tooltip: "Filter",
    iconSize: 40,
    padding: const EdgeInsets.all(10),
    color: Colors.teal,
  );
}
