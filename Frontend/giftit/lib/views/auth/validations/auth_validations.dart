import 'package:flutter/material.dart';
import 'package:giftit/bloc/auth/login_bloc/login_main_bloc.dart';
import 'package:giftit/bloc/auth/password_modifications/change_passwordBloc/old_password_bloc/old_pswd_main_bloc.dart';
import 'package:giftit/bloc/auth/password_modifications/common_reset_pswd_bloc_floder/reset_pswd_main_bloc.dart';
import 'package:giftit/bloc/auth/signup/signup_main_bloc.dart';

class ValidationsOfAuth{
  static bool patternMatch(String regexStr,String checkStr ){
    if(!RegExp(regexStr).hasMatch(checkStr)) return false;    
    return true;
  }
  
  static String loginValidation(LoginState tempLoginState ){
     if(!patternMatch(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$', tempLoginState.email,))return  "Enter valid email";
     if(!patternMatch(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-])[A-Za-z\d!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]{8,}$', tempLoginState.password))return "Enter Strong Password";
     return "";
  }
  static String resetPasswordValidation(ResetPasswordState tempResetPswdState ){
    //  if(!patternMatch(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$', tempLoginState.email,))return  "Enter valid email";
     if(!patternMatch(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-])[A-Za-z\d!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]{8,}$', tempResetPswdState.newPassword))return "Enter Strong Password";
     if(tempResetPswdState.newPassword != tempResetPswdState.confirmPassword)return "Password mismatch";
     return "";
  }
  static String oldPasswordValidation(OldPasswordState tempOldPswdState ){
     if(!patternMatch(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-])[A-Za-z\d!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]{8,}$', tempOldPswdState.oldPassword))return "Enter valid Old Password";
    //  if(tempResetPswdState.newPassword != tempResetPswdState.confirmPassword)return "Password mismatch";
     return "";
  }
  static String signupValidation(SignupState tempSignupState){
    debugPrint("Username: ${tempSignupState.username}, Email: ${tempSignupState.email}, ...");

    if(tempSignupState.username.isEmpty || tempSignupState.email.isEmpty || tempSignupState.phoneNumber.isEmpty || tempSignupState.password.isEmpty || tempSignupState.cityLocation.isEmpty)return "Fill all the fields";
    // email validation
    // if(!patternMatch(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$', tempSignupState.email,))return  "Enter valid email";
    //phone validation
    if(!patternMatch(r'^\d{10}$', tempSignupState.phoneNumber,))return  "Enter valid phone Number";
    //password validation
    if(!patternMatch(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-])[A-Za-z\d!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]{8,}$', tempSignupState.password))return "Enter Strong Password";
    return "";        
  }
}