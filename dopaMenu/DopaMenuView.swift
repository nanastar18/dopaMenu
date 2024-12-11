//
//  gridView.swift
//  dopaMenu
//
//  Created by Gaia Salzano on 11/12/24.
//

import SwiftUI

struct DopaMenuView: View {
    // Sample data for DopaMenus
    struct DopaMenu {
        let title: String
        let date: String
        let imageName: String?
    }
    
    let dopaMenus = [
        DopaMenu(title: "Pink DopaMenu", date: "6/12/2024", imageName: "exampleImage1"),
        DopaMenu(title: "DopaMenu 2", date: "8/12/2024", imageName: nil),
        DopaMenu(title: "DopaMenu 3", date: "14/12/2024", imageName: nil),
        DopaMenu(title: "DopaMenu 4", date: "16/12/2024", imageName: nil),
        DopaMenu(title: "DopaMenu 5", date: "3/02/2025", imageName: nil),
        DopaMenu(title: "DopaMenu 6", date: "27/1/2025", imageName: nil)
    ]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack {
                // Title
                Text("All DopaMenus")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.myColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                // Search Bar
                HStack {
                    TextField("Search", text: .constant(""))
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    Image(systemName: "mic.fill")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.top, 4)
                
                // Grid of DopaMenus
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(dopaMenus.indices, id: \.self) { index in
                            let dopaMenu = dopaMenus[index]
                            VStack(alignment: .leading) {
                                if let imageName = dopaMenu.imageName {
                                    Image(imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(height: 80)
                                        .cornerRadius(8)
                                } else {
                                    Color(.systemGray5)
                                        .frame(height: 80)
                                        .cornerRadius(8)
                                }
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(dopaMenu.title)
                                        .font(.headline)
                                    Text(dopaMenu.date)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding([.leading, .bottom], 8)
                            }
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                        }
                    }
                    .padding()
                }
                
                // Floating Button
                Button(action: {
                    // Handle button tap
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 34, height: 34)
                        .foregroundColor(.black)
                        .padding()
                        .background(Circle().fill(Color.white))
                        .shadow(radius: 5)
                }
                .padding(.bottom, 16)
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    DopaMenuView()
}
