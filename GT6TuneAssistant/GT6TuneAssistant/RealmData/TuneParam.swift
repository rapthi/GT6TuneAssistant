//
//  TuneParam.swift
//  GT6TuneAssistant
//
//  Created by Thierry Rapillard on 22/10/14.
//  Copyright (c) 2014 Quantesys. All rights reserved.
//

import Foundation
import Realm

enum WheelDriveType: Int {
    case FWD = 1, RWD, AWD
}

enum PowerMeasurement: Int {
    case HP = 1, KW, PS
}

enum TorqueMeasurement: Int {
    case KGFM = 1, LBFT, NM
}

class TuneParam : RLMObject {
    // {{{ ivar
    // {{{ Vehicules specs
    dynamic var power = 0
    dynamic var torque = 0
    dynamic var weight = 0
    dynamic var frontWeightDistribution = 0.5
    dynamic var nbGears = 3
    dynamic var wheelDrive = WheelDriveType.FWD.rawValue
    // }}}
    // {{{ Suspension params
    dynamic var minFrontRideHeight = 0
    dynamic var maxFrontRideHeight = 0
    dynamic var minRearRideHeight = 0
    dynamic var maxRearRideHeight = 0
    dynamic var defaultFrontSpringRate = 0.0
    dynamic var minFrontSpringRate = 0.0
    dynamic var maxFrontSpringRate = 0.0
    dynamic var defaultRearSpringRate = 0.0
    dynamic var minRearSpringRate = 0.0
    dynamic var maxRearSpringRate = 0.0
    // }}}
    // {{{ Handling adjustment
    dynamic var suspensionLevel = 0
    dynamic var cornerEntryBalance = 0
    dynamic var cornerExitBalance = 0
    dynamic var baseCamberAngle = 0.0
    dynamic var lsdStrength = 0
    // }}}
    // {{{ Transmission adjustment
    dynamic var spread = 1.0
    dynamic var scale = 1.0
    // }}}
    // {{{ Aerodynamics
    dynamic var maxFrontDownForce = 0
    dynamic var maxRearDownForce = 0
    // }}}

    // {{{ computed variables
    func ignoredProperties() -> NSArray {
        return [
            self.entryExitBalanceAverage,
            self.rideHeightPercentageOfRange,
            self.springRatePercentageOfRange,
            self.baseSpringRateValue,
            self.baseDamperValue,
            self.baseAntirollBarValue,
            self.weightPowerRatio,
            self.horsePowerTorqueRatio,
            self.weightPowerSpread,
            self.powerBandSpread,
            self.totalSpread,
            self.correctedPower,
            self.correctedTorque,
            self.correctedWeightDistribution,
            self.weightPowerBrakeEven,
            self.weightPowerMin,
            self.weightPowerMax,
            self.horsePowerTorqueBreakEven,
            self.horsePowerTorqueMin,
            self.horsePowerTorqueMax,
            self.driveTrainFactor,
            self.powerWeightFactor,
            self.powerBandFactor
        ];
    }
    
    var entryExitBalanceAverage: Int {
        get {
            return (self.cornerEntryBalance
                    + self.cornerExitBalance) / 2
        }
    }

    var rideHeightPercentageOfRange: Double {
        get {
            return 0.75 - (0.15 * Double(self.suspensionLevel))
        }
    }

    var springRatePercentageOfRange: Double {
        get {
            return Double(self.suspensionLevel) / 6.0
        }
    }

    var baseSpringRateValue: Double {
        get {
            return ((self.minFrontSpringRate + self.springRatePercentageOfRange
                        * (self.maxFrontSpringRate - self.minFrontSpringRate))
                   + (self.minRearSpringRate + self.springRatePercentageOfRange
                        * (self.maxRearSpringRate - self.minRearSpringRate)))
                / 2.0
        }
    }

    var baseDamperValue: Int {
        get {
            return self.suspensionLevel + 4
        }
    }

    var baseAntirollBarValue: Int {
        get {
            return self.suspensionLevel + 1
        }
    }

    var weightPowerRatio: Double {
        get {
            return Double(self.weight) / self.correctedPower
        }
    }

    var horsePowerTorqueRatio: Double {
        get {
            return self.correctedPower / self.correctedTorque
        }
    }

    var weightPowerSpread: Double {
        get {
            let powerValueMin = self.weightPowerRatio < self.weightPowerMin ? self.weightPowerMin - self.weightPowerRatio : 0.0
            let powerValueMax = self.weightPowerRatio > self.weightPowerMax ? self.weightPowerMax - self.weightPowerRatio : 0.0
            return (1.0 - self.powerWeightFactor)
                    + self.powerWeightFactor
                    * (
                        sqrt(self.weightPowerRatio + powerValueMin + powerValueMax - self.weightPowerMin)
                        / sqrt(self.weightPowerBrakeEven - self.weightPowerMin)
                       )
        }
    }

    var powerBandSpread: Double {
        get {
            let powerValueMin = self.horsePowerTorqueRatio < self.horsePowerTorqueMin ? self.horsePowerTorqueMin - self.horsePowerTorqueRatio : 0.0
            let powerValueMax = self.horsePowerTorqueRatio > self.horsePowerTorqueMax ? self.horsePowerTorqueMax - self.horsePowerTorqueRatio : 0.0
            return (1.0 + self.powerBandFactor)
                    - self.powerBandFactor
                    * (
                        sqrt(self.horsePowerTorqueRatio + powerValueMin + powerValueMax - self.horsePowerTorqueMin)
                        / sqrt(self.horsePowerTorqueBreakEven - self.horsePowerTorqueMin)
                      )
        }
    }

    var totalSpread: Double {
        get {
            return self.weightPowerSpread * self.powerBandSpread
        }
    }

    var correctedPower: Double {
        get {
            let powerMeasurementValue  = PowerMeasurement(rawValue: NSUserDefaults.standardUserDefaults().integerForKey("POWER_MEASUREMENT"))!

            var factor = 1.0
            switch (powerMeasurementValue)
            {
                case .KW:
                    factor = 1.341
                case .PS:
                    factor = 0.986
                default:
                    factor = 1.0
            }

            return Double(self.power) * factor
        }
    }

    var correctedTorque: Double {
        get {
            let torqueMeasurementValue  = TorqueMeasurement(rawValue: NSUserDefaults.standardUserDefaults().integerForKey("TORQUE_MEASUREMENT"))!

            var factor = 1.0
            switch (torqueMeasurementValue)
            {
                case .KGFM:
                    factor = 7.233
                case .NM:
                    factor = 0.738
                default:
                    factor = 1.0
            }

            return Double(self.torque) * factor
        }
    }

    var correctedWeightDistribution: Double {
        get {
            switch self.frontWeightDistribution {
                case 0...0.4:
                    return 0.4
                case 0.65...Double.infinity:
                    return 0.65
                default:
                    return self.frontWeightDistribution
            }
        }
    }

    let weightPowerBrakeEven = 2.75

    let weightPowerMin = 1.0/3.0

    var weightPowerMax: Double {
        get {
            return self.weightPowerMin + (self.weightPowerBrakeEven - self.weightPowerMin) * 4.0
        }
    }

    let horsePowerTorqueBreakEven = 1.0

    let horsePowerTorqueMin = 2.0/3.0

    var horsePowerTorqueMax: Double {
        get {
            return self.horsePowerTorqueMin + (self.horsePowerTorqueBreakEven - self.horsePowerTorqueMin) * 4.0
        }
    }

    let driveTrainFactor = 0.05

    let powerWeightFactor = 0.2

    let powerBandFactor = 0.2
    // }}}
}
