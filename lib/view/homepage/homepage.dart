import 'dart:io';
import 'dart:typed_data';
import 'package:fire_auth_otp/controller/homepage_provider.dart';
import 'package:fire_auth_otp/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../utils/image-picker.dart';
import 'package:cloudinary_public/cloudinary_public.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  Uint8List? image;
  final cloudinary = CloudinaryPublic('dzeuipdky', 'ml_default', cache: false);
                   dynamic url;
 File? gigImageFile;
  void selectimage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  String imageUrl = '';
  
  @override
  Widget build(BuildContext context) {
    return Consumer<HomepageModel>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: ConstColors.loginBackgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
    // final prov = Provider.of<UserProfileProvider>(context, listen: false);
    //               image != null
    // if(gigImageFile != null) {
    //   CloudinaryResponse response = await cloudinary.uploadFile(
    //       CloudinaryFile.fromFile(gigImageFile!.path,
    //           resourceType: CloudinaryResourceType.Image));
    //   url = response.secureUrl;
    // }
                      // ? CircleAvatar(
                      //     radius: 64,
                      //     backgroundImage: MemoryImage(image!),
                      //   )
                       const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4_lBZNZf1Xau4uQbLM7t1Lc5C-6bzRP6aBw&usqp=CAU'),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () async {
                        Uint8List img = await pickImage(ImageSource.gallery);
                        model.setImage(img);
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
                  Provider.of<HomepageModel>(context, listen: false)
                      .signOut(context);
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
    );
  }
}

                          // ImagePicker imagePicker = ImagePicker();
                          // XFile? file = await imagePicker.pickImage(
                          //     source: ImageSource.gallery);
                          // print("${file?.path}");
                          // if (file == null) return;

                          // String uniqeFileName =
                          //     DateTime.now().microsecondsSinceEpoch.toString();

                          // Reference referenceRoot =
                          //     FirebaseStorage.instance.ref();
                          // Reference referenceDirImage =
                          //     referenceRoot.child('image');

                          // Reference referenceImageToUpload =
                          //     referenceDirImage.child(uniqeFileName);

                          // try {
                          //   await referenceImageToUpload
                          //       .putFile(File(file!.path));
                          //   imageUrl = await referenceDirImage.getDownloadURL();
                          // } catch (error) {}











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
