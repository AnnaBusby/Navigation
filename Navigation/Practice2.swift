//
//  Practice2.swift
//  Navigation
//
//  Created by Anna Busby on 14/01/2024.
//

import SwiftUI

struct DetailView: View {
    
    var number: Int
    
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number \(number)")
            .toolbar{
                Button("Home") {
                    path = NavigationPath()
                }
            }
    }
}

struct Practice2: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                DetailView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    Practice2()
}
