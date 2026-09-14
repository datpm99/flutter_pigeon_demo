package com.example.flutter_pigeon_demo

import BatteryApi
import BatteryInfo
import android.content.Context
import android.os.BatteryManager

class BatteryApiImpl(private val context: Context) : BatteryApi {

    override fun getBatteryInfo(): BatteryInfo {
        val batteryManager = context.getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        return BatteryInfo(batteryManager.getIntProperty(android.os.BatteryManager.BATTERY_PROPERTY_CAPACITY).toLong())

    }
}