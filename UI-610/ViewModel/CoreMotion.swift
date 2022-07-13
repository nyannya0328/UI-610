//
//  CoreMotion.swift
//  UI-610
//
//  Created by nyannyan0328 on 2022/07/13.
//

import SwiftUI
import CoreMotion

class CoreMotion: ObservableObject {
    @Published var manager : CMMotionManager = .init()
    
    @Published var xValue : CGFloat = 0
    
    @Published var currentSlider : Place = sample_places.first!
    
    
    func detectMotion(){
        
        if !manager.isDeviceMotionAvailable{
            
            if manager.isDeviceMotionActive{
                manager.deviceMotionUpdateInterval = 1/40
                manager.startDeviceMotionUpdates(to: .main) {[weak self] motion, err in
                    
                    if let attitude = motion?.attitude{
                        
                        self?.xValue = attitude.roll
                        
                    }
                }
                
            }
            
        }
        
    }
    func stopMotionManager(){
        
        manager.stopDeviceMotionUpdates()
    }
}
