import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_demo/view/HomePage/home_page_bloc.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocProvider<HomeCubit>(

        create: (BuildContext context)=>HomeCubit(),
        child: HomeWidget(),

      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  late HomeCubit homeCubit;

  openBottomSheet(BuildContext context) {
    homeCubit.setInitialData();
    showModalBottomSheet(
        isScrollControlled: true,

        context: context,
        builder: (context) {

          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,left: 6,right: 6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 30,),
                const Text("Employee Name",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                const SizedBox(height: 6,),
                SizedBox(
                    height: 50,
                    child: TextField(
                      controller: homeCubit.nameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder()
                      ),
                    )),
                const SizedBox(height: 6,),
                const Text("Employee Designation",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                const SizedBox(height: 6,),
                SizedBox(
                    height: 50,
                    child: TextField(
                      controller:homeCubit.designationController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder()
                      ),
                    )),
                const SizedBox(height: 6,),
                const Text("Employee Address",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                const SizedBox(height: 6,),
                SizedBox(
                    height: 50,
                    child: TextField(
                      controller: homeCubit.addressController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder()
                      ),
                    )),
                const SizedBox(height: 16,),
                Center(child: MaterialButton(onPressed: ()=>homeCubit.updateData(context),color: Colors.blue,child: const Text("Save",style: TextStyle(color: Colors.white),),)),
                const SizedBox(height: 10,),


              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    homeCubit=BlocProvider.of<HomeCubit>(context);
    return Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocBuilder<HomeCubit,HomeState>(
            buildWhen: (prev,current)=>current is UpdatedState,
            builder: (context,state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  const Center(child: Text("Employee Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Employee Name",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                          const SizedBox(height: 5,),
                          Text(homeCubit.empName,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.indigo),),
                        ],
                      ),
                      IconButton(onPressed: ()=>openBottomSheet(context), icon: const Icon(Icons.edit,color: Colors.red,))
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Employee Designation",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                          const SizedBox(height: 5,),
                          Text(homeCubit.empDesignation,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.indigo),),
                        ],
                      ),
                      IconButton(onPressed: ()=>openBottomSheet(context), icon: const Icon(Icons.edit,color: Colors.red,))
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Employee Address",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                          const SizedBox(height: 5,),
                          Text(homeCubit.empAddress,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.indigo),),
                        ],
                      ),
                      IconButton(onPressed: ()=>openBottomSheet(context), icon: const Icon(Icons.edit,color: Colors.red,))
                    ],
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}

