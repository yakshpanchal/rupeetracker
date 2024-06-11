import 'package:flutter/material.dart';

import '../Auth/Widgets/ElevetedButton.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('profile page'),
//       ),
//     );
//   }
// }

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // form key --- for edit address or name.
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  String? selectedFaculty;
  String? selectedCollege;
  TextEditingController department = TextEditingController();
  TextEditingController roomnumber = TextEditingController();

  // ---> Refresh Screen.
  void _refreshScreen() {
    setState(() {
      // Update the data here...
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            "Profile",
            style:TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: Column(
        children: [
          Text('This is a Profile Screen')
        ],
      )
        
    );
  }

  Widget buildDetailCard(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}















// import 'package:flutter/material.dart';
// import 'package:milk_factory/providers/user_provider.dart';
// import 'package:milk_factory/screens/login/login_screen.dart';
// import 'package:milk_factory/utils/global_list.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ProfilePage extends StatefulWidget {
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   // form key --- for edit address or name.
//   final _formKey = GlobalKey<FormState>();
//   String? selectedFaculty;
//   String? selectedCollege;
//   TextEditingController department = TextEditingController();
//   TextEditingController roomnumber = TextEditingController();

//   void logOutUser(BuildContext context) async {
//     UserProvider().clearUserData();
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//     Navigator.pushAndRemoveUntil(
//         (context),
//         MaterialPageRoute(builder: (context) => const LoginScreen()),
//         (route) => false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Profile'),
//       // ),
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/dairy_image.jpeg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: ColorFiltered(
//               colorFilter: ColorFilter.mode(
//                 Colors.white.withOpacity(0.5),
//                 BlendMode.dstATop,
//               ),
//               child: Container(color: Colors.white),
//             ),
//           ),
//           SingleChildScrollView(
//             padding: EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 buildDetailCard(
//                   'Name',
//                   Provider.of<UserProvider>(context, listen: false).name!,
//                 ),
//                 buildDetailCard(
//                   'Email',
//                   Provider.of<UserProvider>(context, listen: false).email!,
//                 ),
//                 buildDetailCard(
//                   'Address',
//                   Provider.of<UserProvider>(context, listen: false).address!,
//                 ),
//                 buildDetailCard(
//                   'Phone',
//                   Provider.of<UserProvider>(context, listen: false).phone!,
//                 ),
//                 SizedBox(height: 30),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         _showEditDialog(context);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.blue,
//                         textStyle: TextStyle(fontSize: 18),
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                       ),
//                       child: Text('Edit'),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Log out user.
//                         logOutUser(context);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.red,
//                         textStyle: TextStyle(fontSize: 18),
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                       ),
//                       child: Text('Logout'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildDetailCard(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.8),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(
//           children: [
//             Text(
//               label + ':',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             SizedBox(width: 10),
//             Expanded(
//               child: Text(
//                 value,
//                 style: TextStyle(
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _showEditDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         TextEditingController nameController = TextEditingController(
//             text: Provider.of<UserProvider>(context, listen: false).name!);
//         TextEditingController addressController = TextEditingController(
//             text: Provider.of<UserProvider>(context, listen: false).address!);

//         return AlertDialog(
//           title: Text('Edit Profile'),
//           content: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: nameController,
//                     decoration: InputDecoration(labelText: 'Name'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your name';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),

//                   //-------> address
//                   // Faculty
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: DropdownButtonHideUnderline(
//                       child: DropdownButtonFormField<String>(
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please select your faculty';
//                           }
//                           return null;
//                         },
//                         value: selectedFaculty,
//                         hint: Text(
//                           'Select Faculty',
//                           style: TextStyle(
//                             color: Colors.black54,
//                           ),
//                         ),
//                         isExpanded: true,
//                         icon: Icon(
//                           Icons.arrow_drop_down,
//                           color: Colors.black54,
//                         ),
//                         onChanged: (newValue) {
//                           setState(() {
//                             selectedFaculty = newValue!;
//                           });
//                         },
//                         items: faculties
//                             .map<DropdownMenuItem<String>>((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(
//                               value,
//                               style: TextStyle(
//                                 fontSize: 16.0,
//                                 color: Colors.black87,
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),

//                   SizedBox(
//                     height: 9,
//                   ),

//                   // College
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                     child: DropdownButtonHideUnderline(
//                       child: DropdownButtonFormField<String>(
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please Select your college';
//                           }
//                           return null;
//                         },
//                         value: selectedCollege,
//                         hint: Text(
//                           'Select College',
//                           style: TextStyle(
//                             color: Colors.black54,
//                           ),
//                         ),
//                         isExpanded: true,
//                         icon: Icon(
//                           Icons.arrow_drop_down,
//                           color: Colors.black54,
//                         ),
//                         onChanged: (newValue2) {
//                           setState(() {
//                             selectedCollege = newValue2!;
//                           });
//                         },
//                         items: colleges
//                             .map<DropdownMenuItem<String>>((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(
//                               value,
//                               style: TextStyle(
//                                 fontSize: 16.0,
//                                 color: Colors.black87,
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),

//                   SizedBox(
//                     height: 9,
//                   ),

//                   // Department
//                   TextFormField(
//                     controller: department,
//                     keyboardType: TextInputType.name,
//                     decoration: const InputDecoration(
//                       labelText: 'Department',
//                       prefixIcon: Icon(
//                         Icons.menu_book,
//                         color: Colors.blue,
//                       ),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(20))),
//                       contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
//                       filled: true,
//                       fillColor: Color.fromARGB(27, 227, 223, 231),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your Department';
//                       }
//                       return null;
//                     },
//                   ),

//                   SizedBox(
//                     height: 9,
//                   ),

//                   // ClassRoom / Staff room
//                   TextFormField(
//                     controller: roomnumber,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       labelText: 'Room number',
//                       prefixIcon: Icon(
//                         Icons.room,
//                         color: Colors.blue,
//                       ),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(20))),
//                       contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
//                       filled: true,
//                       fillColor: Color.fromARGB(27, 227, 223, 231),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your class/staff room number';
//                       }
//                       return null;
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 // Save button pressed
//                 // TODO: Update user details in the provider or database
//                 if (_formKey.currentState!.validate()) {
//                   Navigator.pop(context); // Close the dialog
//                 }
//               },
//               style: ElevatedButton.styleFrom(primary: Colors.blue),
//               child: Text('Save'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context); // Close the dialog without saving
//               },
//               style: ElevatedButton.styleFrom(primary: Colors.red),
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
