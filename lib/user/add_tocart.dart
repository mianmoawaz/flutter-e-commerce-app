import 'package:flutter/material.dart';
import 'package:flutter_e_commece_app/user/address.dart';
import 'package:flutter_e_commece_app/widgets/button/common_button.dart';
import 'package:get/get.dart';

class AddTocart extends StatefulWidget {
  const AddTocart({super.key});

  @override
  State<AddTocart> createState() => _AddTocartState();
}

class _AddTocartState extends State<AddTocart> {
  List<int> quantities = [];

  @override
  void initState() {
    super.initState();
    int itemCount = 7;
    quantities = List.generate(itemCount, (index) => 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 10),
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 30,
              ),
            ),
          ),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '  Order reviews',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('     ${quantities.length} items in cart'),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: quantities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.inventory_2_outlined,
                        size: 30, color: Colors.grey),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amet nunc, tincidunt',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'interdum rhoncus massa',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (quantities[index] > 1) quantities[index]--;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                '-',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          quantities[index].toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 12),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              quantities[index]++;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                '+',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            quantities.removeAt(index);
                          });
                        },
                        child: Icon(Icons.close, size: 18, color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '\$245.78',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ComonButton(
              title: 'Next',
              onTap: () {
                Get.to(Address());
              }),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
