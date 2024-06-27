import 'package:flutter_svg/flutter_svg.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/widgets/on_hover.dart';
import 'package:flutter/material.dart';

class AddPhotoWidget extends StatelessWidget {
  final double? vertical;
  final bool isEdit;
  final double? width;

  const AddPhotoWidget({super.key, this.isEdit = false, this.vertical, this.width});

  @override
  Widget build(BuildContext context) {
    return OnHover(
      matrix: 0,
      builder: (isHovered) {
        return SvgPicture.asset(
          Images.add_photo,
        );
      },
    );
  }
}
