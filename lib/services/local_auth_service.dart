import 'dart:convert';
import 'dart:html' as html;

// Simple user model for local authentication
class LocalUser {
  final String uid;
  final String email;
  final String displayName;
  final DateTime createdAt;

  LocalUser({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'displayName': displayName,
    'createdAt': createdAt.toIso8601String(),
  };

  factory LocalUser.fromJson(Map<String, dynamic> json) => LocalUser(
    uid: json['uid'],
    email: json['email'],
    displayName: json['displayName'],
    createdAt: DateTime.parse(json['createdAt']),
  );
}

class LocalAuthService {
  static const String _currentUserKey = 'my_zikr_current_user';
  static const String _usersKey = 'my_zikr_users';
  
  LocalUser? _currentUser;

  // Get current user
  LocalUser? get currentUser => _currentUser;

  // Initialize and check for existing session
  Future<void> initialize() async {
    final userJson = html.window.localStorage[_currentUserKey];
    if (userJson != null) {
      try {
        final userData = jsonDecode(userJson);
        _currentUser = LocalUser.fromJson(userData);
      } catch (e) {
        // Clear invalid session
        html.window.localStorage.remove(_currentUserKey);
      }
    }
  }

  // Sign in with email and password
  Future<LocalUser?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1500));
    
    try {
      // Validate email format
      if (!_isValidEmail(email)) {
        throw 'Please enter a valid email address.';
      }
      
      if (password.length < 6) {
        throw 'Password must be at least 6 characters long.';
      }
      
      final usersJson = html.window.localStorage[_usersKey] ?? '{}';
      final users = Map<String, dynamic>.from(jsonDecode(usersJson));
      
      if (!users.containsKey(email)) {
        throw 'No user found with this email address.';
      }
      
      final userData = users[email];
      if (userData['password'] != password) {
        throw 'Incorrect password.';
      }
      
      _currentUser = LocalUser.fromJson(userData['profile']);
      html.window.localStorage[_currentUserKey] = jsonEncode(_currentUser!.toJson());
      
      return _currentUser;
    } catch (e) {
      if (e is String) rethrow;
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  // Register with email and password
  Future<LocalUser?> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 2000));
    
    try {
      // Validate inputs
      if (name.trim().isEmpty) {
        throw 'Please enter your name.';
      }
      
      if (!_isValidEmail(email)) {
        throw 'Please enter a valid email address.';
      }
      
      if (password.length < 6) {
        throw 'Password must be at least 6 characters long.';
      }
      
      final usersJson = html.window.localStorage[_usersKey] ?? '{}';
      final users = Map<String, dynamic>.from(jsonDecode(usersJson));
      
      if (users.containsKey(email)) {
        throw 'An account with this email already exists.';
      }
      
      // Create new user
      final uid = 'user_${DateTime.now().millisecondsSinceEpoch}';
      final newUser = LocalUser(
        uid: uid,
        email: email,
        displayName: name.trim(),
        createdAt: DateTime.now(),
      );
      
      // Store user data
      users[email] = {
        'password': password,
        'profile': newUser.toJson(),
      };
      
      html.window.localStorage[_usersKey] = jsonEncode(users);
      html.window.localStorage[_currentUserKey] = jsonEncode(newUser.toJson());
      
      _currentUser = newUser;
      return _currentUser;
    } catch (e) {
      if (e is String) rethrow;
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  // Sign in with Google (placeholder)
  Future<LocalUser?> signInWithGoogle() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    throw 'Google Sign-In is not configured. Please use email/password authentication.';
  }

  // Sign out
  Future<void> signOut() async {
    _currentUser = null;
    html.window.localStorage.remove(_currentUserKey);
  }

  // Check if user is signed in
  bool get isSignedIn => _currentUser != null;

  // Validate email format
  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // Get all registered users (for debugging)
  Map<String, dynamic> getAllUsers() {
    final usersJson = html.window.localStorage[_usersKey] ?? '{}';
    return Map<String, dynamic>.from(jsonDecode(usersJson));
  }

  // Clear all data (for testing)
  void clearAllData() {
    html.window.localStorage.remove(_currentUserKey);
    html.window.localStorage.remove(_usersKey);
    _currentUser = null;
  }
}
