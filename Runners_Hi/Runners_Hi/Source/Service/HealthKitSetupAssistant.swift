//
//  HealthKitSetupAssistant.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/08.
//  Copyright © 2020 김민희. All rights reserved.
//

import HealthKit

class HealthKitSetupAssistant {
  
  private enum HealthkitSetupError: Error {
    case notAvailableOnDevice
    case dataTypeNotAvailable
  }
  
  class func authorizeHealthKit(completion: @escaping (Bool, Error?) -> Swift.Void) {
    
    //1. 이 기기에서 HealthKit을 사용할 수 있는지 확인하기
    guard HKHealthStore.isHealthDataAvailable() else {
      completion(false, HealthkitSetupError.notAvailableOnDevice)
      return
    }
    
    //2. HealthKit과 상호 작용할 데이터 유형 준비하기
    guard   let walkAddRun = HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning),
            let step = HKObjectType.quantityType(forIdentifier: .stepCount),
            let activeEnergy = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned) else {
                
                
            completion(false, HealthkitSetupError.dataTypeNotAvailable)

            return
            
    }
    
    //3. HealthKit이 읽고 쓸 유형 목록 작성
    let healthKitTypesToWrite: Set<HKSampleType> = [walkAddRun,
                                                    activeEnergy,
                                                    step,
                                                    HKObjectType.workoutType()
                                                    ]
    // 걷기+달리기 거리(walkAddRun), 활동에너지(activeEnergy),운동(HKObjectType.workoutType())
    
    let healthKitTypesToRead: Set<HKObjectType> = [walkAddRun,
                                                   activeEnergy,
                                                   HKObjectType.workoutType()
                                                    ]
    
    //4.요청 승인
    HKHealthStore().requestAuthorization(toShare: healthKitTypesToWrite,
                                         read: healthKitTypesToRead) { (success, error) in
      completion(success, error)
    }
  }
}


