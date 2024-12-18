import SwiftUI
import SwiftData

struct ProvaChat: View {
    let titles = ["🥨Appetizer", "🍝Main dish", "🍳Second dish", "🍰Dessert"]
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var currentMenuIndex = 0
    @State private var currentSuggestionIndex = 0
    @State private var selections: [Suggestion] = []
    @State private var isPresented: Bool = false
    @State private var bindText: String = "default"
    
    var body: some View {
        ScrollView {
            // Display the current title above the card
            if currentMenuIndex < titles.count {
                Text(titles[currentMenuIndex])
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.primary)
            }
                
            // Top Card Section
            ZStack(alignment: .bottomLeading) {
                if currentMenuIndex < 4 {
                    let dishSuggestions = Suggestion.exampleMenuChoices[currentMenuIndex]
                    let suggestion = dishSuggestions[currentSuggestionIndex]
                    Image(suggestion.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 500)
                        .overlay {
                            LinearGradient(
                                gradient: Gradient(colors: [Color.black.opacity(0.8), Color.black.opacity(0), Color.black.opacity(0)]),
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .accessibilityHidden(true)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(suggestion.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        HStack {
                            Label(suggestion.time, systemImage: "clock.arrow.circlepath")
                                .font(.subheadline)
                                .foregroundColor(.white)
                            
                            if let materials = suggestion.materials {
                                Label(materials, systemImage: "scissors")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.horizontal)
                        
                        // Show three tags using HStack
                        HStack {
                            ForEach(suggestion.tags, id: \.self) { tag in
                                TagView(label: tag)
                            }
                        }
                        .padding(.horizontal)
                        .accessibilityLabel("Tags")

                        
                        // Action Buttons
                        HStack {
                            Spacer()
                            Button(action: {
                                if selections.count >= 4 {
                                    return
                                }
                                
                                // Increment index and wrap around when reaching the end
                                currentSuggestionIndex = (currentSuggestionIndex + 1) % dishSuggestions.count
                            }) {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.black)
                            }
                            .accessibilityLabel("Discard suggestion")
                            
                            .frame(width: 80, height: 80)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                            
                            Button(action: {
                                // Select the current item's image
                                selections.append(suggestion)
                                
                                // Move to the next array or wrap up
                                if currentMenuIndex < 3 {
                                    currentMenuIndex += 1
                                    currentSuggestionIndex = 0
                                }
                                
                                if selections.count >= 4 {
                                    withAnimation {
                                        isPresented.toggle()
                                    }
                                    return
                                }
                            }) {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.myColor)
                                    .accessibilityLabel("Select button")
                            }
                            .frame(width: 80, height: 80)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                            Spacer()
                        }
                        .padding(.horizontal, 0)
                    }
                }
            }
            
            // Selected Images Scrollable Bar
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(Array(selections.enumerated()), id: \.offset) { index, selection in
                        VStack {
                            Image(selection.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
                            
                            Text(titles[index])
                                .font(.caption)
                                .foregroundColor(.primary)
                            
                            
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding()
        .customAlert(isPresented: $isPresented, textFieldInput: $bindText) { name in
            let menu = Menu(name: name, appetizer: selections[0], mainDish: selections[1], secondDish: selections[2], dessert: selections[3])
            modelContext.insert(menu)
            dismiss()
        }
        
    }
}

#Preview {
    ProvaChat()
}
