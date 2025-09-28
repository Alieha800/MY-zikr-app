# Flutter Setup Script for Windows
# Run this script as Administrator

Write-Host "🚀 Setting up Flutter for Windows..." -ForegroundColor Green

# Check if running as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "❌ Please run this script as Administrator" -ForegroundColor Red
    exit 1
}

# Create development directory
$flutterPath = "C:\development\flutter"
if (!(Test-Path "C:\development")) {
    New-Item -ItemType Directory -Path "C:\development"
    Write-Host "✅ Created C:\development directory" -ForegroundColor Green
}

# Check if Flutter is already installed
if (Get-Command flutter -ErrorAction SilentlyContinue) {
    Write-Host "✅ Flutter is already installed!" -ForegroundColor Green
    flutter --version
    exit 0
}

# Download Flutter SDK
Write-Host "📥 Downloading Flutter SDK..." -ForegroundColor Yellow
$flutterUrl = "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.16.0-stable.zip"
$zipPath = "$env:TEMP\flutter_windows.zip"

try {
    Invoke-WebRequest -Uri $flutterUrl -OutFile $zipPath
    Write-Host "✅ Downloaded Flutter SDK" -ForegroundColor Green
} catch {
    Write-Host "❌ Failed to download Flutter SDK" -ForegroundColor Red
    Write-Host "Please download manually from: https://docs.flutter.dev/get-started/install/windows"
    exit 1
}

# Extract Flutter
Write-Host "📦 Extracting Flutter..." -ForegroundColor Yellow
try {
    Expand-Archive -Path $zipPath -DestinationPath "C:\development" -Force
    Write-Host "✅ Extracted Flutter to C:\development\flutter" -ForegroundColor Green
} catch {
    Write-Host "❌ Failed to extract Flutter" -ForegroundColor Red
    exit 1
}

# Add Flutter to PATH
Write-Host "🔧 Adding Flutter to PATH..." -ForegroundColor Yellow
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($currentPath -notlike "*$flutterPath\bin*") {
    [Environment]::SetEnvironmentVariable("Path", "$currentPath;$flutterPath\bin", "User")
    Write-Host "✅ Added Flutter to PATH" -ForegroundColor Green
} else {
    Write-Host "✅ Flutter already in PATH" -ForegroundColor Green
}

# Clean up
Remove-Item $zipPath -Force

Write-Host "🎉 Flutter installation completed!" -ForegroundColor Green
Write-Host "📝 Next steps:" -ForegroundColor Yellow
Write-Host "1. Close and reopen your terminal" -ForegroundColor White
Write-Host "2. Run: flutter doctor" -ForegroundColor White
Write-Host "3. Install Android Studio if needed" -ForegroundColor White
Write-Host "4. Navigate to your My.Zikr app and run: flutter pub get" -ForegroundColor White
