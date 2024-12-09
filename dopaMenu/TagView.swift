//
//  TagView.swift
//  dopaMenu
//
//  Created by Gaia Salzano on 09/12/24.
//

import SwiftUI

struct TagView: View {
    let label: String
    
    var body: some View {
        Text(label)
            .font(.footnote)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color(UIColor.systemGray5))
            .cornerRadius(12)
            .foregroundColor(.black)
    }
}


#Preview {
    TagView(label: "Caro")
}
