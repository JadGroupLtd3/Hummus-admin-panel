import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Table(
            columnWidths: const {
              1: IntrinsicColumnWidth(),
            },
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: MyThemeData.light.focusColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                children: [
                  textUtils(title: '#', color: Colors.white).paddingOnly(right: 20),
                  textUtils(title: 'Image', color: Colors.white).paddingOnly(left: 30),
                  textUtils(title: 'deal name', color: Colors.white).paddingOnly(right: 40),
                  Center(child: textUtils(title: 'price', color: Colors.white)),
                  textUtils(title: 'starting date', color: Colors.white),
                  textUtils(title: 'Expiry date', color: Colors.white),
                  textUtils(title: 'Activation status', color: Colors.white),
                  textUtils(title: 'Operations', color: Colors.white).paddingOnly(right: 15),
                ],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Table(
                  columnWidths: const {
                    1: IntrinsicColumnWidth(),
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.black.withOpacity(0.1)),
                          bottom: BorderSide(color: Colors.black.withOpacity(0.1)),
                        ),
                      ),
                      children: [
                        textUtils(title:'#').paddingOnly(right: 20, top: 10, bottom: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SizedBox(
                            width: 36,
                            height: 36,
                            child: Image.asset(
                              Images.background,
                              height: 36,
                              width: 36,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ).paddingOnly(top: 10, bottom: 10,left: 30),
                        textUtils(title: 'deal name').paddingOnly(right: 40,top: 10, bottom: 10),
                        Center(child: textUtils(title: '\$15').paddingOnly(top: 10, bottom: 10)),
                        textUtils(title: '01/06/2024').paddingOnly(top: 10, bottom: 10),
                        textUtils(title: '30/06/2024').paddingOnly(top: 10, bottom: 10),
                        Center(child: textUtils(title: 'Active').paddingOnly(top: 10, bottom: 10)),
                        textUtils(title: 'Operations').paddingOnly(right: 15, top: 10, bottom: 10),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget textUtils({required String title, Color? color}) {
    return Text(
      title,
      style: TajawalRegular.copyWith(fontSize: 14, color: color ?? Colors.black),
    ).paddingSymmetric(vertical: 12);
  }
}

