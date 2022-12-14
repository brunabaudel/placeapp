//
//  ContentView.swift
//  Place
//
//  Created by Bruna Baudel on 18/11/2022.
//

import SwiftUI
import UIKit

struct BrowseView: View {
    
    @State var segmentationSelection: BrowseSection = .categories
    
    init() {
        initSettup()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Browse")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.top, 28)
                    .accessibilityLabel("Welcome, Bruna! What are you looking for today?")
                
                HStack {
                    Picker("", selection: $segmentationSelection) {
                        ForEach(BrowseSection.allCases, id: \.self) { option in
                            Text(option.rawValue)
                                .fontWeight(.thin)
                                .tag(option)
                                .accessibilityLabel("Browse \(option.rawValue)")
                        }
                    }
                    .pickerStyle(.segmented)
                    .fixedSize(horizontal: true, vertical: false)
                    .padding(0)
                    
                    Spacer()
                }
                
                Divider()
                    .padding(0)
                
                displayCorrectView(segmentationSelection)
            }
            .navigationTitle("")
        }
        .tint(.white)
        .edgesIgnoringSafeArea(.all)
    }
    
    private func displayCorrectView(_ selectedOption: BrowseSection) -> some View {
        switch selectedOption {
        case .categories:
            return MainListView(listModel: categoryList)
        case .roomSets:
            return MainListView(listModel: roomSetsList)
        }
    }
}
