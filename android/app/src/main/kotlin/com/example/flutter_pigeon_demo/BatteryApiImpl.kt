package com.example.flutter_pigeon_demo

class BatteryApiImpl : BatteryApi {

    override fun getBatteryInfo(): BatteryInfo {
//        val batteryManager = getSystemService(BATTERY_SERVICE) as android.os.BatteryManager
//        return batteryManager.getIntProperty(android.os.BatteryManager.BATTERY_PROPERTY_CAPACITY)
        return BatteryInfo(80)
    }
}