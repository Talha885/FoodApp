import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  List txt = [
    "Ali",
    "bilal",
    "dsf",
    "kuu",
  ];
  List txt2 = [
    "dsf",
    "bisdf",
    "huuh",
    "kuhiuh",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('My Orders')),
      ),
      body: ListView.builder(
          itemCount: txt.length,
          // ignore: non_constant_identifier_names
          itemBuilder: (Context, int i) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(25)),
              margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(txt[i]),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            txt2[i],
                            style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Rs.200',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.favorite_outline,
                    size: 28,
                    color: Colors.grey,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
