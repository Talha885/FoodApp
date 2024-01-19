// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodapp/models/mybutton.dart';
import 'package:foodapp/themes/colors.dart';

class BillingAddressScreen extends StatefulWidget {
  const BillingAddressScreen({super.key});

  @override
  State<BillingAddressScreen> createState() => _BillingAddressScreenState();
}

class _BillingAddressScreenState extends State<BillingAddressScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postcodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  bool mIsCheck = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Billing Information",
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  const Text(
                    "Billing Address",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Full Name",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: nameController,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                      ),
                      hintText: "Name",
                      filled: true,
                      fillColor: const Color(0x00f2f2f3),
                      isDense: false,
                      contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                      hintStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16, width: 16),
                  const Text(
                    "Address",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: addressController,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                      ),
                      hintText: "Address",
                      filled: true,
                      fillColor: const Color(0x00f2f2f3),
                      isDense: false,
                      contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                      hintStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16, width: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Text(
                              "City",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(color: Colors.white),
                            ),
                            TextField(
                              controller: cityController,
                              obscureText: false,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                disabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1),
                                ),
                                hintText: "City",
                                filled: true,
                                fillColor: const Color(0x00f2f2f3),
                                isDense: false,
                                contentPadding:
                                    const EdgeInsets.fromLTRB(12, 8, 12, 8),
                                hintStyle: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Text(
                              "Postcode",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(color: Colors.white),
                            ),
                            TextField(
                              controller: postcodeController,
                              obscureText: false,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                disabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1),
                                ),
                                hintText: "#####",
                                filled: true,
                                fillColor: const Color(0x07f2f2f3),
                                isDense: false,
                                contentPadding:
                                    const EdgeInsets.fromLTRB(12, 8, 12, 8),
                                hintStyle: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Country",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: countryController,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                      ),
                      hintText: "Pakistan",
                      filled: true,
                      fillColor: const Color(0x00f2f2f3),
                      isDense: false,
                      contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                      hintStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Shipping Address",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: TextEditingController(),
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                      ),
                      hintText: "Standard Delivery(+.00)",
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: const Color(0x00f2f2f3),
                      isDense: false,
                      contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Theme(
                    data: ThemeData(),
                    child: CheckboxListTile(
                      value: mIsCheck,
                      title: const Text(
                        'Save as default billing address',
                        style: TextStyle(color: Colors.white),
                      ),
                      onChanged: (val) {
                        mIsCheck = !mIsCheck;
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyButton(
                    text: 'Confirm to Checkout',
                    onTap: () {
                      Navigator.pushNamed(context, '/checkoutpage');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  sSAppButton({
    Function? onPressed,
    String? title,
    required BuildContext context,
    Color? color,
    Color? textColor,
  }) {}
}
