
import 'package:BuildTek/bloc/dashboard/hr_bloc/verify_employee/verify_employee_bloc.dart';
import 'package:BuildTek/bloc/dashboard/hr_bloc/verify_employee/verify_employee_event.dart';
import 'package:BuildTek/bloc/dashboard/hr_bloc/verify_employee/verify_employee_state.dart';
import 'package:BuildTek/config/toastication_config.dart';
import 'package:BuildTek/models/user_based_models/hr/unverified_employee.dart';
import 'package:BuildTek/ui/widgets/common/loading.dart';
import 'package:BuildTek/ui/widgets/role_based/hr/task_items/add_users.dart';
import 'package:BuildTek/ui/widgets/role_based/hr/task_items/new_user_add.dart';
import 'package:BuildTek/ui/wrapper_class/response_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HrTaskList extends StatefulWidget {
  const HrTaskList({super.key});

  @override
  State<HrTaskList> createState() => _HrTaskListState();
}

class _HrTaskListState extends State<HrTaskList> {
  @override
  void initState() {
    super.initState();
    context.read<VerifyEmployeeBloc>().add(FetchUnverifiedEmployeeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyEmployeeBloc, VerifyEmployeeState>(
      listener: (context, state) {
        if (state is VerifyEmployeeFailure) {
          toaster.showError(title: state.error);
        } else if (state is UnverifiedEmployeeLoadedFailure) {
          toaster.showError(title: state.error);
        } else if (state is ActivateDeviceFailure) {
          toaster.showError(title: state.error);
        }
      },
      builder: (context, state) {
        if (state is VerifyEmployeeLoading) {
          return CircleLoadingWidget(
            bgColor: Colors.transparent,
          );
        }
        if (state is UnverifiedEmployeeLoadedSuccess) {
          List<EmployeeModelUnVerified> employeeList = state.employees.data;
          final List<Widget> leadItemsList = [
            ...employeeList.map((employee) => NewUserAdded(employee: employee)),
            HrAddUser(count: employeeList.length),
            const ResponsiveSizedBox(width: 0, height: 80),
          ];

          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            itemBuilder: (context, index) => leadItemsList[index],
            separatorBuilder: (context, index) {
              if (index == leadItemsList.length - 1) {
                return const SizedBox(height: 50.0);
              }
              return const SizedBox(height: 10.0);
            },
            itemCount: leadItemsList.length,
          );
        }

        return const SizedBox();
      },
    );
  }
}
