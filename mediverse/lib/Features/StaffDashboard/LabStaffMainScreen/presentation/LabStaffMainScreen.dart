import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Functions.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreenAddDoctors/presentation/Manager/FetechHospitalMangementCubit/fetech_HM_info_cubit.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/ListViewPatient.dart';

import '../../../Beginning/LoginScreen/presentation/views/LoginScreen.dart';

class LabStaffScreen extends StatelessWidget {
  LabStaffScreen({super.key});
  String id = '';
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (args != null) {
      id = args['id'];
    }
    BlocProvider.of<FetecHMInfoCubit>(context).getHMInforCubitFunction(id);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: // Generated code for this AppBar Widget...
          AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Alpha Lab',
                  style: Themes.headlineSmall,
                ),
              ),
            ),
            GestureDetector(
              child: Icon(color: Colors.white,Icons.logout),
              onTap: (){
                AwesomeDialog(context: context,
                  dialogType: DialogType.warning,
                  animType: AnimType.rightSlide,
                  //title: 'Error',
                  title: 'Are you sure you want to Logout?',
                  titleTextStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                  btnOkOnPress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  },
                  btnCancelOnPress: () {
                    //Navigator.pop(context);
                  },
                ).show();
              },
            ),
          ],
        ),

        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                child: Text('Patients List',
                    style: Themes.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    )),
              ),
              const Expanded(
                child: ListViewPatient(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, bottom: 20),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.add,
                    ),
                    onPressed: () async {
                      final national_id = await showTextFieldDialog(context,
                          textEditingController: textEditingController,
                          title: "Add Patient 's national id",
                          hintText: 'National id');
                      var id = '';
                      textEditingController.clear();
                      if (national_id != null) {
                        try {
                          QuerySnapshot snapshot = await FirebaseFirestore
                              .instance
                              .collection('info_Patients')
                              .where('NationalId', isEqualTo: national_id)
                              .get();

                          if (snapshot.docs.isNotEmpty) {
                            id = snapshot.docs.first.id;
                          } else {
                            showSnackBar(context,
                                "No Patient With this national id"); // Handle case when no document is found
                          }

                          // Update the array in Firestore using arrayUnion
                          await FirebaseFirestore.instance
                              .collection('Staff')
                              .doc(globalcurrentUserId)
                              .update({
                            'Jobs': FieldValue.arrayUnion([id]),
                          });
                          print('National ID added to the array successfully');
                        } catch (error) {
                          print(
                              'Error adding National ID to the array: $error');
                        }
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
