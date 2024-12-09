//
//  Untitled.swift
//  dopaMenu
//
//  Created by Gaia Salzano on 09/12/24.
import SwiftUI

struct CardView: View {
    var title: String
    var date: String
    
    var body: some View {
           VStack {
               Spacer() // Placeholder for an image or content
               VStack(alignment: .leading) {
                   Text(title)
                       .font(.headline)
                       .foregroundColor(.black)
                   Text(date)
                       .font(.subheadline)
                       .foregroundColor(.gray)
               }
               .padding()
               .frame(maxWidth: .infinity)
               .background(Color(UIColor.systemGray6))
           }
           .frame(width: 160, height: 200) // Card size
           .background(Color.white)
           .cornerRadius(12)
           .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
       }
   }


