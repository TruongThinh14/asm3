//
//  YourApp.swift
//  asm3
//
//  Created by Thinh Nguyen Duong Truong on 15/9/24.
//


import SwiftUI

@main
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            ThreadListView(viewModel: ThreadViewModel())
//            ContentView()
        }
    }
}
