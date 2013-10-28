/**
 * @file VehicleInfo.qml
 * @brief Container for information about vehicle.
 * Copyright (c) 2013, Ford Motor Company
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice, this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following
 * disclaimer in the documentation and/or other materials provided with the
 * distribution.
 *
 * Neither the name of the Ford Motor Company nor the names of its contributors
 * may be used to endorse or promote products derived from this software
 * without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

import QtQuick 2.0

Item {
    function isReady () {
        return {
            available: dataContainer.hmiVehicleInfoAvailable
        }
    }

    function getVehicleType() {
        return {
            "vehicleType": {
                "make": "Ford",
                "model": "Fiesta",
                "modelYear": "2013",
                "trim": "SE"
                }
        }
    }

    function getVehicleData(gps, speed, rpm, fuelLevel, fuelLevel_State, instantFuelConsumption, externalTemperature,
                            vin, prndl, tirePressure, odometer, beltStatus, bodyInformation, deviceStatus, driverBraking,
                            wiperStatus, headLampStatus, engineTorque, accPedalPosition, steeringWheelAngle, myKey, appID) {
        console.debug("enter getVehicleData()", gps, speed, rpm, fuelLevel, fuelLevel_State, instantFuelConsumption, externalTemperature,
                      vin, prndl, tirePressure, odometer, beltStatus, bodyInformation, deviceStatus, driverBraking,
                      wiperStatus, headLampStatus, engineTorque, accPedalPosition, steeringWheelAngle, myKey, appID)
/*
        var dataToSend = {};
        var functionArgs = [ "gps", "speed", "rpm", "fuelLevel", "fuelLevel_State", "instantFuelConsumption", "externalTemperature",
                        "vin", "prndl", "tirePressure", "odometer", "beltStatus", "bodyInformation", "deviceStatus", "driverBraking",
                        "wiperStatus", "headLampStatus", "engineTorque", "accPedalPosition", "steeringWheelAngle", "myKey" ]

        // no appID argument in response
        for (var i = 0; i < arguments.length - 1; i++) {
            if (arguments[i] === true) {
                dataToSend[functionArgs[i]] = dataContainer.vehicleInfoModel[functionArgs[i]];
            }
        }
*/
        return { gps: gps ? dataContainer.vehicleInfoModel.gps : undefined,
                   speed: speed ? dataContainer.vehicleInfoModel.speed : undefined

        }

        console.debug("exit getVehicleData()", dataToSend);
        return dataToSend
    }
}
