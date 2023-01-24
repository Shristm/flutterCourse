import 'package:flutter/material.dart';
import 'TabPages/BookTabPage.dart';
import 'TabPages/FavoriteTabPage.dart';
import 'TabPages/HomeTabPage.dart';
import 'TabPages/ProfileTabPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
with SingleTickerProviderStateMixin{
  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index){
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  void initState(){
    tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const[
         HomeTabPage(),
          BookTabPage(),
          FavoriteTabPage(),
          ProfileTabPage(),
        ],
      ),
      bottomNavigationBar: BottomCustomNavigationBar(
        listOfIcon: const[
          Icons.search,
          Icons.menu_book,
          Icons.favorite,
          Icons.person,
        ],
        onChange: (index) {
          setState(() {
            selectedIndex = index;
            tabController!.index = selectedIndex;
          });
        }
      ),
    );
  }
}


class BottomCustomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> listOfIcon;

  const BottomCustomNavigationBar({
    this.defaultSelectedIndex = 0,
    required this.listOfIcon,
    required this.onChange,
  });

  @override
  State<BottomCustomNavigationBar> createState() => _BottomCustomNavigationBarState();
}

class _BottomCustomNavigationBarState extends State<BottomCustomNavigationBar> {
 int _selectedIndex = 0;
 List<IconData> _iconList = [];

 @override
 void initState() {
   //implementing initState
   super.initState();
   _selectedIndex = widget.defaultSelectedIndex;
   _iconList = widget.listOfIcon;
 }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _navBarItemList,
    );
  }

 Widget buildNavBarItem(IconData icon, int index) {
   return GestureDetector(
     onTap: () {
       widget.onChange(index);
       setState(() {
         _selectedIndex = index;
       });
     },
     child: Padding(
       padding: const EdgeInsets.only(left: 10.0, right: 0, bottom: 10),
       child: Container(
         height: 55,
         width: 70,
         decoration: index == _selectedIndex
             ? BoxDecoration(
           color: Color(0xff2c51a4),
           borderRadius: BorderRadius.circular(17),
           boxShadow: [
             BoxShadow(
               color: Colors.blue.shade100,
               offset: const Offset(4, 5),
               spreadRadius: 1,
               blurRadius: 2,
             ),
           ],
         )
             : BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(17),
           boxShadow: [
             BoxShadow(
               color: Colors.blue.shade100,
               offset: const Offset(5, 8),
               spreadRadius: 1,
               blurRadius: 2,
             ),
           ],
         ),
         child: Icon(
           icon,
           size: 33,
           color: index == _selectedIndex
               ? Colors.white
               : const Color(0xff2c51a4),
         ),
       ),
     ),
   );
 }
}
