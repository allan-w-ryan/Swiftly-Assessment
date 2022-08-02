//
//  SwiftlyCodingExerciseApp.swift
//  SwiftlyCodingExercise
//
//  Created by Allan Ryan on 7/30/22.
//

import SwiftUI

@main
struct SwiftlyCodingExerciseApp: App {
    
    var body: some Scene {
        WindowGroup {            
            ManagerSpecialsView(viewModel: ManagerSpecialsViewModel())
        }
    }
}
