import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';

class ElementAndHashtagSelect extends StatefulWidget {
  const ElementAndHashtagSelect({super.key});

  @override
  _ElementAndHashtagSelectState createState() => _ElementAndHashtagSelectState();
}

class _ElementAndHashtagSelectState extends State<ElementAndHashtagSelect> {
  final List<bool> _selectedElements = [true, false];
  final List<bool> _selectedHashtags = [true, false, false];

  void _toggleElementSelection(int index) {
    setState(() {
      _selectedElements[index] = !_selectedElements[index];
    });
  }

  void _toggleHashtagSelection(int index) {
    setState(() {
      _selectedHashtags[index] = !_selectedHashtags[index];
    });
  }

  void _selectAllElements() {
    setState(() {
      for (int i = 0; i < _selectedElements.length; i++) {
        _selectedElements[i] = true;
      }
    });
  }

  void _deselectAllElements() {
    setState(() {
      for (int i = 0; i < _selectedElements.length; i++) {
        _selectedElements[i] = false;
      }
    });
  }

  void _selectAllHashtags() {
    setState(() {
      for (int i = 0; i < _selectedHashtags.length; i++) {
        _selectedHashtags[i] = true;
      }
    });
  }

  void _deselectAllHashtags() {
    setState(() {
      for (int i = 0; i < _selectedHashtags.length; i++) {
        _selectedHashtags[i] = false;
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
                  'Appearing in the home page'.tr,
                  style: TajawalBold.copyWith(
                    fontSize: 14,
                    color: MyThemeData.light.focusColor,
                  ),
                ).paddingOnly(top: 5),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => _toggleElementSelection(0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: _selectedElements[0]
                            ? MyThemeData.light.primaryColor
                            : MyThemeData.light.hoverColor,
                        child: _selectedElements[0]
                            ? const Center(child: Icon(Icons.check, color: Colors.white, size: 13))
                            : null,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Featured Meals'.tr,
                        style: TajawalRegular.copyWith(
                          fontSize: 14,
                        ),
                      ).paddingOnly(top: 5),
                    ],
                  ),
                ),
                const SizedBox(width: 50),
                GestureDetector(
                  onTap: () => _toggleElementSelection(1),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: _selectedElements[1]
                            ? MyThemeData.light.primaryColor
                            : MyThemeData.light.hoverColor,
                        child: _selectedElements[1]
                            ? const Center(child: Icon(Icons.check, color: Colors.white, size: 13))
                            : null,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Popular Meals'.tr,
                        style: TajawalRegular.copyWith(
                          fontSize: 14,
                        ),
                      ).paddingOnly(top: 5),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 30),
        Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  Images.hashtag,
                  height: 20,
                  width: 20,
                  color: MyThemeData.light.focusColor,
                ),
                const SizedBox(width: 4),
                Text(
                  'Hashtags'.tr,
                  style: TajawalBold.copyWith(
                    fontSize: 14,
                    color: MyThemeData.light.focusColor,
                  ),
                ).paddingOnly(top: 5),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => _toggleHashtagSelection(0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: _selectedHashtags[0]
                            ? MyThemeData.light.primaryColor
                            : MyThemeData.light.hoverColor,
                        child: _selectedHashtags[0]
                            ? const Center(child: Icon(Icons.check, color: Colors.white, size: 13))
                            : null,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'vegetarian'.tr,
                        style: TajawalRegular.copyWith(
                          fontSize: 14,
                        ),
                      ).paddingOnly(top: 5),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                GestureDetector(
                  onTap: () => _toggleHashtagSelection(1),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: _selectedHashtags[1]
                            ? MyThemeData.light.primaryColor
                            : MyThemeData.light.hoverColor,
                        child: _selectedHashtags[1]
                            ? const Center(child: Icon(Icons.check, color: Colors.white, size: 13))
                            : null,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Without gluten'.tr,
                        style: TajawalRegular.copyWith(
                          fontSize: 14,
                        ),
                      ).paddingOnly(top: 5),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                GestureDetector(
                  onTap: () => _toggleHashtagSelection(2),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: _selectedHashtags[2]
                            ? MyThemeData.light.primaryColor
                            : MyThemeData.light.hoverColor,
                        child: _selectedHashtags[2]
                            ? const Center(child: Icon(Icons.check, color: Colors.white, size: 13))
                            : null,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Cholesterol free'.tr,
                        style: TajawalRegular.copyWith(
                          fontSize: 14,
                        ),
                      ).paddingOnly(top: 5),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
