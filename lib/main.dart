import 'package:flutter/material.dart';
import 'package:todoey/screen/task_screen.dart';
import 'package:provider/provider.dart';
import 'task_data.dart';
void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyTodoApp(),
      
//     );
//   }
// }

// class MyTodoApp extends StatefulWidget {
//   @override
//   _MyTodoAppState createState() => _MyTodoAppState();
// }

// class _MyTodoAppState extends State<MyTodoApp> with SingleTickerProviderStateMixin{
//   TabController tabController;

//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(length: 2, vsync: this);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           toolbarHeight: 80.0,
//           backgroundColor: Colors.white,
//           bottom: TabBar(
//             indicatorColor: Colors.lightBlueAccent,
//             controller: tabController,
//             tabs : [
//               Tab(
//                 icon: Icon(Icons.list,color: Colors.lightBlueAccent,),
//               //text: 'Home'
//               child: Text('Home',style: TextStyle(color:Colors.lightBlueAccent),),
//               ),
              
//                Tab(
//               icon: Icon(Icons.star,color: Colors.lightBlueAccent,),
//               //text: 'Home'
//               child: Text('Streak',style: TextStyle(color:Colors.lightBlueAccent),),
//               ),
//             ],
//           ),
//         ),

//         body: TabBarView(
//           controller: tabController,
//           children: [
//              ChangeNotifierProvider(
//       create: (context)=>TaskData(),
//           child: MaterialApp(
//         home: TasksScreen(),
//       ),
//     ),

//     Center(child: Text('Streak Screen')),


//           ],
//           )
      
//     );
//   }
// }

// class MyTodoApp extends StatefulWidget {
//   @override
//   _MyTodoAppState createState() => _MyTodoAppState();
// }

// class _MyTodoAppState extends State<MyTodoApp> {

//   int selectedIndex=0;

//   static  List<Widget> screens = [
//     ChangeNotifierProvider(
//       create: (context)=>TaskData(),
//           child: MaterialApp(
//         home: TasksScreen(),
//       ),
//     ),

//     Center(child: Text('Streak Screen')),

//   ];
//   void onTap(int index){
//         setState(() {
//           selectedIndex = index;
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: screens.elementAt(selectedIndex),
//       bottomNavigationBar: BottomNavigationBar(
//         items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.list),
//               title: Text('Home'),
//               ),
//                BottomNavigationBarItem(
//               icon: Icon(Icons.star),
//               title: Text('Streak'),
//               ),
//         ],
//         currentIndex: selectedIndex,
//         selectedItemColor: Colors.blue[900],
//         unselectedItemColor: Colors.lightBlueAccent,
//         onTap: onTap,
//         ),
      
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>TaskData(),
          child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

