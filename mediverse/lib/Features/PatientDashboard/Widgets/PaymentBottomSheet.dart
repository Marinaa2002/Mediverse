import 'package:flutter/widgets.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/ConfirmButton.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomBottomBlocConsumer.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/PaymentMethodListView.dart';

class PaymentBottomSheet extends StatelessWidget {
  const PaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: PaymentMethodsListView(),
          ),
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}
