import SwiftUI

struct ProvaChat: View {
    // Define data with three tags
    let items2 = [
        ("carabiner", "Tab Friends", "15 minutes", "3 materials needed", "friendship", "easy", "gift idea"),
        ("keychains", "Cute keychains", "30 minutes", "4 materials needed", "drawing", "pastel", "personalized"),
        ("miffy", "Felt charms", "1 hour", "5 materials needed", "sewing", "charms", "feel good"),
        ("books", "Scrap fabric project", "2 hours", "6 materials needed", "sewing", "recycle", "colorful")
    ]
    
    let items = [
        ("music", "Listen to music", "20 minutes", "3 materials needed", "outside", "creativity boost", "alone time"),
        ("cinnamon", "Bake something", "1 hour", "4 materials needed", "cooking", "at home", "hygge"),
        ("cat", "Pet a puppy", "10 minutes", "5 materials needed", "animals", "love", "hygge"),
        ("teaTime", "Go out for tea", "2 hours", "6 materials needed", "outside", "prize", "friends")
    ]

    let items3 = [
        ("yoga", "Practice yoga", "1 hour", "4 materials needed", "healthy", "mindfulness", "at home"),
        ("shower", "Everything shower", "1.5 hours", "0 materials needed", "relaxing", "at home", "self care"),
        ("mask", "Do a face mask", "15 minutes", "1 material needed", "relaxing", "at home", "self care"),
        ("nails", "Paint your nails", "30 minutes", "0 materials needed", "creativity boost", "self care", "personalization")
    ]
    
    let items4 = [
        ("movie", "Watch a movie", "2.5 hours", "1 material needed", "hygge", "relaxing", "at home"),
        ("hosting", "Host a meetup", "3 hours", "2 materials needed", "friends", "cooking", "creative"),
        ("grocery", "Go grocery shopping", "1.5 hours", "5 materials needed", "useful", "outside", "healthy"),
        ("journal", "Scrap book", "1 hour", "1 material needed", "mindfulness", "relaxing", "creativity boost")
    ]
    
    // Combine all items
    let allItems: [[(String, String, String, String, String, String, String)]]
    let titles = ["🥨Appetizer", "🍝Main dish", "🍳Second dish", "🍰Dessert"]
    
    @State private var currentArray = 0
    @State private var currentIndex = 0
    @State private var selections: [String] = []
    
    init() {
        allItems = [items, items2, items3, items4]
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // Display the current title above the card
            if currentArray < titles.count {
                Text(titles[currentArray])
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.primary)
            }
                
            // Top Card Section
            ZStack(alignment: .bottomLeading) {
                if currentArray < allItems.count {
                    let currentItems = allItems[currentArray]
                    Image(currentItems[currentIndex].0)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 560)
                        .cornerRadius(16)
                    
                    // Overlay Title and Info
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.9), Color.black.opacity(0)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 150)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(currentItems[currentIndex].1)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        HStack {
                            Label(currentItems[currentIndex].2, systemImage: "clock.arrow.circlepath")
                                .font(.subheadline)
                                .foregroundColor(.white)
                            
                            Label(currentItems[currentIndex].3, systemImage: "scissors")
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)
                        
                        // Show three tags using HStack
                        HStack {
                            TagView(label: currentItems[currentIndex].4)
                            TagView(label: currentItems[currentIndex].5)
                            TagView(label: currentItems[currentIndex].6)
                        }
                        .padding(.horizontal)
                        
                        // Action Buttons
                        HStack {
                            Spacer()
                            Button(action: {
                                // Increment index and wrap around when reaching the end
                                currentIndex = (currentIndex + 1) % currentItems.count
                            }) {
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
                            
                            Button(action: {
                                // Select the current item's image
                                selections.append(currentItems[currentIndex].0)
                                
                                // Move to the next array or wrap up
                                if currentArray < allItems.count - 1 {
                                    currentArray += 1
                                    currentIndex = 0
                                }
                            }) {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.myColor)
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
                            Image(selection)
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
    }
}

#Preview {
    ProvaChat()
}
