package com.flower.advisor.florist.florist_app

import android.content.Context
import io.flutter.embedding.android.FlutterActivity
import androidx.multidex.MultiDex

class MainActivity: FlutterActivity() {

    override fun attachBaseContext(base: Context) {
        super.attachBaseContext(base)
        MultiDex.install(this)
    }
}
