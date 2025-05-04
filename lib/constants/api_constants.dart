class ApiEndpoints {
  static const String fetchUsernameDetails = '/api/auth/get-user-identity';
  static const String authenticate = '/api/auth/login';
  static const String sendfcmToken = '/api/auth/token';
  static const String refreshToken = '/api/auth/refresh-token';
  static const String sendOTP = '/api/auth/send-otp';
  static const String validateOTP = '/api/auth/verify-otp';
  static const String setPassword = '/api/auth/set-password';

  //---Devices---
  static const String addDevice = '/api/user/devices/addNewDevice';
  static const String isRegisteredDevice =
      '/api/user/devices/isRegisteredDevice';
  static const String activateDevice = '/api/user/devices/activateDevice';
  static const String updateDevice = '/api/user/devices/addorupdateDeviceFcmToken';

  // --Employee--
  static const String fetchAllEmployees = '/api/organization/employee/getall';

  // ---HR---
  static const String getAllUnverifiedEmployees =
      '/api/user/hr/getEmployeesWithPendingDeviceVerification';
  static const String fetchAllDepartment = '/api/organization/department/';
  static const String fetchAllRole = '/api/organization/role';
  static const String fetchReportsToEmployee =
      '/api/organization/employee/employee-based-role';
  static const String fetchAccountExecutive =
      '/api/organization/employee/get-all-accounts-executive';
  static const String fetchAllLocation =
      '/api/organization/location/getAllLocations';
  static const String fetchAllBooks = '/api/organization/books';
  static const String fetchAllChildDepartment =
      '/api/organization/department/child';

  static const String addEmployee = '/api/organization/employee/add';

  // ---Profile Update ---
  static const String fetchEmployeeByEmployeeId =
      '/api/organization/employee/id';
  static const String updateEmployee = '/api/organization/employee/update';

  // ---Customer---
  static const String projectById = '/api/lead/project/id';
  static const String createIntent = '/api/indent/indent/add';
  static const String customerProfileById = '/api/customer/details/customer';
  static const String addBusinessDetails = '/api/customer/details/add';
  static const String addContactDetails = '/api/customer/contact/add';
  static const String addAddressDetails = '/api/customer/address/add';
  static const String fetchCustomerByBookAndEmployee =
      '/api/customer/details/getCustomerByBookAndEmployee';
  static const String fetchIntentByBookAndEmployee =
      '/api/indent/indent/getIndentByBookAndEmployee';
  static const String fetchAddressOfCustomer =
      '/api/customer/address/getCustomer';

  // --- Lead ---
  static const String addProject = '/api/lead/project/add';
  static const String addLeadDetails = '/api/lead/requirements/add';
  static const String addLeadNotes = '/api/lead/notes/add';
  static const String fetchDetailsWeb = '/api/lead/project/web/all';
  static const String fetchIsIntentDetails = '/api/indent/indent/isIntent';
  static const String acceptIntent = '/api/indent/indent/active';
  static const String rejectIntent = '/api/indent/indent/reject';
}
