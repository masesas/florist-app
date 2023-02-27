part of 'network.dart';

class DataResource<ResponseModel, ResultModel> {
  final Completer<Resource<ResultModel>> _result =
      Completer<Resource<ResultModel>>();

  Future<Resource<ResultModel>> getAsObservable() => _result.future;

  Stream<Resource<ResultModel>> getAsStream() =>
      Stream.fromFuture(_result.future);

  final Future<HttpResponse<ResponseModel>> Function()? createCall;

  final Future<ResponseModel> Function()? createSerializedCall;

  final bool shouldFetch;

  final Future<ResultModel?> Function()? loadFromDb;

  final Future<void> Function(ResultModel result)? saveCallResult;

  final ResultModel Function(ResponseModel)? parsedData;

  final Future<ResultModel> Function(ResponseModel json)? parsedDataAsync;

  DataResource({
    this.createCall,
    this.createSerializedCall,
    this.parsedData,
    this.saveCallResult,
    this.loadFromDb,
    this.shouldFetch = true,
    this.parsedDataAsync,
  }) {
    shouldFetch
        ? (createCall != null
            ? _fetchFromServer()
            : _fetchFromServerWithSerialization())
        : _fetchFromDB();
  }

  _fetchFromServer() async {
    try {
      // call request from network
      HttpResponse<ResponseModel> response = await createCall!();
      final resource = Resource<ResultModel>.fromResponse(response.response);
      if (resource.isSuccess) {
        // convert to data type
        ResultModel data = parsedData!(response.data);
        if (saveCallResult != null && data != null) {
          await saveCallResult!(data); // cache database
        }
        if (loadFromDb != null) {
          //data = await loadFromDb!(); // call request from database
        }
        resource.data = data;
      }
      _result.complete(resource);
    } on DioError catch (e) {
      ResultModel? data;
      if (loadFromDb != null) {
        data = await loadFromDb!(); // call request from database
      }
      _result.complete(Resource.withError(e, dataError: data));
    }
  }

  _fetchFromServerWithSerialization() async {
    try {
      ResponseModel response = await createSerializedCall!();

      ResultModel? result;

      if (response is ResultModel) {
        result = response;
      } else if (parsedData != null) {
        result = parsedData!(response);
      } else if (parsedDataAsync != null) {
        result = await parsedDataAsync!(response);
      }

      if (saveCallResult != null && result != null) {
        await saveCallResult!(result); // cache database
      }

      if (loadFromDb != null) {
        result = await loadFromDb!(); // call request from database
      }

      if (result != null) {
        _result.complete(Resource.fromData(dataType: result));
      } else {
        _result.complete(Resource.withNoData());
      }
    } on DioError catch (e) {
      ResultModel? data;
      if (loadFromDb != null) {
        data = await loadFromDb!(); // call request from database
      }
      _result.complete(Resource.withError(e, dataError: data));
    }
  }

  _fetchFromDB() async {
    Resource<ResultModel> resource;
    if (loadFromDb == null) {
      resource = Resource.withNoData();
    } else {
      // call request from database
      ResultModel? result = await loadFromDb!();
      if (result == null) {
        resource = Resource.withNoData();
      } else {
        resource = Resource.withHasData(dataType: result);
      }
    }
    _result.complete(resource);
  }
}
