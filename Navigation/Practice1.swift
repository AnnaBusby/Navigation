//
//  SwiftUIView.swift
//  Navigation
//
//  Created by Anna Busby on 14/01/2024.
//

import SwiftUI

struct Practice1: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
                    VStack {
                        Button("Show 32") {
                            path.append(32)
                        }

                        Button("Show 64") {
                            path.append(64)
                        }
                        
                        
                        List {
                               ForEach(0..<5) { i in
                                   NavigationLink("Select Number: \(i)", value: i)
                               }

                               ForEach(0..<5) { i in
                                   NavigationLink("Select String: \(i)", value: String(i))
                               }
                           }
                        .navigationDestination(for: Int.self) { selection in
                            Text("You selected \(selection)")
                        }
                        .navigationDestination(for: String.self) { selection in
                            Text("You selected the string \(selection)")
                        }
                    }
                }
    }
}

#Preview {
    Practice1()
}
