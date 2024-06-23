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
        return const Icon(
          Icons.add_a_photo_outlined,
          size: 35,
        );
      },
    );
  }
}
