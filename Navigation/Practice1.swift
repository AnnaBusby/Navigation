//
//  SwiftUIView.swift
//  Navigation
//
//  Created by Anna Busby on 14/01/2024.
//

import SwiftUI

struct Practice1: View {
    
    @State private var path = NavigationPath()
    
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack(path: $path) {
                    VStack {
                        
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
                        
                        Button("Show 32") {
                            path.append(32)
                        }

                        Button("Show 64") {
                            path.append(64)
                        }
                    }
                    .navigationTitle($title)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(.pink)
                    .toolbarColorScheme(.dark, for: .navigationBar)
                    .toolbar {
                        ToolbarItemGroup(placement: .confirmationAction) {
                            Button("Save") {
                                //do something
                            }
                            Button("Submit") {
                                //do something
                            }
                        }
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Back") {
                                //do something
                            }
                        }
                    }
                }
        
    }
}

#Preview {
    Practice1()
}
