import 'package:demo/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logintimeController.dart';

class MenuData {
  final int id;
  final String title;
  final IconData icon;
  final bool hasSubMenu;
  final List<SubMenuData> subMenuData;

  MenuData({
    required this.id,
    required this.title,
    required this.icon,
    required this.hasSubMenu,
    required this.subMenuData,
  });
}

class SubMenuData {
  final int id;
  final int menuId;
  final String title;

  SubMenuData({
    required this.id,
    required this.menuId,
    required this.title,
  });
}

List<MenuData> menuList = [
  MenuData(id: 1, title: 'Menu 1', icon: Icons.access_alarm, hasSubMenu: true,subMenuData: subMenuList),
  MenuData(id: 2, title: 'Menu 2', icon: Icons.access_time, hasSubMenu: true,subMenuData: subMenuList),
];

List<SubMenuData> subMenuList = [
  SubMenuData(id: 11, menuId: 1, title: 'Submenu 1.1'),
  SubMenuData(id: 12, menuId: 1, title: 'Submenu 1.2'),
  SubMenuData(id: 11, menuId: 2, title: 'Submenu 1.1'),
  SubMenuData(id: 12, menuId: 2, title: 'Submenu 1.2'),
];


class Drawers extends GetView<LoginTimeController>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginTimeController>(
        builder: (controller){
          return buildDrawer();
        }
    );
  }
}

// Drawer buildDrawer(){
// return Drawer(
// child: SingleChildScrollView(
//   child: Padding(
//     padding: const EdgeInsets.symmetric(vertical: 120),
//     child: InkWell(
//       onTap: (){
//       //  handleSubMenuTap(menu);
//       },
//       child: Column(
//         children: List.generate(menuList.length, (index) {
//           var menu = menuList[index];
//           return menu.hasSubMenu?ExpansionTile(title: Text(menu.title),
//           leading: Icon(menu.icon),
//           children: menu.subMenuData.map((submenu) {
//             return ListTile(
//               title: Text(submenu.title),
//               // Add onTap logic for submenu
//               onTap: () {
//                 handleSubMenuTap(submenu.id);
//               },
//             );
//           }).toList(),
//           ): ListTile(
//               title: Text(menu.title),
//           leading: Icon(menu.icon),
//           // Add onTap logic for menu
//           onTap: () {
//             handleSubMenuTap(menu.id);
//           },
//           );
//         }),
//       ),
//     ),
//   ),
// ),
// );
// }


Drawer buildDrawer(){
  return Drawer(
      child: SingleChildScrollView(
      child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 120),
        child: Column(
          children: List.generate(menuList.length, (index) {
              var menu = menuList[index];
              return InkWell(
                onTap:(){
                },
                child: ExpansionTile(
                  title: Text(menu.title),
                  leading: Icon(menu.icon),
                  children: menu.hasSubMenu ? generateSubMenuListTiles(menu):[],
                ),
              );
            }),
        ),
        ),
  ),
  );
}

List<Widget> generateSubMenuListTiles(menuId) {
  List<SubMenuData> list = subMenuList()
  // Generate and return sub-menu ListTiles based on the menuId
  return List.generate(
    subMenuList.length,
        (index) {
      var smenu = subMenuList[index];
      if (smenu.menuId == menuId) {
        return ListTile(
          title: Text(smenu.title),
          onTap: () {
            // Handle sub-menu tile onTap
            handleSubMenuTap(smenu.menuId);
          },
        );
      } else {
        return SizedBox.shrink(); // Return an empty widget if menuId doesn't match
      }
    },
  );
}
//
//
// changeTab(bool submenu){
//    submenu? List.generate(subMenuList.length, (index){
//     var smenu = subMenuList[index];
//      return  ListTile(
//       title: Text(smenu.title),
//     );
//   }) : Get.off(Home());
// }
//
// Drawer buildDrawer(){
//   return Drawer(
//     child:drawerMenuList(),
//   );
// }

// drawerMenuList(){
// return Theme(
//     data: data,
//     child: SingleChildScrollView(
//       physics: const AlwaysScrollableScrollPhysics(),
//       child: Column(
//         children: [
//           Padding(padding: const EdgeInsets.symmetric(horizontal: 3.0,vertical: 3.0),
//           child: Column(
//             children: List.generate(menuList.length, (index) =>
//                 Visibility(child: child)
//             ),
//           ),
//           )
//         ],
//       ),
//     ));
// }
InkWell itemContainer({required BuildContext context, required MenuData menu}){
  return InkWell(
    onTap: (){
      handleSubMenuTap(menu.id);
    },
    child:menu.hasSubMenu ? List.generate(
      subMenuList.length,
        (index){
        var smenu = subMenuList[index];
               return ListTile(
                 title: Text(smenu.title),
                 onTap: (){

                 },
               );
               }) : buildSubMenu(menu.subMenuData));
}

buildSubMenu(List<SubMenuData> subMenuData){
  return Column(
    children: subMenuList.map((subMenu) {
      return ListTile(
        title: Text(subMenu.title),
        onTap: () {
          handleSubMenuTap(subMenu.id);
        },
      );
    }).toList(),
  );
}

// List<SubMenuData> relatedSubMenus = subMenuList
//     .where((subMenu) => subMenu.menuId == menuId)
//     .toList();
handleSubMenuTap(int menuId) {

  switch (menuId) {
    case 1:
    //  return relatedSubMenus;
      break;
    case 2:
      //return relatedSubMenus;
      print('Submenu with ID 2 tapped');
      break;
    case 3:
      print('Submenu with ID 2 tapped');
      break;
    default:
      break;
  }
}
