import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService {
  static final _client = Supabase.instance.client;
  static const _bucket = 'dalel_home';

  static String getImageUrl(String filePath) {
    return _client.storage.from(_bucket).getPublicUrl(filePath);
  }
}
