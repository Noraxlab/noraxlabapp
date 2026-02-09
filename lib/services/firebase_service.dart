import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import '../models/content_model.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  List<ContentItem> _contentItems = [];
  Map<String, int> _categoryCounts = {};
  bool _isAdmin = false;
  bool _isInitialized = false;

  FirebaseService() {
    _initializeAuthListener();
  }

  Future<void> initialize() async {
    if (_isInitialized) return;
    _isInitialized = true;
  }

  void _initializeAuthListener() {
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        _checkAdminStatus(user.uid);
      } else {
        _isAdmin = false;
      }
    });
  }

  Future<void> _checkAdminStatus(String userId) async {
    try {
      final adminSnapshot = await _database.child('admins').child(userId).get();
      _isAdmin = adminSnapshot.exists;
    } catch (e) {
      _isAdmin = false;
    }
  }

  Future<void> loadContent() async {
    try {
      final contentSnapshot = await _database.child('content').get();
      
      if (contentSnapshot.exists) {
        _contentItems.clear();
        _categoryCounts.clear();

        final Map<dynamic, dynamic> contentMap = contentSnapshot.value as Map;
        
        contentMap.forEach((categoryKey, categoryData) {
          final String category = categoryKey.toString();
          
          if (categoryData is Map) {
            _categoryCounts[category] = categoryData.length;
            
            categoryData.forEach((itemKey, itemData) {
              final ContentItem item = ContentItem.fromMap(
                Map<String, dynamic>.from(itemData as Map),
                itemKey.toString(),
              );
              _contentItems.add(item);
            });
          }
        });
      }
    } catch (e) {
      print('Error loading content: $e');
    }
  }

  Future<void> addContent(ContentItem content) async {
    if (!_isAdmin) throw Exception('Admin access required');
    
    try {
      final newRef = _database
          .child('content')
          .child(content.category.toLowerCase().replaceAll(' ', '_'))
          .push();
      
      await newRef.set(content.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> loginAdmin(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logoutAdmin() async {
    await _auth.signOut();
    _isAdmin = false;
  }

  List<ContentItem> get contentItems => _contentItems;
  Map<String, int> get categoryCounts => _categoryCounts;
  bool get isAdmin => _isAdmin;
  bool get isInitialized => _isInitialized;

  List<ContentItem> getContentByCategory(String category) {
    return _contentItems
        .where((item) => item.category.toLowerCase() == category.toLowerCase())
        .toList();
  }

  void dispose() {}
}
