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
  List<MenuWidget> searchList = [];
  int length = 0;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setState(() {
  //     searchList = _totalList;
  //     length = searchList.length;
  //   });
  // }

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
        itemCount: length,
        itemBuilder: (context, index) {
          // if (widget.searchController == null) {
          //   setState(() {
          //     searchList = _totalList;
          //     length = searchList.length;
          //   });
          //   return searchList[index];
          // } else if (widget.searchController?.length == 1) {
          //   setState(() {
          //     searchList = _totalList;
          //     length = searchList.length;
          //   });
          //   return searchList[index];
          // } else {
          //   searchList.clear();
          //   if (_totalList[index]
          //       .name
          //       .toLowerCase()
          //       .contains(widget.searchController!.toLowerCase())) {
          //     setState(() {
          //       searchList.add(_totalList[index]);
          //       length = searchList.length;
          //     });

          //     return searchList[index];
          //   } else {
          //     return SizedBox();
          //   }
          // }
          //return searchList[index];
          if (widget.searchController == null) {
            setState(() {
              searchList = _totalList;
              length = searchList.length;
            });

            return searchList[index];
          } else {
            searchList.clear();
            if (_totalList[index]
                .name
                .toLowerCase()
                .contains(widget.searchController!.toLowerCase())) {
              setState(() {
                searchList.add(_totalList[index]);
                length = searchList.length;
              });
              return searchList[index];
            } else {
              return SizedBox();
            }
          }
        },
      ),
    );
  }
}
