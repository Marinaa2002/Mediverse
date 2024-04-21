// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/data/models/PatientProfileModel.dart';
// import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Manager/profile_edit_cubit/profile_edit_cubit.dart';
// import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/Widgets/ProfileLoadingIndicatorWidget.dart';
//
// import '../../../../../../Constants/Themes.dart';
// import '../../../../../../Constants/constant.dart';
// import 'ProfileEditTextFormField.dart';
// import 'ProfileSaveButton.dart';
//
// class ProfileEditWidget extends StatelessWidget {
//   GlobalKey<FormState> formKey = GlobalKey();
//   final currentUser = FirebaseAuth.instance.currentUser;
//
//   CollectionReference details =
//   FirebaseFirestore.instance.collection('info_Patients');
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController ageController = TextEditingController();
//   final TextEditingController natIDController = TextEditingController();
//   final TextEditingController phoneNumController = TextEditingController();
//   // String? name ;
//   // String? age;
//   // String? national_id;
//   // String? phoneNum;
//   PatientProfileModel patientProfileModel;
//   bool isLoading = false;
//
//   List<PatientProfileModel> profileModelList = [];
//   ProfileEditWidget({
//     super.key,
//     required this.patientProfileModel
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kprimaryColor,
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.chevron_left,
//             color: kSecondryBackgroundColor,
//             size: 24,
//           ),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: Text(
//           'Edit Profile',
//           style: Themes.headlineMedium.copyWith(
//             color: backgroundColor,
//             fontSize: 22,
//           ),
//         ),
//         actions: [],
//         centerTitle: true,
//         elevation: 2,
//       ),
//       body: BlocBuilder<ProfileEditCubit, ProfileEditState>(
//           builder: (context, state) {
//             if(state is ProfileEditSuccess){
//               // profileModelList = state.profileModelList;
//               //final userData = snapshot.data!.data() as Map<String, dynamic>;
//               return Expanded(
//                 child: SingleChildScrollView(
//                   child: Form(
//                       key: formKey,
//                       child: Column(
//                         children: [
//                           Align(
//                             alignment: const AlignmentDirectional(-1, -1),
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   15, 20, 0, 10),
//                               child: Text('Change Your name:',
//                                   style: Themes.titleButton),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 20),
//                             child: ProfileTextFormField(
//                               text: "Name",
//                               validator: (value) {
//                                 // if (value!.isEmpty) {
//                                 //   return 'Field is required';
//                                 // } else if (!value.contains('@')) {
//                                 //   return 'Formatted Email is required';
//                                 // }
//                               },
//                               onChanged: (value) {
//                                 patientProfileModel.name = value;
//                               },
//                               controller: nameController,
//                             ),
//                           ),
//                           Align(
//                             alignment: const AlignmentDirectional(-1, -1),
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   15, 5, 0, 10),
//                               child: Text('Change Your Age:',
//                                   style: Themes.titleButton),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 20),
//                             child: ProfileTextFormField(
//                               text: "Age",
//                               validator: (value) {
//                                 // if (value!.isEmpty) {
//                                 //   return 'Field is required';
//                                 // }
//                               },
//                               onChanged: (value) {
//                                 patientProfileModel.age = value;
//                               },
//                               controller: ageController,
//                             ),
//                           ),
//                           Align(
//                             alignment: const AlignmentDirectional(-1, -1),
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   15, 5, 0, 10),
//                               child: Text('Change Your Phone Number:',
//                                   style: Themes.titleButton),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 20),
//                             child: ProfileTextFormField(
//                               text: "Phone Number",
//                               validator: (value) {
//                                 // if (value!.isEmpty) {
//                                 //   return 'Field is required';
//                                 // }
//                               },
//                               onChanged: (value) {
//                                 patientProfileModel.phoneNumber = value;
//                               },
//                               controller: phoneNumController,
//                             ),
//                           ),
//                           Align(
//                             alignment: const AlignmentDirectional(-1, -1),
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   15, 5, 0, 10),
//                               child: Text('Change Your National ID:',
//                                   style: Themes.titleButton),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 10),
//                             child: ProfileTextFormField(
//                               text: "National ID",
//                               validator: (value) {
//                                 // if (value!.isEmpty) {
//                                 //   return 'Field is required';
//                                 // }
//                               },
//                               onChanged: (value) {
//                                 patientProfileModel.nationalId = value;
//                               },
//                               controller: natIDController,
//                             ),
//                           ),
//                           ProfileSaveButton(
//                             text: "Save",
//                             screen: null,
//                             onPressed: () async {
//                               if (formKey.currentState!.validate()) {
//                                 BlocProvider.of<ProfileEditCubit>(context)
//                                     .editInfoPatient(name: patientProfileModel.name,
//                                     age: patientProfileModel.age,
//                                     phoneNum: patientProfileModel.phoneNumber,
//                                     national_id: patientProfileModel.nationalId);
//                                 Navigator.pop(context);
//                               } else {}
//                             },
//                           ),
//                         ],
//                       )),
//                 ),
//               );
//             } else if(state is ProfileEditLoading){
//               return ProfileLoadingIndicatorWidget();
//             } else{
//               return Text('Error');
//             }
//           }),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Manager/profile_edit_cubit/profile_edit_cubit.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
//
// import '../../../../../../Constants/Themes.dart';
// import '../../../../../../Constants/constant.dart';
// import '../../../../../Beginning/LoginScreen/presentation/views/widgets/LoginButtonWidget.dart';
// import '../../../../../Beginning/LoginScreen/presentation/views/widgets/TextFormFieldPassWidget.dart';
// import '../../../../../Beginning/LoginScreen/presentation/views/widgets/TextFormFieldWidget.dart';
// import 'ProfileEditTextFormField.dart';
//
// class ProfileEditWidget extends StatelessWidget {
//   GlobalKey<FormState> formKey = GlobalKey();
//
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController ageController = TextEditingController();
//   final TextEditingController natIDController = TextEditingController();
//   final TextEditingController phoneNumController = TextEditingController();
//   String? name;
//   String? age;
//   String? national_id;
//   String? phoneNum;
//   bool isLoading = false;
//
//   ProfileEditWidget({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kprimaryColor,
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.chevron_left,
//             color: kSecondryBackgroundColor,
//             size: 24,
//           ),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: Text(
//           'Edit Profile',
//           style: Themes.headlineMedium.copyWith(
//             color: backgroundColor,
//             fontSize: 22,
//           ),
//         ),
//         actions: [],
//         centerTitle: true,
//         elevation: 2,
//       ),
//       body: BlocConsumer<ProfileEditCubit, ProfileEditState>(
//         listener: (context, state) {
//           if (state is ProfileEditLoading) {
//             isLoading = true;
//           } else if (state is ProfileEditSuccess) {
//             Navigator.pop(context);
//             isLoading = false;
//           } else if (state is ProfileEditFailure) {
//             isLoading = false;
//             print(state.errMsg);
//             showSnackbar(context, state.errMsg);
//           }
//         },
//         builder: (context, state) {
//           return ModalProgressHUD(
//             inAsyncCall: isLoading,
//             child: Expanded(
//               child: SingleChildScrollView(
//                 child: Form(
//                     key: formKey,
//                     child: Column(
//                       children: [
//                         Align(
//                           alignment: const AlignmentDirectional(-1, -1),
//                           child: Padding(
//                             padding:
//                                 const EdgeInsetsDirectional.fromSTEB(15, 20, 0, 10),
//                             child:
//                                 Text('Change Your name:', style: Themes.titleButton),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 20),
//                           child: ProfileTextFormField(
//                             text: "Name",
//                             validator: (value) {
//                               // if (value!.isEmpty) {
//                               //   return 'Field is required';
//                               // } else if (!value.contains('@')) {
//                               //   return 'Formatted Email is required';
//                               // }
//                             },
//                             onSubmitted: (value) {
//                               name = value;
//                             },
//                             controller: nameController,
//                           ),
//                         ),
//                         Align(
//                           alignment: const AlignmentDirectional(-1, -1),
//                           child: Padding(
//                             padding:
//                                 const EdgeInsetsDirectional.fromSTEB(15, 5, 0, 10),
//                             child:
//                                 Text('Change Your Age:', style: Themes.titleButton),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 20),
//                           child: ProfileTextFormField(
//                             text: "Age",
//                             validator: (value) {
//                               // if (value!.isEmpty) {
//                               //   return 'Field is required';
//                               // }
//                             },
//                             onSubmitted: (value) {
//                               age = value;
//                             },
//                             controller: ageController,
//                           ),
//                         ),
//                         Align(
//                           alignment: const AlignmentDirectional(-1, -1),
//                           child: Padding(
//                             padding:
//                                 const EdgeInsetsDirectional.fromSTEB(15, 5, 0, 10),
//                             child: Text('Change Your Phone Number:',
//                                 style: Themes.titleButton),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 20),
//                           child: ProfileTextFormField(
//                             text: "Phone Number",
//                             validator: (value) {
//                               // if (value!.isEmpty) {
//                               //   return 'Field is required';
//                               // }
//                             },
//                             onSubmitted: (value) {
//                               phoneNum = value;
//                             },
//                             controller: phoneNumController,
//                           ),
//                         ),
//                         Align(
//                           alignment: const AlignmentDirectional(-1, -1),
//                           child: Padding(
//                             padding:
//                                 const EdgeInsetsDirectional.fromSTEB(15, 5, 0, 10),
//                             child: Text('Change Your National ID:',
//                                 style: Themes.titleButton),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 10),
//                           child: ProfileTextFormField(
//                             text: "National ID",
//                             validator: (value) {
//                               // if (value!.isEmpty) {
//                               //   return 'Field is required';
//                               // }
//                             },
//                             onSubmitted: (value) {
//                               national_id = value;
//                             },
//                             controller: natIDController,
//                           ),
//                         ),
//                         LoginButtonWidget(
//                           text: "Save",
//                           screen: null,
//                           onPressed: () async {
//                             if (formKey.currentState!.validate()) {
//                               BlocProvider.of<ProfileEditCubit>(context)
//                                   .editInfoPatient(
//                                       name: name,
//                                       age: age,
//                                       phoneNum: phoneNum,
//                                       national_id: national_id);
//                             } else {}
//                           },
//                         ),
//                       ],
//                     )),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//   void showSnackbar(BuildContext context, String message) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }
// }


