import 'package:BuildTek/bloc/dashboard/hr_bloc/verify_employee/verify_employee_event.dart';
import 'package:BuildTek/bloc/dashboard/hr_bloc/verify_employee/verify_employee_state.dart';
import 'package:BuildTek/respositories/role-based/hr/verify_employee/verify_employee_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmployeeBloc
    extends Bloc<VerifyEmployeeEvent, VerifyEmployeeState> {
  final VerifyEmployeeRepository verifyEmployeeRepository;

  VerifyEmployeeBloc({required this.verifyEmployeeRepository})
    : super(VerifyEmployeeInital()) {
    on<FetchUnverifiedEmployeeEvent>(_onFetchUnverifiedEmployeeEvent);
    on<ActivateDeviceEvent>(_onActivateDeviceEvent);
  }

  void _onFetchUnverifiedEmployeeEvent(
    FetchUnverifiedEmployeeEvent eent,
    Emitter<VerifyEmployeeState> emit,
  ) async {
    emit(VerifyEmployeeLoading());
    try {
      final response = await verifyEmployeeRepository.unVerifiedEmployee();
      if (response.success == true) {
        emit(UnverifiedEmployeeLoadedSuccess(employees: response.data!));
      } else {
        emit(UnverifiedEmployeeLoadedFailure(error: response.message));
      }
    } catch (error) {
      emit(VerifyEmployeeFailure(error: error.toString()));
    }
  }

  void _onActivateDeviceEvent(
    ActivateDeviceEvent event,
    Emitter<VerifyEmployeeState> emit,
  ) async {
    emit(VerifyEmployeeLoading());
    try {
      final response = await verifyEmployeeRepository.activateDevice(
        event.deviceActivate,
      );
      if (response.success == true) {
        emit(ActivateDeviceSuccess(message: response.message));
        add(FetchUnverifiedEmployeeEvent());
      } else {
        emit(ActivateDeviceFailure(error: response.message));
      }
    } catch (error) {
      emit(VerifyEmployeeFailure(error: error.toString()));
    }
  }
}
