import 'dart:typed_data';
import 'package:fire_auth_otp/controller/homepage_provider.dart';
import 'package:fire_auth_otp/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../utils/image-picker.dart';




class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomepageModel(),
      child: Consumer<HomepageModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: ConstColors.loginBackgroundColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    model.image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(model.image!),
                          )
                        : const CircleAvatar(
                            radius: 65,
                            backgroundImage: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4_lBZNZf1Xau4uQbLM7t1Lc5C-6bzRP6aBw&usqp=CAU'),
                          ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () async {
                          Uint8List img = await pickImage(ImageSource.gallery);
                          if (img != null) {
                            model.setImage(img);
                          }
                        },
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    )
                  ],
                ),
                const Center(
                  child: Text(
                    'Homepage',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(160, 50),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Provider.of<HomepageModel>(context, listen: false).signOut(context);
                  },
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(
                        color: ConstColors.loginPageText,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



















































// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   // Uint8List? image;

//   // void selectimage() async {
//   //   Uint8List img = await pickImage(ImageSource.gallery);
//   //   setState(() {
//   //     image = img;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ConstColors.loginBackgroundColor,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Stack(
//             children: [
//               image != null
//                   ? CircleAvatar(
//                       radius: 64,
//                       backgroundImage: MemoryImage(image!),
//                     )
//                   : const CircleAvatar(
//                       radius: 65,
//                       backgroundImage: NetworkImage(
//                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4_lBZNZf1Xau4uQbLM7t1Lc5C-6bzRP6aBw&usqp=CAU'),
//                     ),
//               Positioned(
//                 bottom: -10,
//                 left: 80,
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: const Icon(Icons.add_a_photo),
//                 ),
//               )
//             ],
//           ),
//           const Center(
//             child: Text(
//               'Homepage',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 26,
//               ),
//             ),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               minimumSize: const Size(160, 50),
//               backgroundColor: Colors.transparent,
//               shadowColor: Colors.transparent,
//             ),
//             onPressed: () {
//               FirebaseAuth.instance.signOut();
//               Navigator.pushNamed(context, "/Loginpage");
//             },
//             child: const Text(
//               'Sign Out',
//               style: TextStyle(
//                   color: ConstColors.loginPageText,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
