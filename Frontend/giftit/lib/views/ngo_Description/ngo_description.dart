import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/ngo_descri_bloc.dart/api_data_bloc.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/views/ngo_Description/widgets/data_display.dart';

class NgoDescription extends StatelessWidget {
  const NgoDescription({super.key});

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      backgroundColor: AppColors.background,
      body:
        BlocBuilder<ApiDataBloc,DataState>(
          builder:(context,apiRecieveState){
            return DataDisplay();
            // return Center(child: CircularProgressIndicator());            
          }
        )
    );
  }

  
}