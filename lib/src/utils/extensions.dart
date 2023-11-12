import '../../payselection.dart';

extension FutureBaseResponseExtensions<T> on Future<BaseResponse<T>> {
  Future<R> proceedResult<R>(
      R Function(T responseData) onSuccess, R Function(String errorCode) onError) async {
    try {
      final response = await this; // Дождидаемся завершения Future<BaseResponse<T>>

      if (response.code == null) {
        // Если код равен null, считаем это успешным ответом
        return onSuccess(response.data as T);
      } else {
        // Иначе считаем это ошибкой и возвращаем результат error
        return onError(response.code!);
      }
    } catch (e) {
      // Обработка ошибок, если что-то пошло не так
      print('Error: $e');
      return onError('unknown_error');
    }
  }
}