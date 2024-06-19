import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/AllModels/admin.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/LoginScreen.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/presentation/Manager/FetechAdminInfoCubit.dart/fetech_admin_info_cubit.dart';
import 'package:mediverse/Features/StaffDashboard/AdminProfileScreen/presentation/views/AdminProfileScreen.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/NetworkImage.dart';

class AppBarAdminPage extends StatelessWidget {
  const AppBarAdminPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Admins") //to be change Patient Profile
            .doc("PrBUlYMk5Hh8D6CqGItcrodaVxo2")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(), // Show a loading indicator
            );
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(
              child: Text('No LabStaff available'),
            );
          }
          Admin admin =
              Admin.fromJson(snapshot.data!.data() as Map<String, dynamic>);

          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminProfileScreen(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 10),
                  child: Container(
                    width: 53,
                    height: 53,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      width: 50,
                      height: 50,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: CachedNetworkImageLarge(
                          imageUrl: admin.imageUrl,
                          sizeOfPlaceHolder: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Center vertically
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      admin.name,
                      style:
                          const TextStyle(fontSize: 20, color: kThirdTextColor),
                    ),
                    Text(
                      admin.email,
                      style: const TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 16,
                        color: kThirdTextColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
              ),
              // GestureDetector(
              //   child: Icon(color: Colors.white, Icons.logout),
              //   onTap: () {
              //     AwesomeDialog(
              //       context: context,
              //       dialogType: DialogType.warning,
              //       animType: AnimType.rightSlide,
              //       //title: 'Error',
              //       title: 'Are you sure you want to Logout?',
              //       titleTextStyle:
              //           TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              //       btnOkOnPress: () {
              //         Navigator.pop(context);
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => LoginScreen(),
              //             ));
              //       },
              //       btnCancelOnPress: () {
              //         //Navigator.pop(context);
              //       },
              //     ).show();
              //   },
              // ),
            ],
          );
        });
  }
}
