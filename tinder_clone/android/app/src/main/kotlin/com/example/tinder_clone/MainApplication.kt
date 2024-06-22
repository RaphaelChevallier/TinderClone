package com.example.tinder_clone

import android.app.Application

class MainApplication : Application() {
    override fun onCreate() {
        super.onCreate()
        // val radarApiKey = BuildConfig.RADAR_PK
        // Initialize Radar SDK with your publishable API key
        // Radar.initialize(this, radarApiKey)
    }
}