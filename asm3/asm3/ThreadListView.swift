//
//  ThreadListView.swift
//  asm3
//
//  Created by Thinh Nguyen Duong Truong on 15/9/24.
//

import Foundation
import SwiftUI

struct ThreadListView: View {
    @ObservedObject var viewModel: ThreadViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.threads) { thread in
                NavigationLink(destination: MessageListView(thread: thread, viewModel: viewModel)) {
                    Text(thread.title)
                }
            }
            .navigationTitle("Random-group3-project")
        }
    }
}
    
