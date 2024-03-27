import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Features/Beginning/FormStaff/presentation/Manager/staff_request_cubit.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/LoginScreen.dart';
import '../../../../../GlobalWidgets/CustomAlignText.dart';
import '../../../../../GlobalWidgets/CustomSignUpLogin.dart';
import '../../../../../GlobalWidgets/CustomTextFormField.dart';
import '../../../../../GlobalWidgets/CustomTextFormField2.dart';
import '../../../../../GlobalWidgets/LogoContainer.dart';
import '../../../../../GlobalWidgets/StartingCont.dart';
import '../../../../../GlobalWidgets/titleText.dart';

class FormStaff extends StatefulWidget {
  FormStaff({Key? key}) : super(key: key);

  @override
  _FormStaffState createState() => _FormStaffState();


}

class _FormStaffState extends State<FormStaff> {
  List<String> dropdownItems = ["Please select...",'Hospital Staff', 'Lab Staff', 'System Admin'];
  List<String> dropdownItems2 = ["Organization type",'Hospitals',
    'Clinics',
    'Medical Schools',
    'Research Institutions',
    'Pharmaceutical Companies',
    'Health Insurance Companies',
    'Nonprofit Organizations',
    'Government Agencies',
  ];
  void initState() {
    super.initState();
    staff = dropdownItems[selectedIndex];
    orgType = dropdownItems2[selectedIndex2];
  }
  int selectedIndex = 0;
  int selectedIndex2 = 0;
  bool isLoading=false;
  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController orgNameController = TextEditingController();
  final TextEditingController locController = TextEditingController();
  final TextEditingController licNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? email;
  String? orgName;
  String? loc;
  String? orgType;
  String? staff;
  String? licNo;

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<StaffRequestCubit, StaffRequestState>(
        listener: (context, state) {
          if(state is StaffRequestLoading){
            isLoading=true;
          }
          else if(state is StaffRequestSuccess){
            isLoading=false;
          }else if(state is StaffRequestFailure)
          {
            showSnackbar(context, state.errMsg);
            isLoading=false;
          }
        },
        builder: (context, state) {
          return
            Form(
              key: formKey,
              child: Scaffold(
                body: Stack(
                  children: [
                    startingCont(),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 74,
                              ),
                              Padding(
                                padding: EdgeInsets.all(30),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 70,
                                    ),
                                    LogoCont(),
                                    titleText(text: "Form Staff Request"),
                                    SizedBox(
                                      height: 40,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          AlignText(
                            text: "Choose Type Of Staff",
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: CustomTextFormField2(
                              selectedIndex: selectedIndex,
                              items: dropdownItems,
                              value: staff,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedIndex = dropdownItems.indexOf(newValue!);
                                  staff = newValue;
                                });
                              },
                            ),
                          ),
                          AlignText(text: "Please Enter Required Data"),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: CustomTextFormField(
                              TextEditingController: orgNameController,
                              text: "Organization Name",
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: CustomTextFormField2(
                              selectedIndex: selectedIndex2,
                              items: dropdownItems2,
                              value: orgType,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedIndex2 = dropdownItems2.indexOf(newValue!);
                                  orgType = newValue;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: CustomTextFormField(
                              TextEditingController: licNoController,
                              text: "License Number",
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: CustomTextFormField(
                              TextEditingController: locController,
                              text: "Detailed Location",
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: CustomTextFormField(
                              TextEditingController: emailController,
                              text: "Email",
                            ),
                          ),
                          CustomSignUpLogin(
                              text: "Request",
                              onTap: () async {
                                email = emailController.text.trim();
                                staff=dropdownItems[selectedIndex];
                                orgName = orgNameController.text.trim();
                                loc = locController.text.trim();
                                orgType=dropdownItems2[selectedIndex2];
                                licNo = licNoController.text.trim();

                                if (formKey.currentState!.validate()&& selectedIndex2!=0 && selectedIndex!=0) {
                                  BlocProvider.of<StaffRequestCubit>(context)
                                      .sendRequest(
                                    staff: staff!,
                                    orgName: orgName!,
                                    orgType: orgType!,
                                    licNo: licNo!,
                                    loc: loc!,
                                    email: email!,
                                  );
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                }
                                else{
                                  showSnackbar(context, "choose a valid option");
                                }
                              }
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
        },
      );
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
