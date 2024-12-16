//
//  gridView.swift
//  dopaMenu
//
//  Created by Gaia Salzano on 11/12/24.
//

import SwiftUI
import SwiftData

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
}()

struct DopaMenuView: View {
    // Sample data for DopaMenus
//    struct DopaMenu {
//        let title: String
//        let date: String
//        let imageName: String?
//    }
    
    @Query var menus: [Menu]
    @State private var isPresented: Bool = false
    
//    let dopaMenus = [
//        DopaMenu(title: "Pink DopaMenu", date: "6/12/2024", imageName: "exampleImage1"),
//        DopaMenu(title: "DopaMenu 2", date: "8/12/2024", imageName: nil),
//        DopaMenu(title: "DopaMenu 3", date: "14/12/2024", imageName: nil),
//        DopaMenu(title: "DopaMenu 4", date: "16/12/2024", imageName: nil),
//        DopaMenu(title: "DopaMenu 5", date: "3/02/2025", imageName: nil),
//        DopaMenu(title: "DopaMenu 6", date: "27/1/2025", imageName: nil)
//    ]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack {
                // Title
//                Text("All DopaMenus")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .foregroundColor(Color.myColor)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.horizontal)
                
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
                        ForEach(menus) { menu in
                            VStack(alignment: .leading) {
                                Image(menu.appetizer.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 80)
                                    .cornerRadius(8)
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(menu.name)
                                        .font(.headline)
                                    Text(dateFormatter.string(from: menu.date))
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
                Button(action: {isPresented.toggle()}){
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 34, height: 34)
                        .foregroundColor(.black)
                        .padding()
                        .background(Circle().fill(Color.white))
                        .shadow(radius: 5)
                }
                .sheet(isPresented: $isPresented){
                    ProvaChat()
                }
                .padding(.bottom, 16)
            }
            .navigationTitle("All DopaMenus")
        }
    }
}

#Preview {
    DopaMenuView()
}