// import 'package:flutter/material.dart';
//
// import '../../../../../../Constants/Themes.dart';
// import '../../../../../../Constants/constant.dart';
// import '../../../../../Beginning/LoginScreen/presentation/views/widgets/LoginButtonWidget.dart';
// import '../../../../../Beginning/LoginScreen/presentation/views/widgets/TextFormFieldPassWidget.dart';
// import '../../../../../Beginning/LoginScreen/presentation/views/widgets/TextFormFieldWidget.dart';
//
// class ProfileEditWidget extends StatelessWidget {
//   GlobalKey<FormState> formKey = GlobalKey();
//
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController ageController = TextEditingController();
//   final TextEditingController natIDController = TextEditingController();
//   final TextEditingController phoneNumController = TextEditingController();
//   String? name;
//   String? age;
//   String? national_id;
//   String? phoneNum;
//   bool isLoading = false;
//   ProfileEditWidget({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kprimaryColor,
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.chevron_left,
//             color: kSecondryBackgroundColor,
//             size: 24,
//           ),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: Text(
//           'Edit Profile',
//           style: Themes.headlineMedium.copyWith(
//             color: backgroundColor,
//             fontSize: 22,
//           ),
//         ),
//         actions: [],
//         centerTitle: true,
//         elevation: 2,
//       ),
//       body: Form(
//           key: formKey,
//           child: Column(
//             children: [
//               Align(
//                 alignment: const AlignmentDirectional(-1, -1),
//                 child: Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 0, 10),
//                   child: Text('Change Your name:',
//                       style: Themes.titleButton),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 20),
//                 child: TextFormFieldWidget(
//                   text: "Name",
//                   validator: (value) {
//                     // if (value!.isEmpty) {
//                     //   return 'Field is required';
//                     // } else if (!value.contains('@')) {
//                     //   return 'Formatted Email is required';
//                     // }
//                   },
//                   onChanged: (value) {
//                     name = value;
//                   },
//                   controller: nameController,
//                 ),
//               ),
//               Align(
//                 alignment: const AlignmentDirectional(-1, -1),
//                 child: Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 0, 10),
//                   child: Text('Change Your Age:',
//                       style: Themes.titleButton),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 20),
//                 child: TextFormFieldWidget(
//                   text: "Age",
//                   validator: (value) {
//                     // if (value!.isEmpty) {
//                     //   return 'Field is required';
//                     // }
//                   },
//                   onChanged: (value) {
//                     age = value;
//                   }, controller: ageController,
//                 ),
//               ),
//               Align(
//                 alignment: const AlignmentDirectional(-1, -1),
//                 child: Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 0, 10),
//                   child: Text('Change Your Phone Number:',
//                       style: Themes.titleButton),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 20),
//                 child: TextFormFieldWidget(
//                   text: "Phone Number",
//                   validator: (value) {
//                     // if (value!.isEmpty) {
//                     //   return 'Field is required';
//                     // }
//                   },
//                   onChanged: (value) {
//                     phoneNum = value;
//                   }, controller: phoneNumController,
//                 ),
//               ),
//               Align(
//                 alignment: const AlignmentDirectional(-1, -1),
//                 child: Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 0, 10),
//                   child: Text('Change Your National ID:',
//                       style: Themes.titleButton),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 10),
//                 child: TextFormFieldWidget(
//                   text: "National ID",
//                   validator: (value) {
//                     // if (value!.isEmpty) {
//                     //   return 'Field is required';
//                     // }
//                   },
//                   onChanged: (value) {
//                     national_id = value;
//                   }, controller: natIDController,
//                 ),
//               ),
//               LoginButtonWidget(
//                 text: "Save",
//                 screen: null,
//                 onPressed: () async {
//                   if (formKey.currentState!.validate()) {
//                     // BlocProvider.of<LoginCubit>(context)
//                     //     .loginUser(email: email!, password: password!);
//                   } else {}
//                 },
//               ),
//             ],
//           )),
//     );
//   }
// }


