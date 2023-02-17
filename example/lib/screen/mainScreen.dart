import 'package:boring_app/boring_app.dart';
import 'package:boring_form/boring_form.dart';
import 'package:boring_form/implementations/table/boring_table_field_row.dart';

import 'package:flutter/material.dart';
import 'package:boring_table/boring_table.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/prod.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Product> products = [
    Product(
        id: '1',
        name: 'Primo Item',
        quantity: 3,
        dateAddedToTheStock: DateTime(2022, 10, 13)),
    Product(
        id: '2',
        name: 'Secondo Item',
        quantity: 6,
        dateAddedToTheStock: DateTime(2023, 1, 23)),
    Product(
        id: '3',
        name: 'Terzo Item',
        quantity: 1,
        dateAddedToTheStock: DateTime(2010, 1, 1))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BoringTable(
            widgetWhenEmpty: Text('Table is empty'),
            onTap: (p0) {
              context.go('/details');
            },
            headerRow: [
              TableHeaderElement(label: 'ID', flex: 1),
              TableHeaderElement(label: 'Name', flex: 4),
              TableHeaderElement(label: 'Quantity', flex: 1),
              TableHeaderElement(label: 'Date Added', flex: 3),
            ],
            rowActions: [
              BoringRowAction(
                onTap: (val) {
                  setState(() {
                    products.removeAt(val);
                  });
                },
                icon: Icon(Icons.delete),
              ),
            ],
            rowBuilder: (context, index) {
              print(products[index].name);
              return [
                Text('${products[index].id}'),
                Text('${products[index].name}'),
                Text('${products[index].quantity}'),
                Text(
                    '${products[index].dateAddedToTheStock.toIso8601String()}'),
              ];
            },
            rowCount: products.length),
      ),
    );
  }
}
