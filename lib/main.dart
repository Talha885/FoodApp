import 'package:flutter/material.dart';
import 'package:foodapp/drawer/orders.dart';
import 'package:foodapp/screens/PaymentCompleted.dart';
import 'package:foodapp/screens/billingpage.dart';
import 'package:foodapp/screens/cart.dart';
import 'package:foodapp/screens/checkoutPage.dart';
import 'package:foodapp/screens/homepage.dart';
import 'package:foodapp/models/shop.dart';
import 'package:foodapp/screens/login.dart';
import 'package:foodapp/screens/register.dart';
import 'package:foodapp/screens/splash.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Shop()),
        // Add more providers if needed
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryIconTheme: const IconThemeData(color: Colors.red),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/cartpage': (context) => const CartPage(),
        '/billingpage': (context) => const BillingAddressScreen(),
        '/checkoutpage': (context) => const CheckoutScreen(),
        '/paymentcomplete': (context) => const PaymentCompleted(),
        '/myorders': (context) => const MyOrders(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}