//
// // import 'package:flutter/material.dart';
// //
// // import '../../../../../../Constants/Themes.dart';
// // import '../../../../../../Constants/constant.dart';
// // import '../../../../../Beginning/LoginScreen/presentation/views/widgets/LoginButtonWidget.dart';
// // import '../../../../../Beginning/LoginScreen/presentation/views/widgets/TextFormFieldPassWidget.dart';
// // import '../../../../../Beginning/LoginScreen/presentation/views/widgets/TextFormFieldWidget.dart';
// //
// // class ProfileEditWidget extends StatelessWidget {
// //   GlobalKey<FormState> formKey = GlobalKey();
// //
// //   final TextEditingController nameController = TextEditingController();
// //   final TextEditingController ageController = TextEditingController();
// //   final TextEditingController natIDController = TextEditingController();
// //   final TextEditingController phoneNumController = TextEditingController();
// //   String? name;
// //   String? age;
// //   String? national_id;
// //   String? phoneNum;
// //   bool isLoading = false;
// //   ProfileEditWidget({
// //     super.key,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: kprimaryColor,
// //         automaticallyImplyLeading: false,
// //         leading: IconButton(
// //           icon: const Icon(
// //             Icons.chevron_left,
// //             color: kSecondryBackgroundColor,
// //             size: 24,
// //           ),
// //           onPressed: () {
// //             Navigator.of(context).pop();
// //           },
// //         ),
// //         title: Text(
// //           'Edit Profile',
// //           style: Themes.headlineMedium.copyWith(
// //             color: backgroundColor,
// //             fontSize: 22,
// //           ),
// //         ),
// //         actions: [],
// //         centerTitle: true,
// //         elevation: 2,
// //       ),
// //       body: Form(
// //           key: formKey,
// //           child: Column(
// //             children: [
// //               Align(
// //                 alignment: const AlignmentDirectional(-1, -1),
// //                 child: Padding(
// //                   padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 0, 10),
// //                   child: Text('Change Your name:',
// //                       style: Themes.titleButton),
// //                 ),
// //               ),
// //               Padding(
// //                 padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 20),
// //                 child: TextFormFieldWidget(
// //                   text: "Name",
// //                   validator: (value) {
// //                     // if (value!.isEmpty) {
// //                     //   return 'Field is required';
// //                     // } else if (!value.contains('@')) {
// //                     //   return 'Formatted Email is required';
// //                     // }
// //                   },
// //                   onChanged: (value) {
// //                     name = value;
// //                   },
// //                   controller: nameController,
// //                 ),
// //               ),
// //               Align(
// //                 alignment: const AlignmentDirectional(-1, -1),
// //                 child: Padding(
// //                   padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 0, 10),
// //                   child: Text('Change Your Age:',
// //                       style: Themes.titleButton),
// //                 ),
// //               ),
// //               Padding(
// //                 padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 20),
// //                 child: TextFormFieldWidget(
// //                   text: "Age",
// //                   validator: (value) {
// //                     // if (value!.isEmpty) {
// //                     //   return 'Field is required';
// //                     // }
// //                   },
// //                   onChanged: (value) {
// //                     age = value;
// //                   }, controller: ageController,
// //                 ),
// //               ),
// //               Align(
// //                 alignment: const AlignmentDirectional(-1, -1),
// //                 child: Padding(
// //                   padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 0, 10),
// //                   child: Text('Change Your Phone Number:',
// //                       style: Themes.titleButton),
// //                 ),
// //               ),
// //               Padding(
// //                 padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 20),
// //                 child: TextFormFieldWidget(
// //                   text: "Phone Number",
// //                   validator: (value) {
// //                     // if (value!.isEmpty) {
// //                     //   return 'Field is required';
// //                     // }
// //                   },
// //                   onChanged: (value) {
// //                     phoneNum = value;
// //                   }, controller: phoneNumController,
// //                 ),
// //               ),
// //               Align(
// //                 alignment: const AlignmentDirectional(-1, -1),
// //                 child: Padding(
// //                   padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 0, 10),
// //                   child: Text('Change Your National ID:',
// //                       style: Themes.titleButton),
// //                 ),
// //               ),
// //               Padding(
// //                 padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 10),
// //                 child: TextFormFieldWidget(
// //                   text: "National ID",
// //                   validator: (value) {
// //                     // if (value!.isEmpty) {
// //                     //   return 'Field is required';
// //                     // }
// //                   },
// //                   onChanged: (value) {
// //                     national_id = value;
// //                   }, controller: natIDController,
// //                 ),
// //               ),
// //               LoginButtonWidget(
// //                 text: "Save",
// //                 screen: null,
// //                 onPressed: () async {
// //                   if (formKey.currentState!.validate()) {
// //                     // BlocProvider.of<LoginCubit>(context)
// //                     //     .loginUser(email: email!, password: password!);
// //                   } else {}
// //                 },
// //               ),
// //             ],
// //           )),
// //     );
// //   }
// // }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Constants/Themes.dart';
import '../../../../../../Constants/constant.dart';
import '../../../../../Beginning/LoginScreen/presentation/views/widgets/LoginButtonWidget.dart';
import '../../../../../Beginning/LoginScreen/presentation/views/widgets/TextFormFieldPassWidget.dart';
import '../../../../../Beginning/LoginScreen/presentation/views/widgets/TextFormFieldWidget.dart';
import 'ProfileEditTextFormField.dart';
import 'ProfileSaveButton.dart';

