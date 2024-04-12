import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class HomeState{}

class HomeInitial extends HomeState{}
class UpdatedState extends HomeState{}


class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(HomeInitial());
  String empName="Enter employee Name";
  String empDesignation="Enter employee Designation";
  String empAddress="Enter employee Address";
  TextEditingController nameController=TextEditingController();
  TextEditingController designationController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  var bottomSheetController;


  updateData(BuildContext context) {
      empName=nameController.text;
      empDesignation=designationController.text;
      empAddress=addressController.text;
      Navigator.pop(context);
      emit(UpdatedState());
  }

  void setInitialData() {
    nameController.text=empName;
    designationController.text=empDesignation;
    addressController.text=empAddress;
  }



}