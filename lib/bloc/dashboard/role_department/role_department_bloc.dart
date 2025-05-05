import 'package:BuildTek/bloc/dashboard/role_department/role_department_event.dart';
import 'package:BuildTek/bloc/dashboard/role_department/role_department_state.dart';
import 'package:BuildTek/constants/department_constants.dart';
import 'package:BuildTek/constants/role_constants.dart';
import 'package:BuildTek/models/auth/user_login_details_model.dart';
import 'package:BuildTek/services/storage/store_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoleDepartmentBloc
    extends Bloc<RoleDepartmentEvent, RoleDepartmentState> {
  RoleDepartmentBloc() : super(RoleDepartmentInitial()) {
    on<FetchRoleDepartment>(_onFetchRoleDepartment);
  }

  Future<void> _onFetchRoleDepartment(
    FetchRoleDepartment event,
    Emitter<RoleDepartmentState> emit,
  ) async {
    emit(RoleDepartmentLoading());
    try {
      final UserDetails userDetails = await StoreService.getEmployeeData();
      final Employee employee = userDetails.employee.data;
      final department = _getDepartment(employee.department.name);
      final role = _getRole(employee.role.roleName);
      emit(
        RoleDepartmentLoaded(
          department: department,
          role: role,
          id: employee.id,
        ),
      );
    } catch (error) {
      emit(RoleDepartmentError(message: error.toString()));
    }
  }

  UserDepartment _getDepartment(String departmentName) {
    switch (departmentName) {
      case 'Marketing':
        return UserDepartment.Marketing;
      case 'Sales':
        return UserDepartment.Sales;
      case 'Branding':
        return UserDepartment.Branding;
      case 'Credit Control':
        return UserDepartment.CreditControl;
      case 'Business Development':
        return UserDepartment.BusinessDevelopment;
      case 'Accounts':
        return UserDepartment.Accounts;
      case 'Dispatch':
        return UserDepartment.Dispatch;
      case 'Warehouse':
        return UserDepartment.Warehouse;
      case 'Transport':
        return UserDepartment.Transport;
      case 'Purchase':
        return UserDepartment.Purchase;
      case 'Finance Manager':
        return UserDepartment.Finance;
      case 'HR':
        return UserDepartment.HR;
      case 'Admin':
        return UserDepartment.Admin;
      default:
        return UserDepartment.Admin;
    }
  }

  UserRole _getRole(String roleName) {
    switch (roleName) {
      case 'Super Admin':
        return UserRole.SuperAdmin;
      case 'HOD':
        return UserRole.HOD;
      case 'Executive':
        return UserRole.Executive;
      case 'Manager':
        return UserRole.Manager;
      case 'Asst Manager':
        return UserRole.AsstManager;
      default:
        return UserRole.Executive;
    }
  }
}
