abstract class ILocalStorage {
  Future<bool> save(String key, dynamic value);
  Future<dynamic> getByKey(String key);
  Future<bool> remove(String key);
  Future<bool> clearAll();
}
