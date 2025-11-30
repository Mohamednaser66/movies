import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/core/assets_manger.dart';

import '../../../../core/colors_manger.dart';
import '../../tabs/profile/presentation/profile_cubit/profile_cubit.dart';

class FavButton extends StatefulWidget {
  const FavButton({
    super.key,
    required this.onClick,
    required this.isFav,
  });

  final VoidCallback onClick;
  final bool isFav;

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  bool isClicked = false;

  @override
  void initState() {
    isClicked = widget.isFav;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is EditFavSuccess) {
          setState(() {
            isClicked = !isClicked;
          });

          showDialog(
            context: context,
            builder: (_) {
              Future.delayed(Duration(seconds: 1), () => Navigator.pop(context));
              return AlertDialog(content: Text("Successful"));
            },
          );
        }

        if (state is EditFavError) {
          showDialog(
            context: context,
            builder: (_) {
              Future.delayed(Duration(seconds: 1), () => Navigator.pop(context));
              return CupertinoAlertDialog(content: Text(state.message));
            },
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is EditFavLoading;

        return IconButton(
          onPressed: isLoading
              ? null
              : () {
            widget.onClick();
          },
          icon: isLoading
              ? SizedBox(
            height: 22,
            width: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: ColorsManger.white,
            ),
          )
              : SvgPicture.asset(
            SvgManger.watchIcon,
            color: isClicked
                ? ColorsManger.yellow
                : ColorsManger.white,
          ),
        );
      },
    );
  }
}
