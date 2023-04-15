
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Screen extends StatefulWidget {
//   const Screen({super.key});

//   @override
//   State<Screen> createState() => _ScreenState();
// }

// class _ScreenState extends State<Screen> {
//   var firestorefireStream = FirebaseFirestore.instance.collection('sample').snapshots();
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: StreamBuilder(
//         stream: firestorefireStream,
//         builder: (context, snapshot) {
//            final doc = snapshot.data!.docs;
//            return ListView.builder(
//           itemCount: doc.length,
//           itemBuilder: (context, index) {
//                var fname = doc[index]['Firstnamr'];
//                var lname = doc[index]['Lastname'];
//                var age = doc[index]['Age'].toString();
//                 var list = doc[index]['hobbies'] as List<dynamic>;
//                  var hobbies = list.join(',');
//                  return Card(
//                   child: ListTile(
//                     title: Text('$fname $lname'),
//                     trailing: Text(age),
//                     subtitle: Text(hobbies),
//                   ),
//                  );

//           },
//         );
//         }
//       )
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class screen extends StatelessWidget {
  const screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 

      StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('sample').snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return Text('Error:${snapshot.error}');
        }
        if(!snapshot.hasData){
          return CircularProgressIndicator();
        }
        List <DocumentSnapshot> item = snapshot.data!.docs;
        return ListView.builder(
          itemCount: item.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(item[index]['Firstname'] + " " + item[index]['Lastname'] + " "  + "(" + item[index]['Age'].toString() +")" ),
              subtitle: Text(item[index]['hobbies'].toString() ),
              trailing: Text(item[index]['hobbies'].length.toString()),
            );
          });
      },)));
  }
}