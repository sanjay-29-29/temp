import 'package:BuildTek/bloc/dashboard/role_department/role_department_bloc.dart';
import 'package:BuildTek/bloc/dashboard/role_department/role_department_state.dart';
import 'package:BuildTek/config/toastication_config.dart';
import 'package:BuildTek/ui/widgets/common/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoleDepartmentConsumer extends StatelessWidget {
  final Widget Function(BuildContext context, RoleDepartmentState state)
      builder;

  const RoleDepartmentConsumer({required this.builder, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RoleDepartmentBloc, RoleDepartmentState>(
      listener: (context, state) {
        if (state is RoleDepartmentError) {
          toaster.showError(title: state.message);
        }
      },
      builder: (context, state) {
        if (state is RoleDepartmentLoading) {
          return const CircleLoadingWidget();
        } else {
          return builder(context, state);
        }
      },
    );
  }
}
