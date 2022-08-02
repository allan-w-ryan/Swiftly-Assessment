//
//  ManagerSpecialsFetcher.swift
//  SwiftlyCodingExercise
//
//  Created by Allan Ryan on 7/31/22.
//

import Foundation
import os

class ManagerSpecialsViewModel: ObservableObject {
    
    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded(Canvas)
    }
    
    @Published private(set) var state = State.idle
    var presentAlert = false
    let endpoint: String = "https://raw.githubusercontent.com/Swiftly-Systems/code-exercise-ios/master/backup"
    
    func loadSpecials() {
        state = .loading
        Task {
            do {
                let responseData = try await NetworkClient(endpoint: self.endpoint).dispatchCall()
                let canvas = try JSONDecoder().decode(Canvas.self, from: responseData)
                DispatchQueue.main.async {
                    self.state = .loaded(canvas)
                }
            } catch {
                DispatchQueue.main.async {
                    self.presentAlert = true
                    self.state = .failed(error)
                }
            }
        }
    }
}
