import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/ngo_descri_bloc.dart/ngo_desc_main_bloc.dart';

import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/models/ngo_models/ngo_model.dart';
import 'package:giftit/views/ngo_Description/widgets/data_display.dart';

class NgoDescription extends StatelessWidget {
  final NgoModel ngo;
  const NgoDescription({required this.ngo , super.key});

  @override
  Widget build(BuildContext context) {    
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body:
          BlocBuilder<NgoDescBloc,NgoDescState>(
            builder:(context,apiRecieveState){
              return DataDisplay(ngo: ngo,);
              // return Center(child: CircularProgressIndicator());            
            }
          )
      ),
    );
  } 
}