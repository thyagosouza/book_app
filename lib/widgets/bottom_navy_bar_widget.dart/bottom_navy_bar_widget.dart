import 'package:flutter/material.dart';

class BottomNavyBarWidget extends StatefulWidget {
  const BottomNavyBarWidget({super.key});

  @override
  State<BottomNavyBarWidget> createState() => _BottomNavyBarWidgetState();
}

class _BottomNavyBarWidgetState extends State<BottomNavyBarWidget> {
  int selectedIndex = 0;
  Color backgroundColor = Colors.white;

  List<NavigationItem> items = [
    NavigationItem(
      icon: Icon(Icons.import_contacts_outlined),
    ),
    NavigationItem(
      icon: Icon(Icons.favorite_border),
    ),
    NavigationItem(
      icon: Icon(Icons.person_outlined),
    ),
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 270),
      width: isSelected ? 125 : 60,
      height: 50,
      padding: isSelected
          ? EdgeInsets.only(left: 50)
          : EdgeInsets.only(left: 15, right: 20),
      decoration: isSelected
          ? BoxDecoration(
              //color: item.color,
              color: backgroundColor,
              borderRadius: BorderRadius.circular(50),
            )
          : null,
      child: ListView(
        scrollDirection: Axis.horizontal,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconTheme(
                data: IconThemeData(
                  size: 24,
                  color:
                      isSelected ? Colors.black : Colors.black.withOpacity(0.3),
                ),
                child: item.icon,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: isSelected
                ? DefaultTextStyle.merge(
                    style: TextStyle(color: Colors.black),
                    child: Container(),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        // color: Colors.amber,
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 5),
        margin: const EdgeInsets.symmetric(horizontal: 30.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 40.0,
              color: Colors.black.withOpacity(
                0.1,
              ),
            ),
          ],
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.2), Colors.transparent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.6],
            tileMode: TileMode.clamp,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        // ignore: prefer_const_literals_to_create_immutables
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.map((item) {
            var itemIndex = items.indexOf((item));

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = itemIndex;
                });
              },
              child: _buildItem(item, selectedIndex == itemIndex),
            );
          }).toList(),
        ),
      ),
    ]);
  }
}

class NavigationItem {
  final Icon icon;

  NavigationItem({
    required this.icon,
  });
}
