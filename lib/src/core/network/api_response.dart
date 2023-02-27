class ApiResponse<DataType> {
  final int responseCode;
  final int error;
  final String message;
  final DataType? data;

  ApiResponse({
    this.responseCode = 200,
    this.error = 0,
    this.message = '',
    this.data,
  });
}
