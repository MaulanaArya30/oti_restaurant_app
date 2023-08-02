import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../components/menu_list.dart';
import '../components/menu_widget.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key, this.searchController});

  final String? searchController;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<MenuWidget> _totalList = MenuList().totalList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * kMenuScreenHeight,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: kMenuPagePadding)
            .copyWith(bottom: kDefaultPadding),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: kMenuAspectRatio,
          crossAxisCount: 2,
        ),
        itemCount: _totalList.length,
        itemBuilder: (context, index) {
          // if (widget.searchController == null) {
          //   return _totalList[index];
          // } else if (_totalList[index]
          //     .name
          //     .toLowerCase()
          //     .contains(widget.searchController!.toLowerCase())) {
          //   return _totalList[index];
          // } else {
          //   return SizedBox();
          // }
          return _totalList[index];
        },
      ),
    );
  }
}
