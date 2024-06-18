import 'package:flutter/widgets.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomBottomBlocConsumer.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/PaymentMethodListView.dart';

class PaymentBottomSheet extends StatefulWidget {
  const PaymentBottomSheet({super.key, required this.booking});
  final Booking booking;
  @override
  State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  bool isPaypal = false;
  bool isCash = true;

  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
      isCash = true;
    } else if (index == 1) {
      isPaypal = false;
      isCash = false;
    } else if (index == 2) {
      isPaypal = true;
      isCash = false;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PaymentMethodsListView(
              updatePaymentMethod: updatePaymentMethod,
            ),
          ),
          CustomButtonBlocConsumer(
            isPaypal: isPaypal,
            isCash: isCash,
            booking: widget.booking,
          ),
        ],
      ),
    );
  }
}