class ProfileEditWidget extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  final currentUser = FirebaseAuth.instance.currentUser;

  CollectionReference details =
  FirebaseFirestore.instance.collection('info_Patients');
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController natIDController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  String? name;
  String? age;
  String? national_id;
  String? phoneNum;
  bool isLoading = false;
  ProfileEditWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: kSecondryBackgroundColor,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Edit Profile',
          style: Themes.headlineMedium.copyWith(
            color: backgroundColor,
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: details.doc(currentUser!.uid).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              return Expanded(
                child: SingleChildScrollView(
                  child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1, -1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 20, 0, 10),
                              child: Text('Change Your name:',
                                  style: Themes.titleButton),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 20),
                            child: ProfileTextFormField(
                              text: "Name",
                              onChanged: (value) {
                                userData['Name'] = value;
                              },
                              controller: nameController,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1, -1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 5, 0, 10),
                              child: Text('Change Your Age:',
                                  style: Themes.titleButton),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 20),
                            child: ProfileTextFormField(
                              text: "Age",
                              onChanged: (value) {
                                userData['Age'] = value;
                              },
                              controller: ageController,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1, -1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 5, 0, 10),
                              child: Text('Change Your Phone Number:',
                                  style: Themes.titleButton),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 20),
                            child: ProfileTextFormField(
                              text: "Phone Number",
                              onChanged: (value) {
                                userData['Phone Number'] = value;
                              },
                              controller: phoneNumController,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1, -1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 5, 0, 10),
                              child: Text('Change Your National ID:',
                                  style: Themes.titleButton),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 10),
                            child: ProfileTextFormField(
                              text: "National ID",
                              onChanged: (value) {
                                userData['NationalId'] = value;
                              },
                              controller: natIDController,
                            ),
                          ),
                          ProfileSaveButton(
                            text: "Save",
                            screen: null,
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await details.doc(currentUser!.uid).update({
                                  'Age': userData['Age'],
                                  'Name': userData['Name'],
                                  'NationalId': userData['NationalId'],
                                  'Phone Number': userData['Phone Number']
                                });
                                Navigator.pop(context);
                                //       .set(
                                //       {'Age': userData['Age']
                                // });
                                // BlocProvider.of<LoginCubit>(context)
                                //     .loginUser(email: email!, password: password!);
                              } else {}
                            },
                          ),
                        ],
                      )),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Manager/profile_edit_cubit/profile_edit_cubit.dart';
