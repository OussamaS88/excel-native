import 'package:excel_native/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:excel_native/home/home.dart';
import 'package:excel_native/login/login.dart';
List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeView.page()];
    case AppStatus.unauthenticated:
      return [LoginView.page()];
  }
}
