import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String supabaseUrl = "https://brrbrlkgqkwihyxgvtjw.supabase.co";
  static const String supabaseAnonKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJycmJybGtncWt3aWh5eGd2dGp3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTU4ODUzNzEsImV4cCI6MjA3MTQ2MTM3MX0.j4CcPmkt-vPmbD-XVlX2IV09EbEP0uqANjKE752rwFQ";

  static Future<void> init() async {
    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  }

  static SupabaseClient get client => Supabase.instance.client;
}