//
// import '../../../../../../Constants/Themes.dart';
// import '../../../../../../Constants/constant.dart';
// import '../../../../../Beginning/LoginScreen/presentation/views/widgets/LoginButtonWidget.dart';
// import '../../../../../Beginning/LoginScreen/presentation/views/widgets/TextFormFieldPassWidget.dart';
// import '../../../../../Beginning/LoginScreen/presentation/views/widgets/TextFormFieldWidget.dart';
// import '../../../data/models/PatientProfileModel.dart';
// import 'ProfileEditTextFormField.dart';
// import 'ProfileSaveButton.dart';
//
// class ProfileEditWidget extends StatelessWidget {
//   GlobalKey<FormState> formKey = GlobalKey();
//   final currentUser = FirebaseAuth.instance.currentUser;
//
//   CollectionReference details =
//   FirebaseFirestore.instance.collection('info_Patients');
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController ageController = TextEditingController();
//   final TextEditingController natIDController = TextEditingController();
//   final TextEditingController phoneNumController = TextEditingController();
//   String? name;
//   String? age;
//   String? national_id;
//   String? phoneNum;
//   bool isLoading = false;
//
//   //PatientProfileModel? patientProfileModel;
//   //var userData;
//   ProfileEditWidget({
//     super.key,
//     //required this.userData
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: kprimaryColor,
//           automaticallyImplyLeading: false,
//           leading: IconButton(
//             icon: const Icon(
//               Icons.chevron_left,
//               color: kSecondryBackgroundColor,
//               size: 24,
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           title: Text(
//             'Edit Profile',
//             style: Themes.headlineMedium.copyWith(
//               color: backgroundColor,
//               fontSize: 22,
//             ),
//           ),
//           actions: [],
//           centerTitle: true,
//           elevation: 2,
//         ),
//         body: BlocBuilder<ProfileEditCubit, ProfileEditState>(
//           builder: (context, state) {
//             if(state is ProfileEditLoading) {
//               return CircularProgressIndicator();
//             }else if (state is ProfileEditFailure) {
//                 return Text('Try again');
//               } else {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Expanded(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           Align(
//                             alignment: const AlignmentDirectional(-1, -1),
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   15, 20, 0, 10),
//                               child: Text('Change Your name:',
//                                   style: Themes.titleButton),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                                 12, 0, 12, 20),
//                             child: ProfileTextFormField(
//                               text: "Name",
//                               onChanged: (value) {
//                                 name = value;
//                                 BlocProvider.of<ProfileEditCubit>(context)
//                                 .editName(name: name);
//                               },
//                               controller: nameController,
//                             ),
//                           ),
//                           Align(
//                             alignment: const AlignmentDirectional(-1, -1),
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   15, 5, 0, 10),
//                               child: Text('Change Your Age:',
//                                   style: Themes.titleButton),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                                 12, 0, 12, 20),
//                             child: ProfileTextFormField(
//                               text: "Age",
//                               onChanged: (value) {
//                                 age = value;
//                                 BlocProvider.of<ProfileEditCubit>(context)
//                                     .editAge(age: age);
//                               },
//                               controller: ageController,
//                             ),
//                           ),
//                           Align(
//                             alignment: const AlignmentDirectional(-1, -1),
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   15, 5, 0, 10),
//                               child: Text('Change Your Phone Number:',
//                                   style: Themes.titleButton),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                                 12, 0, 12, 20),
//                             child: ProfileTextFormField(
//                               text: "Phone Number",
//                               onChanged: (value) {
//                                 phoneNum = value;
//                                 BlocProvider.of<ProfileEditCubit>(context)
//                                     .editPhoneNum(phoneNum: phoneNum);
//                               },
//                               controller: phoneNumController,
//                             ),
//                           ),
//                           Align(
//                             alignment: const AlignmentDirectional(-1, -1),
//                             child: Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   15, 5, 0, 10),
//                               child: Text('Change Your National ID:',
//                                   style: Themes.titleButton),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                                 12, 0, 12, 10),
//                             child: ProfileTextFormField(
//                               text: "National ID",
//                               onChanged: (value) {
//                                 national_id = value;
//                                 BlocProvider.of<ProfileEditCubit>(context)
//                                     .editNationalId(nationalId: national_id);
//                               },
//                               controller: natIDController,
//                             ),
//                           ),
//                           ProfileSaveButton(
//                             text: "Save",
//                             screen: null,
//                             onPressed: () async {
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//
//               }
//             }
//         )
//     );
//   }
// }