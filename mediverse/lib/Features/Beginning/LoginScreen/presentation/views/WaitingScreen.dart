import 'package:flutter/material.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/LoginScreen.dart';

class WaitingForApprovalScreen extends StatelessWidget {
  const WaitingForApprovalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            isLoading = false;
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
                (Route<dynamic> route) => false);
          },
        ),
        title: Text('Waiting for Approval'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your request is pending approval from the system administrator.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
