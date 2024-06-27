import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';

class AttributesSelect extends StatefulWidget {
  const AttributesSelect({super.key});

  @override
  _AttributesSelectState createState() => _AttributesSelectState();
}

class _AttributesSelectState extends State<AttributesSelect> {
  final List<bool> _selectedAttributes = List.filled(5, false);

  void _toggleSelection(int index) {
    setState(() {
      _selectedAttributes[index] = !_selectedAttributes[index];
    });
  }

  void _selectAll() {
    setState(() {
      for (int i = 0; i < _selectedAttributes.length; i++) {
        _selectedAttributes[i] = true;
      }
    });
  }

  void _deselectAll() {
    setState(() {
      for (int i = 0; i < _selectedAttributes.length; i++) {
        _selectedAttributes[i] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  Images.Elements,
                  height: 20,
                  width: 20,
                  color: MyThemeData.light.focusColor,
                ),
                const SizedBox(width: 4),
                Text(
                  'Attributes'.tr,
                  style: TajawalBold.copyWith(
                    fontSize: 14,
                    color: MyThemeData.light.focusColor,
                  ),
                ).paddingOnly(top: 5),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _selectAll,
                  child: Text('Select All'.tr),
                ),
                TextButton(
                  onPressed: _deselectAll,
                  child: Text('Deselect All'.tr),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2.8,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemCount: _selectedAttributes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _toggleSelection(index),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: _selectedAttributes[index]
                              ? MyThemeData.light.primaryColor
                              : Colors.grey,
                          child: Center(
                            child: _selectedAttributes[index]
                                ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 13,
                            )
                                : null,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'attribute name $index'.tr,
                          style: TajawalRegular.copyWith(
                            fontSize: 14,
                          ),
                        ).paddingOnly(top: 5),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
