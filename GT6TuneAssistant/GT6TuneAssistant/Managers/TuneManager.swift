//
//  TuneManager.swift
//  GT6TuneAssistant
//
//  Created by Thierry Rapillard on 15/10/14.
//  Copyright (c) 2014 Quantesys. All rights reserved.
//

import Foundation

class TuneManager {
    // {{{ ivar
    // Vehicules specs
    var power = 0
    var torque = 0
    var weight = 0
    var frontWeightDistribution = 50

    // Suspension params
    var minFrontRideHeight = 0
    var maxFrontRideHeight = 0
    var minRearRideHeight = 0
    var maxRearRideHeight = 0
    var defaultFrontSpringRate = 0.0
    var minFrontSpringRate = 0.0
    var maxFrontSpringRate = 0.0
    var defaultRearSpringRate = 0.0
    var minRearSpringRate = 0.0
    var maxRearSpringRate = 0.0

    // Handling adjustment
    var suspensionLevel = 1                 // [1;4]
    var cornerEntryBalance = 0              // [-3;3]
    var cornerExitBalance = 0               // [-3;3]
    var baseCamberAngle = 0.0
    var lsdStrength = 1                     // [1;4]

    // Transmission adjustment
    var spread = 100.0
    var scale = 100.0

    // Aerodynamics
    var maxFrontDownForce = 0
    var maxRearDownForce = 0
    // }}}
    init() {

    }
}