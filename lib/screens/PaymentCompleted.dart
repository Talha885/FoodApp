import 'package:flutter/material.dart';
import 'package:foodapp/screens/homepage.dart';
import 'package:foodapp/themes/colors.dart';

class PaymentCompleted extends StatefulWidget {
  const PaymentCompleted({Key? key}) : super(key: key);

  @override
  State<PaymentCompleted> createState() => _PaymentCompletedState();
}

class _PaymentCompletedState extends State<PaymentCompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 1000,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(30, 63, 0, 0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryColor,
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/box.png',
                            height: 100,
                            width: 100,
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(43, 0, 72.89, 41),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 7),
                                  child: const Text(
                                    'Payment Completed!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700,
                                      height: 1.2,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 225,
                                  ),
                                  child: const Text(
                                    'Your payment has been accepted successfully.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                      color: Color(0xffe3effd),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ));
                            },
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(
                                  0, 0, 30.89, 160.42),
                              width: 331,
                              height: 56,
                              decoration: BoxDecoration(
                                color: const Color(0xff242c38),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Text(
                                  'Thanks For Shopping',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
