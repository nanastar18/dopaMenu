//
//  SwiftUIView.swift
//  dopaMenu
//
//  Created by Gaia Salzano on 09/12/24.
//

import SwiftUI
struct CustomCardView: View {
    
    let items = [
        ("carabiner", "Tab Friends", "15 minutes", "3 materials needed"),
        ("keychains", "Cute keychains", "30 minutes", "4 materials needed"),
        ("miffy", "Felt charms", "1 hour", "5 materials needed"),
        ("books", "Scrap fabric project", "2 hours", "6 materials needed")
    ]
    
    // State to keep track of the current index
    @State private var currentIndex = 0
    
    var body: some View {
        VStack {
            // Top Image Section
            ZStack(alignment: .bottomLeading) {
                Image(items[currentIndex].0)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 560)
                    .clipped()
                    .cornerRadius(16)
                
                // Overlay Title and Info
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0.9), Color.black.opacity(0)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 150)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(items[currentIndex].1)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    HStack {
                        Label(items[currentIndex].2, systemImage: "clock.arrow.circlepath")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                        Label(items[currentIndex].3, systemImage: "scissors")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                    }
                    .padding(.horizontal)
                    // Tags Section
                    HStack {
                        TagView(label: "Keychain")
                        TagView(label: "Fast Crafts")
                        TagView(label: "Gift Idea")
                        TagView(label: "Friendship")
                    }
                    
                    
                    //Button
                    Button(action: {
                        // Increment index and wrap around when reaching the end
                        currentIndex = (currentIndex + 1) % items.count
                    })
                    {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                    }
                    .frame(width: 80, height: 80)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                    .offset(x: 50, y: 50)
                }
            }
        }
        .padding()
    }
    
    
    //.padding([.top, .horizontal])
}






#Preview {
    CustomCardView()
}
