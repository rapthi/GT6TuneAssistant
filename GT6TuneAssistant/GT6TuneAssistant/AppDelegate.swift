//
//  AppDelegate.swift
//  GT6TuneAssistant
//
//  Created by Thierry Rapillard on 15/10/14.
//  Copyright (c) 2014 Quantesys. All rights reserved.
//

import UIKit
import Realm

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Set Default app setting (TODO)
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setInteger(PowerMeasurement.HP.rawValue, forKey: "POWER_MEASUREMENT")
        userDefaults.setInteger(TorqueMeasurement.LBFT.rawValue, forKey: "TORQUE_MEASUREMENT")
        userDefaults.synchronize()

        // IT'S ONLY FOR TESTING
        // Create a new TuneParam Object
        let tune = TuneParam()
        tune.power = 600
        tune.torque = 500
        tune.weight = 1375
        tune.frontWeightDistribution = 0.401
        tune.minFrontRideHeight = 70
        tune.maxFrontRideHeight = 150
        tune.minRearRideHeight = 110
        tune.maxRearRideHeight = 150
        tune.defaultFrontSpringRate = 4.0
        tune.minFrontSpringRate = 3.0
        tune.maxFrontSpringRate = 9.0
        tune.defaultRearSpringRate = 4.0
        tune.minRearSpringRate = 3.0
        tune.maxRearSpringRate = 9.0
        tune.suspensionLevel = 2
        tune.cornerEntryBalance = 0
        tune.cornerExitBalance = 0
        tune.baseCamberAngle = 0.0
        tune.lsdStrength = 2
        tune.spread = 1.0
        tune.scale = 1.0
        tune.maxFrontDownForce = 0
        tune.maxRearDownForce = 0

        // Create a new TuneValue linked to tune instance
        let value = TuneValue(tuneParam: tune)

        // Modify a value
        value.entryExitBalanceAverage = 6

        // write in the DB
        let realm = RLMRealm.defaultRealm()
        realm.beginWriteTransaction()
        realm.addObject(tune)
        realm.addObject(value)
        realm.commitWriteTransaction()

        // print the path of the db
        println(RLMRealm.defaultRealm().path)

        // print fields of value object
        NSLog("entryExitBalanceAverage : \(value.entryExitBalanceAverage)")
        NSLog("rideHeightPercentageOfRange : \(value.rideHeightPercentageOfRange)")
        NSLog("springRatePercentageOfRange : \(value.springRatePercentageOfRange)")
        NSLog("baseSpringRateValue : \(value.baseSpringRateValue)")
        NSLog("baseDamperValue : \(value.baseDamperValue)")
        NSLog("baseAntirollBarValue : \(value.baseAntirollBarValue)")
        NSLog("weightPowerRatio : \(value.weightPowerRatio)")
        NSLog("horsePowerTorqueRatio : \(value.horsePowerTorqueRatio)")
        NSLog("weightPowerSpread : \(value.weightPowerSpread)")
        NSLog("powerBandSpread : \(value.powerBandSpread)")
        NSLog("totalSpread : \(value.totalSpread)")
        NSLog("correctedPower : \(value.correctedPower)")
        NSLog("correctedTorque : \(value.correctedTorque)")
        NSLog("correctedWeightDistribution : \(value.correctedWeightDistribution)")
        NSLog("weightPowerBrakeEven : \(value.weightPowerBrakeEven)")
        NSLog("weightPowerMin : \(value.weightPowerMin)")
        NSLog("weightPowerMax : \(value.weightPowerMax)")
        NSLog("horsePowerTorqueBreakEven : \(value.horsePowerTorqueBreakEven)")
        NSLog("horsePowerTorqueMin : \(value.horsePowerTorqueMin)")
        NSLog("horsePowerTorqueMax : \(value.horsePowerTorqueMax)")
        NSLog("driveTrainFactor : \(value.driveTrainFactor)")
        NSLog("powerWeightFactor : \(value.powerWeightFactor)")
        NSLog("powerBandFactor : \(value.powerBandFactor)")
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

