//
//  AgeMyNameApp.swift
//  AgeMyName
//
//  Created by Ananya Garg on 9/15/22.
//

import SwiftUI

@main
struct AgeMyNameApp: App {
    @StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
