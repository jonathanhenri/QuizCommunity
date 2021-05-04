import 'package:quizcommunity/core/app_colors.dart';
import 'package:quizcommunity/core/app_text_styles.dart';
import 'package:quizcommunity/shared/models/awnser_model.dart';
import 'package:flutter/material.dart';

class AwanserWidget extends StatelessWidget {
  final AwnserModel awnserModel;
  final bool isSelect;
  final ValueChanged<bool> onTap;
  final bool disabled;

  AwanserWidget(
      {required this.awnserModel, this.isSelect = false, required this.onTap, this.disabled = false,});

  Color get _selectedColorRight =>
      awnserModel.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      awnserModel.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      awnserModel.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      awnserModel.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      awnserModel.isRight
          ? AppTextStyles.bodyDarkGreen
          : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight =>
      awnserModel.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: () {
            onTap(awnserModel.isRight);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelect ? _selectedColorCardRight : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(
                BorderSide(
                  color: isSelect ? _selectedBorderCardRight : AppColors.border,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    awnserModel.title,
                    style:
                    isSelect ? _selectedTextStyleRight : AppTextStyles.body,
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  child: isSelect
                      ? Icon(
                    _selectedIconRight,
                    size: 16,
                    color: AppColors.white,
                  )
                      : null,
                  decoration: BoxDecoration(
                    color: isSelect ? _selectedColorRight : AppColors.white,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: isSelect ? _selectedBorderRight : AppColors
                            .border,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
