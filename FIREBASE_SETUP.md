# Firebase Setup Guide for My.Zikr App

This guide will help you set up Firebase Authentication for your My.Zikr Flutter app.

## 🔥 Firebase Project Setup

### 1. Create a Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Create a project"
3. Enter project name: `my-zikr-app`
4. Enable Google Analytics (optional)
5. Click "Create project"

### 2. Enable Authentication

1. In your Firebase project, go to **Authentication**
2. Click **Get started**
3. Go to **Sign-in method** tab
4. Enable the following providers:
   - **Email/Password**: Click and toggle "Enable"
   - **Google**: Click, toggle "Enable", and add your project support email

### 3. Add Flutter App to Firebase

#### For Android:
1. Click **Add app** → **Android**
2. Enter package name: `com.example.my_zikr_app`
3. Download `google-services.json`
4. Place it in `android/app/` directory

#### For Web:
1. Click **Add app** → **Web**
2. Enter app nickname: `My Zikr Web`
3. Copy the Firebase config object

#### For iOS (if needed):
1. Click **Add app** → **iOS**
2. Enter bundle ID: `com.example.myZikrApp`
3. Download `GoogleService-Info.plist`
4. Place it in `ios/Runner/` directory

## 📱 Update Firebase Configuration

### 1. Update `lib/firebase_options.dart`

Replace the placeholder values in `lib/firebase_options.dart` with your actual Firebase config:

```dart
static const FirebaseOptions web = FirebaseOptions(
  apiKey: 'your-actual-web-api-key',
  appId: 'your-actual-web-app-id',
  messagingSenderId: 'your-actual-sender-id',
  projectId: 'your-actual-project-id',
  authDomain: 'your-project-id.firebaseapp.com',
  storageBucket: 'your-project-id.appspot.com',
);
```

### 2. Android Configuration

Add to `android/app/build.gradle`:

```gradle
dependencies {
    implementation 'com.google.firebase:firebase-auth'
    implementation 'com.google.android.gms:play-services-auth:20.7.0'
}
```

Add to `android/build.gradle`:

```gradle
dependencies {
    classpath 'com.google.gms:google-services:4.3.15'
}
```

Add to `android/app/build.gradle` (at the bottom):

```gradle
apply plugin: 'com.google.gms.google-services'
```

### 3. Web Configuration

Update `web/index.html` to include Firebase SDK (add before `</body>`):

```html
<script src="https://www.gstatic.com/firebasejs/10.7.0/firebase-app-compat.js"></script>
<script src="https://www.gstatic.com/firebasejs/10.7.0/firebase-auth-compat.js"></script>
```

## 🚀 Running the App

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Run the app:**
   ```bash
   flutter run -d chrome  # For web
   flutter run -d android # For Android
   ```

## 🔐 Authentication Flow

The app now includes:

1. **Login Screen**: Email/password and Google sign-in
2. **Signup Screen**: Create new account with email/password
3. **Authentication State Management**: Automatic login/logout handling
4. **User Data**: Stores user info in Firestore

## 🧪 Testing Authentication

### Test Email/Password:
1. Open the app
2. Click "Sign Up" 
3. Enter name, email, and password
4. Click "Create Account"
5. You should be redirected to the Welcome screen

### Test Google Sign-In:
1. Click "Continue with Google"
2. Select your Google account
3. You should be redirected to the Welcome screen

### Test Logout:
1. On the Welcome screen, click the logout icon (top-right)
2. You should be redirected back to the Login screen

## 🔧 Troubleshooting

### Common Issues:

1. **"Firebase not initialized"**
   - Make sure `firebase_options.dart` has correct config values
   - Ensure `Firebase.initializeApp()` is called in `main()`

2. **Google Sign-In not working**
   - Check that Google provider is enabled in Firebase Console
   - Verify SHA-1 fingerprint is added for Android

3. **Web authentication issues**
   - Ensure Firebase SDK scripts are loaded in `web/index.html`
   - Check browser console for errors

4. **Android build errors**
   - Make sure `google-services.json` is in `android/app/`
   - Verify Gradle plugins are correctly added

## 📚 Next Steps

After Firebase is set up, you can:

1. **Add more authentication providers** (Facebook, Apple, etc.)
2. **Implement password reset** functionality
3. **Add user profile management**
4. **Store user preferences** in Firestore
5. **Add push notifications**

## 🆘 Need Help?

If you encounter issues:

1. Check the [Firebase Flutter documentation](https://firebase.flutter.dev/)
2. Verify your Firebase project settings
3. Check the browser/device console for error messages
4. Ensure all dependencies are properly installed

Your My.Zikr app now has complete authentication functionality! 🎉
