import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/authentication/data/models/avater_data_model.dart';
import 'package:movie/core/colors_manger.dart';
import 'package:movie/core/routes_manger.dart';
import 'package:movie/core/widget/custom_text_form_filed.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/EditeProfileRequest.dart';
import 'package:movie/presentation/main_layout/tabs/profile/domain/entity/profile_entity.dart';
import 'package:movie/presentation/main_layout/tabs/profile/presentation/profile_cubit/profile_cubit.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  initData() {
    nameController.text = argument?.name ?? '';
    phoneController.text = argument?.phone ?? '';
    emailController.text = argument?.email ?? '';
    currentAvatarId = argument?.avaterId ?? 0;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      argument = ModalRoute
          .of(context)
          ?.settings
          .arguments as ProfileEntity;
      initData();
      _isInitialized = true;
    }
  }

  late ProfileEntity? argument;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late int currentAvatarId;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Pick Avatar",
          style: Theme
              .of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontSize: 16.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: REdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: ColorsManger.grey,
                    context: context, builder: (context) {
                    return GridView.builder(
                      padding: REdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8),
                      itemCount: AvaterDataModel.avaters.length,
                      itemBuilder: (context, index) {
                        bool isSelected = currentAvatarId == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              currentAvatarId = index;
                              Navigator.pop(context);
                            });
                          },
                          child: Container(decoration: BoxDecoration(
                              color: isSelected ? ColorsManger.yellow : Colors
                                  .transparent,
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                  color: ColorsManger.yellow, width: 1.w)),
                            child: Image.asset(
                                AvaterDataModel.avaters[index].image),
                          ),
                        );
                      },);
                  },);
                },
                child: Image.asset(
                    AvaterDataModel.avaters[currentAvatarId].image)),
            SizedBox(
              height: 20.h,
            ),
            CustomTextFormFiled(
              title: nameController.text,
              prefixIcon: Icon(Icons.person),
              controller: nameController,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextFormFiled(
              title: phoneController.text,
              prefixIcon: Icon(Icons.phone),
              controller: phoneController,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextFormFiled(
              title: emailController.text,
              prefixIcon: Icon(Icons.email),
              controller: emailController,
            ),


            SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesManger.resetPassword,arguments: argument);
                },
                child: Text(
                  'Reset Password',
                )),
            Spacer(),
            BlocListener<ProfileCubit, ProfileState>(


                listener: (context, state) {
                  if (state is DeleteProfileSuccessState) {
                    showDialog(context: context,
                      builder: (context) =>
                          CupertinoAlertDialog(title: Text('Successfully'),),);
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.pop(context);
                    },);
                  }
                  if (state is DeleteProfileErrorState) {
                    showDialog(context: context,
                      builder: (context) =>
                          CupertinoAlertDialog(title: Text(state.message),),);
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.pop(context);
                    },)
                  ;
                  }

                },
              child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManger.red,
                  foregroundColor: ColorsManger.dark
                ),
                  onPressed: () {
                    context.read<ProfileCubit>().deleteProfile(context);
                  },
                  child: Text('Delete Account')),
            )
    ),
            SizedBox(height: 10.h,),
            BlocListener<ProfileCubit, ProfileState>(
              listener: (context, state) {


                if (state is EditeProfileSuccessState) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.of(context).pop(); // close dialog
                      });

                      return CupertinoAlertDialog(
                        title: Text("Profile Updated Successfully"),
                      );
                    },
                  );
                }
                if (state is EditeProfileErrorState) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.of(context).pop(); // close dialog
                      });

                      return CupertinoAlertDialog(
                        title: Text(state.message),
                      );
                    },
                  );
                }
              },
              child:
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: ColorsManger.yellow,
                  foregroundColor: ColorsManger.dark),
                    onPressed: () {
                  context.read<ProfileCubit>().editeProfile(EditeProfileRequest(
                      name: nameController.text,
                      phone: phoneController.text,
                      email: emailController.text,
                      avaterId: currentAvatarId));
                }, child: Text('Update Data')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
