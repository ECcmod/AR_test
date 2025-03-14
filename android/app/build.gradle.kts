plugins {
    id("com.android.application")
    kotlin("android")
    id("dev.flutter.flutter-gradle-plugin")
}

// Add this line to load Flutter
apply(from = "${project.rootDir.parentFile}/.android/Flutter/build.gradle")

val flutterRoot = rootProject.projectDir.parentFile
val flutterVersionCode = '1'
val flutterVersionName = '1.0'

android {
    namespace = "com.example.new_ar_test_app"
    compileSdk = 33

    defaultConfig {
        applicationId = "com.example.new_ar_test_app"
        minSdk = 21
        targetSdk = 33
        versionCode = 1
        versionName = "1.0.0"
        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(getDefaultProguardFile("proguard-android.txt"), "proguard-rules.pro")
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = "1.8"
    }

    sourceSets {
        getByName("main") {
            java.srcDirs("src/main/kotlin")
            // Add this line for Flutter assets
            assets.srcDirs("${project.rootDir.parentFile}/build/flutter_assets")
        }
    }

    buildFeatures {
        viewBinding = true
    }
}

flutter {
    source '../..'
}

dependencies {
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk7:1.7.10")
    implementation("androidx.core:core-ktx:1.9.0")
    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("com.google.android.material:material:1.8.0")
    implementation("androidx.window:window:1.0.0")
    implementation("androidx.window:window-java:1.0.0")
}
