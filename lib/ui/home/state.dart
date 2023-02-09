import 'dart:collection';

class CubitState {
  bool isInitial = true;
  bool isLoading = false;

  final Map<String, dynamic> caches = HashMap();

  CubitState status(CubitStatus status) {
    if (status == CubitStatus.loading) {
      isLoading = true;
    } else if (status == CubitStatus.complete) {
      isLoading = false;
    } else {
      isInitial = true;
      isLoading = false;
    }
    return this;
  }

  CubitState setData(String name, dynamic data) {
    caches[name] = data;
    isInitial = false;
    isLoading = false;
    return this;
  }

  CubitState clearData(String name) {
    caches.remove(name);
    isInitial = false;
    isLoading = false;
    return this;
  }

  dynamic getData(String name) => caches[name];

  CubitState clear() {
    isInitial = true;
    isLoading = false;
    caches.clear();
    return this;
  }
}

enum CubitStatus {
  initial,
  loading,
  complete,
}
