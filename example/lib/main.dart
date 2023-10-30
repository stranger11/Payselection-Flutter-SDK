import 'package:flutter/material.dart';
import 'package:payselection_sdk/payselection.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'PaySelection-Flutter-SDK'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final uuid = const Uuid();
  late PaySelection config;

  @override
  void initState() {
    super.initState();
    _pay();
  }

  Future<void> _pay() async {
    config = PaySelection(
        publicKey:
        '04bd07d3547bd1f90ddbd985feaaec59420cabd082ff5215f34fd1c89c5d8562e8f5e97a5df87d7c99bc6f16a946319f61f9eb3ef7cf355d62469edb96c8bea09e',
        //    '04bd07d3547bd1f90ddbd985deaaec59420cabd082ff5215f34fd1c89c5d8562e8f5e97a5df87d7c99bc6f16a946319f61f9eb3ef7cf355d62469edb96c8bea09e',
        //bad key
        xSiteId: '21044',
        xRequestId: uuid.v4(),
        isDebug: true);

    final int expiration = const Duration(days: 1).inMilliseconds;
    int messageExpiration =
        (DateTime.now().millisecondsSinceEpoch + expiration);

    var request = PublicPayRequest(
        orderId: "SAM_SDK_3",
        description: "test payment",
        paymentData: PaymentData(
            transactionDetails:
                TransactionDetails(amount: "10", currency: "RUB"),
            cardDetails: CardDetails(
                cardHolderName: "TEST CARD",
                cardNumber: "5260111696757102",
                //success card
                //    cardNumber: '2408684917843810',     //fail card
                cvc: "123",
                expMonth: "12",
                expYear: "24"),
            messageExpiration: messageExpiration,
            paymentMethod: 'Card'),
        customerInfo: CustomerInfo(
            email: "user@example.com",
            phone: "+19991231212",
            language: "en",
            address: "string",
            town: "string",
            zip: "string",
            country: "USA",
            isSendReceipt: false,
            receiptEmail: 'paaa@mail.ru',
            ip: '8.8.8.8'),
        rebillFlag: false);

    final response = await config.pay(request);

    final redirectUrl = response.data?.redirectUrl;
    if (redirectUrl != null) {
      if (context.mounted) {
        await WebViewHelper.openWebView(context, redirectUrl).then(
            (value) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(value == true
                        ? 'Succes transaction'
                        : 'Fail transaction'))));
      }
    }

    print(response.data?.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: FlutterLogo(
          size: 100,
        ),
      ),
    );
  }
}
