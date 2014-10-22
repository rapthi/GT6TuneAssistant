//
//  TuneValue.swift
//  GT6TuneAssistant
//
//  Created by Thierry Rapillard on 12/11/14.
//  Copyright (c) 2014 Quantesys. All rights reserved.
//

import Foundation
import Realm

class TuneValue: RLMObject {
    // {{{ Constructos
    override init() {
        self.tuneParam = TuneParam()
        super.init()
    }

    init(tuneParam: TuneParam) {
        self.tuneParam = tuneParam;
        super.init()
    }
    // }}}
    func ignoredProperties() -> NSArray {
        return [
        self.customEntryExitBalanceAverage!,
        self.customRideHeightPercentageOfRange!,
        self.customSpringRatePercentageOfRange!,
        self.customBaseSpringRateValue!,
        self.customBaseDamperValue!,
        self.customBaseAntirollBarValue!,
        self.customWeightPowerRatio!,
        self.customHorsePowerTorqueRatio!,
        self.customWeightPowerSpread!,
        self.customPowerBandSpread!,
        self.customTotalSpread!,
        self.customCorrectedPower!,
        self.customCorrectedTorque!,
        self.customCorrectedWeightDistribution!,
        self.customWeightPowerBrakeEven!,
        self.customWeightPowerMin!,
        self.customWeightPowerMax!,
        self.customHorsePowerTorqueBreakEven!,
        self.customHorsePowerTorqueMin!,
        self.customHorsePowerTorqueMax!,
        self.customDriveTrainFactor!,
        self.customPowerWeightFactor!,
        self.customPowerBandFactor!
        ];
    }

