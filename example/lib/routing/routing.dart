import 'package:boring_app/boring_app.dart';
import 'package:boring_app/boring_drawer_style.dart';
import 'package:boring_app/boring_drawer_tile_style.dart';

import 'package:flutter/material.dart';

import '../screen/loginPage.dart';
import '../screen/mainScreen.dart';
import '../services/loginAuth.dart';

class Routing {
  static BoringSection loginSection = BoringSection(
    path: '/login',
    children: [
      BoringPage(
        path: '',
        builder: (p0, p1) {
          return LoginPage();
        },
      ),
    ],
  );

  static BoringSection mainSection = BoringSection(
    defaultPath: "",
    drawerStlye: BoringDrawerStlye(
      padding: const EdgeInsets.symmetric(vertical: 100),
      backgroundColor: Colors.green,
      drawerRadius: BorderRadius.circular(50),
    ),
    defaultDrawerTileStyle: BoringDrawerTileStyle(
        tileRadius: BorderRadius.circular(5),
        selectedColor: Colors.red,
        selectedTextColor: Colors.amber,
        unSelectedTextColor: Colors.purple),
    drawerHeaderBuilder: (context) {
      return const FlutterLogo();
    },
    drawerFooterBuilder: (context) {
      return const FlutterLogo();
    },
    children: [
      BoringPage(
        path: '',
        icon: Icon(
          Icons.home,
        ),
        drawerLabel: "Main",
        builder: (p0, p1) {
          return MainScreen();
        },
        redirect: (p0, p1) {
          if (LoginAuth.isUserLoggedIn) {
            return "/";
          }
          return '/login';
        },
        subPages: [
          BoringPage(path: '/details'),
        ],
      ),
      BoringPage(
        path: 'product',
        icon: Icon(
          Icons.shopping_cart_checkout,
        ),
        drawerLabel: "Product",
        builder: (p0, p1) {
          return const Scaffold(
            body: Center(
              child: Text("ASDASD"),
            ),
          );
        },
      ),
    ],
  );

  static List<BoringSection> sections = [loginSection, mainSection];
}
