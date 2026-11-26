import 'package:factory_method/common/enums/payment_method.dart';
import 'package:material_ui/material_ui.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool _isProcessing = false;

  Future<void> _handlePayment(PaymentMethod method) async {
    setState(() => _isProcessing = true);
    try {} catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Payment failed: ${e.toString()}")),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            ElevatedButton(
              onPressed: _isProcessing
                  ? null
                  : () => _handlePayment(PaymentMethod.creditCard),
              child: Text("Pay with Creadit card"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _isProcessing
                  ? null
                  : () => _handlePayment(PaymentMethod.paypal),
              child: Text("Pay with Paypal"),
            ),
            const SizedBox(height: 12),
            if (Theme.of(context).platform == TargetPlatform.macOS)
              ElevatedButton(
                onPressed: _isProcessing
                    ? null
                    : () => _handlePayment(PaymentMethod.applePay),
                child: Text("Pay with Apple Pay"),
              ),
            if (_isProcessing) ...[
              const SizedBox(height: 20),
              const Center(child: CircularProgressIndicator()),
            ],
          ],
        ),
      ),
    );
  }
}