    // {{{ ivar
    // {{{ public vars
    dynamic var tuneParam: TuneParam
    dynamic var entryExitBalanceAverage: Int {
        get {
            return self.customEntryExitBalanceAverage ?? self.tuneParam.entryExitBalanceAverage
        }
        set {
            self.customEntryExitBalanceAverage = newValue
        }
    }
    dynamic var rideHeightPercentageOfRange: Double {
        get {
            return self.customRideHeightPercentageOfRange ?? self.tuneParam.rideHeightPercentageOfRange
        }
        set {
            self.customRideHeightPercentageOfRange = newValue
        }
    }
    dynamic var springRatePercentageOfRange: Double {
        get {
            return self.customSpringRatePercentageOfRange ?? self.tuneParam.springRatePercentageOfRange
        }
        set {
            self.customSpringRatePercentageOfRange = newValue
        }
    }
    dynamic var baseSpringRateValue: Double {
        get {
            return self.customBaseSpringRateValue ?? self.tuneParam.baseSpringRateValue
        }
        set {
            self.customBaseSpringRateValue = newValue
        }
    }
    dynamic var baseDamperValue: Int {
        get {
            return self.customBaseDamperValue ?? self.tuneParam.baseDamperValue
        }
        set {
            self.customBaseDamperValue = newValue
        }
    }
    dynamic var baseAntirollBarValue: Int {
        get {
            return self.customBaseAntirollBarValue ?? self.tuneParam.baseAntirollBarValue
        }
        set {
            self.customBaseAntirollBarValue = newValue
        }
    }
    dynamic var weightPowerRatio: Double {
        get {
            return self.customWeightPowerRatio ?? self.tuneParam.weightPowerRatio
        }
        set {
            self.customWeightPowerRatio = newValue
        }
    }
    dynamic var horsePowerTorqueRatio: Double {
        get {
            return self.customHorsePowerTorqueRatio ?? self.tuneParam.horsePowerTorqueRatio
        }
        set {
            self.customHorsePowerTorqueRatio = newValue
        }
    }
    dynamic var weightPowerSpread: Double {
        get {
            return self.customWeightPowerSpread ?? self.tuneParam.weightPowerSpread
        }
        set {
            self.customWeightPowerSpread = newValue
        }
    }
    dynamic var powerBandSpread: Double {
        get {
            return self.customPowerBandSpread ?? self.tuneParam.powerBandSpread
        }
        set {
            self.customPowerBandSpread = newValue
        }
    }
    dynamic var totalSpread: Double {
        get {
            return self.customTotalSpread ?? self.tuneParam.totalSpread
        }
        set {
            self.customTotalSpread = newValue
        }
    }
    dynamic var correctedPower: Double {
        get {
            return self.customCorrectedPower ?? self.tuneParam.correctedPower
        }
        set {
            self.customCorrectedPower = newValue
        }
    }
    dynamic var correctedTorque: Double {
        get {
            return self.customCorrectedTorque ?? self.tuneParam.correctedTorque
        }
        set {
            self.customCorrectedTorque = newValue
        }
    }
    dynamic var correctedWeightDistribution: Double {
        get {
            return self.customCorrectedWeightDistribution ?? self.tuneParam.correctedWeightDistribution
        }
        set {
            self.customCorrectedWeightDistribution = newValue
        }
    }
    dynamic var weightPowerBrakeEven: Double {
        get {
            return self.customWeightPowerBrakeEven ?? self.tuneParam.weightPowerBrakeEven
        }
        set {
            self.customWeightPowerBrakeEven = newValue
        }
    }
    dynamic var weightPowerMin: Double {
        get {
            return self.customWeightPowerMin ?? self.tuneParam.weightPowerMin
        }
        set {
            self.customWeightPowerMin = newValue
        }
    }
    dynamic var weightPowerMax: Double {
        get {
            return self.customWeightPowerMax ?? self.tuneParam.weightPowerMax
        }
        set {
            self.customWeightPowerMax = newValue
        }
    }
    dynamic var horsePowerTorqueBreakEven: Double {
        get {
            return self.customHorsePowerTorqueBreakEven ?? self.tuneParam.horsePowerTorqueBreakEven
        }
        set {
            self.customHorsePowerTorqueBreakEven = newValue
        }
    }
    dynamic var horsePowerTorqueMin: Double {
        get {
            return self.customHorsePowerTorqueMin ?? self.tuneParam.horsePowerTorqueMin
        }
        set {
            self.customHorsePowerTorqueMin = newValue
        }
    }
    dynamic var horsePowerTorqueMax: Double {
        get {
            return self.customHorsePowerTorqueMax ?? self.tuneParam.horsePowerTorqueMax
        }
        set {
            self.customHorsePowerTorqueMax = newValue
        }
    }
    dynamic var driveTrainFactor: Double {
        get {
            return self.customDriveTrainFactor ?? self.tuneParam.driveTrainFactor
        }
        set {
            self.customDriveTrainFactor = newValue
        }
    }
    dynamic var powerWeightFactor: Double {
        get {
            return self.customPowerWeightFactor ?? self.tuneParam.powerWeightFactor
        }
        set {
            self.customPowerWeightFactor = newValue
        }
    }
    dynamic var powerBandFactor: Double {
        get {
            return self.customPowerBandFactor ?? self.tuneParam.powerBandFactor
        }
        set {
            self.customPowerBandFactor = newValue
        }
    }
    // }}}
    // {{{ private vars
    private var customEntryExitBalanceAverage: Int?
    private var customRideHeightPercentageOfRange: Double?
    private var customSpringRatePercentageOfRange: Double?
    private var customBaseSpringRateValue: Double?
    private var customBaseDamperValue: Int?
    private var customBaseAntirollBarValue: Int?
    private var customWeightPowerRatio: Double?
    private var customHorsePowerTorqueRatio: Double?
    private var customWeightPowerSpread: Double?
    private var customPowerBandSpread: Double?
    private var customTotalSpread: Double?
    private var customCorrectedPower: Double?
    private var customCorrectedTorque: Double?
    private var customCorrectedWeightDistribution: Double?
    private var customWeightPowerBrakeEven: Double?
    private var customWeightPowerMin: Double?
    private var customWeightPowerMax: Double?
    private var customHorsePowerTorqueBreakEven: Double?
    private var customHorsePowerTorqueMin: Double?
    private var customHorsePowerTorqueMax: Double?
    private var customDriveTrainFactor: Double?
    private var customPowerWeightFactor: Double?
    private var customPowerBandFactor: Double?
    // }}}
    // }}}
}
