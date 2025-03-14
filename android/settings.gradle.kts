import org.gradle.api.plugins.PluginManager
import org.gradle.kotlin.dsl.plugins

plugins {
    id("com.android.application") version "8.2.2"
    id("org.jetbrains.kotlin.android") version "1.9.22"
    id("dev.flutter.flutter-plugin-loader") version "2.0.0"
}

android {
    namespace = "com.example.new_ar_test_app"
    compileSdk = 34
    defaultConfig {
        applicationId = "com.example.new_ar_test_app"
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }
}