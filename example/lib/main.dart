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
  late PaySelectionSDK config;

  @override
  void initState() {
    super.initState();

    _pay().proceedResult((responseData) {
      showDialog(
          context: context,
          builder: (builder) => ThreeDS(
                url: responseData.redirectUrl ?? '',
              )).then((value) => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(
              content: Text(value == true
                  ? 'Success transaction'
                  : 'Fail transaction'))));



      //for check transaction status use config.transactionStatus

      // config.transactionStatus(TransactionStatusRequest(
      //     transactionId: responseData.transactionId ?? "",
      //     transactionSecretKey:
      //         responseData.transactionSecretKey ?? ""));


    },
        (errorCode) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(errorCode))));
  }

  Future<BaseResponse<PublicPayResponse>> _pay() async {
    config = PaySelectionSDK(PaySelectionConfig.credential(
        publicKey:
            '04bd07d3547bd1f90ddbd985feaaec59420cabd082ff5215f34fd1c89c5d8562e8f5e97a5df87d7c99bc6f16a946319f61f9eb3ef7cf355d62469edb96c8bea09e',
        // '04bd07d3547bd1f90ddbd985deaaec59420cabd082ff5215f34fd1c89c5d8562e8f5e97a5df87d7c99bc6f16a946319f61f9eb3ef7cf355d62469edb96c8bea09e',
        //bad key
        xSiteId: '21044',
        xRequestId: uuid.v4(),
        isDebug: true));

    var request = PublicPayRequest(
      orderId: "SAM_SDK_3",
      description: "test payment",
      paymentMethod: PaymentMethod.token,
      payToken:
          'eyJ0eXBlIjoiWWFuZGV4Iiwic2lnbmVkTWVzc2FnZSI6IntcImVuY3J5cHRlZE1lc3NhZ2VcIjpcImJHWDA3N2N5QTRXTXlFVnZCaDBNMEp2bnBUWk9UYUlxaDlxWHdNcmRxaTBtVXo4Q29UODdHUzZqWVZFd2NlRjhVMlZYSHJwY0RYRGcxc2o4NHJvRjEyeWgzQ2tyMUhmTmJxSFpNSm4vZExWREZvSGlqVWN3Sm9hNWZwbUNrNEIva0dwbFUyL0YxdTNGYjBxSG5zZERWWVpJMy85eG0vYkI0dXZaM09YNmZkNG5iQ1BVZ0NGbnlzSjRWKzZXK3gvVDhxUEs3RFhLVDFOYUtlTzIweWNya0NsWVJRL3Ircm1EcmxzS3llM0IrbWh4a1d0ZGY3WHgzOUQvSlZKUnFCZThUMkJyTzlzSmFBblhtangwZ0lKdkg0QThMWmUxaWFhWlRBS0pmTGtGb2RvOGJsalVJTVozTjVXSUV6RjYxT0dINHAwOG1ORjR5VUpGV2JaTmE4bXV6cTRTUzNhOTVwNlQrOHJLV0NmWmhqa0dHaE5qZG9ETElBM1RtcmdhRWxqQ281M0lCVC93UTBtcStEUzdXbUk0R00vb1Q4TkFGa3F0OE02c3RVZ2ZxK2hLSkY2S2VjRFVKcDRRMTdTdTJRcmpqTXR6NHNMV0x5NlBLM0JMR1drRGhjUlNFc0IraWt5TjdEeUdrSGt5T2YyQmF1N21uakp6WUdCZWg4T3VOUWJyRllNbEZ5R1dzd3VmQ2JUSnJjUWNzS1ArcmpWTExNWDgzbTlHcGViWDh6eG5kUy9XVVRMcEFkbkIvN3pMeEtRUExuOVdPemtRREE9PVwiLFwidGFnXCI6XCJVaVlqMVdaS3FlTnVsNHpKK2NSNG4yWi8wbUpuaUxPTTU1YllIejV6eGNrPVwiLFwiZXBoZW1lcmFsUHVibGljS2V5XCI6XCJCTHp5WStRSTlzdzYvbXZ5ajdmV2NyQlh4WXE3ZHFyUkNJQUxJdTA5QitRbGp4NHlSOVdqU3Z3YjF3TGd1RjJvU1BnZThPYW93UEdhSkh1bkFUSVY4WFE9XCJ9IiwicHJvdG9jb2xWZXJzaW9uIjoiRUN2MiIsInNpZ25hdHVyZSI6Ik1FVUNJRVhLQldqSzVxaSs1R3E2cEZxaXk5Z2Z5R09GNndRMDhSVlhsUFczblJTN0FpRUEyalM3cmc4TGZaU25JYU1OQm1CbVJ3ZE9xNlZZZVo0R3dCQWhGaHVJT3dvPSIsImludGVybWVkaWF0ZVNpZ25pbmdLZXkiOnsic2lnbmVkS2V5Ijoie1wia2V5VmFsdWVcIjpcIk1Ga3dFd1lIS29aSXpqMENBUVlJS29aSXpqMERBUWNEUWdBRW9WY29NbHFvWVBvK2MreUFlNFJFNHh4emZLQ1pIY0JRdFZKaEJWWGpCa2k0WHhDS3lza3BJbjJmM0xpQWtCVWF4Z2FyZmpUem0wM3NSY043TndzRVpRPT1cIixcImtleUV4cGlyYXRpb25cIjpcIjE3NjU3MDQwNDUwMDBcIn0iLCJzaWduYXR1cmVzIjpbIk1FVUNJUUMrbXFVVmVsaTBTY1kzVVZvOWNFaFluVDBpd3k5ZjNGMStkMXVxQ0dJL3RnSWdENHZPaFN6SFUyM1EwWXJoc05DTkp2bTF1TkRvZjJkT05aWDJ4ekRaNkU0PSJdfX0=',
      amount: '10',
      currency: 'RUB',
      // cardDetails:  CardDetails(
      //     cardHolderName: "TEST CARD",
      //     cardNumber: "5260111696757102",
      //     //success card
      //     //     cardNumber: '2408684917843810',     //fail card
      //     cvc: "123",
      //     expMonth: "12",
      //     expYear: "24"),
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
      rebillFlag: false,
    );

    final response = await config.pay(request);

    return response;
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
