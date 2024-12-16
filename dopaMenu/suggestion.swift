//
//  Untitled.swift
//  dopaMenu
//
//  Created by Gaia Salzano on 16/12/24.
//

import Foundation
import SwiftData

@Model
final class Suggestion: Identifiable {
    var id: UUID
    var imageName: String
    var title: String
    var time: String
    var materials: String?
    var tags: [String]
    
    init(id: UUID = UUID(), imageName: String, title: String, time: String, materials: String?, tags: [String]) {
        self.id = id
        self.imageName = imageName
        self.title = title
        self.time = time
        self.materials = materials
        self.tags = tags
    }
    
    static let appetizers: [Suggestion] = [
        Suggestion(imageName: "music", title: "Listen to music", time: "20 minutes", materials: nil, tags: ["Outside", "Creativity boost", "Alone time"]),
        Suggestion(imageName: "cinnamon", title: "Bake something", time: "1 hour", materials: nil, tags: ["Cooking", "At home", "Hygge"]),
        Suggestion(imageName: "cat", title: "Pet a puppy", time: "10 minutes", materials: nil, tags: ["Animals", "Love", "At home"]),
        Suggestion(imageName: "teaTime", title: "Go out for tea", time: "2 hours", materials: nil, tags: ["Outside", "Prize", "Friends"])
    ]
    
    static let mainDish: [Suggestion] = [
        Suggestion(imageName: "carabiner", title: "Tab Friends", time: "15 minutes", materials: "3 materials needed", tags: ["Friendship", "Easy", "Gift idea"]),
        Suggestion(imageName: "keychains", title: "Cute keychains", time: "30 minutes", materials: "4 materials needed", tags: ["Drawing", "Pastel", "Personalized"]),
        Suggestion(imageName: "miffy", title: "Felt charms", time: "1 hour", materials: "5 materials needed", tags: ["Sewing","Feel good","Charms"]),
        Suggestion(imageName: "books", title: "Scrap fabric project", time: "2 hours", materials: "6 materials needed", tags: ["Sewing","Recycle","Colorful"])
    ]
    
    static let secondDish: [Suggestion] = [
        Suggestion(imageName: "yoga", title: "Practice yoga", time: "1 hour", materials: nil, tags: ["Heathy", "At home", "Mindfulness"]),
        Suggestion(imageName: "shower", title: "Everything shower", time: "1.5 hours", materials: nil, tags: ["Relaxing", "At home", "Self care"]),
        Suggestion(imageName: "mask", title: "Do a face mask", time: "15 minutes", materials: nil, tags: ["Relaxing", "At home", "Self care"]),
        Suggestion(imageName: "nails", title: "Paint your nails", time: "30 minutes", materials: nil, tags: ["Creativity boost", "Self care", "Personalization"]),
    ]
    
    static let dessert: [Suggestion] = [
        Suggestion(imageName: "movie", title: "Watch a movie", time: "2.5 hours", materials: nil, tags: ["Hygge", "At home", "Relaxing"]),
        Suggestion(imageName: "hosting", title: "Host a meetup", time: "3 hours", materials: nil, tags: ["Friends", "Cooking", "Creative"]),
        Suggestion(imageName: "grocery", title: "Go grocery shopping", time: "1.5 hours", materials: nil, tags: ["Useful", "Outside", "Healthy"]),
        Suggestion(imageName: "journal", title: "Scrap book", time: "1 hour", materials: nil, tags: ["mindfulness", "relaxing", "creativity boost"])
    ]
    
    static let exampleMenuChoices = [appetizers, mainDish, secondDish, dessert]
}

@Model
final class Menu: Identifiable {
    var id: UUID
    var name: String
    var date: Date
    var appetizer: Suggestion
    var mainDish: Suggestion
    var secondDish: Suggestion
    var dessert: Suggestion
    
    init(id: UUID = UUID(), name: String, appetizer: Suggestion, mainDish: Suggestion, secondDish: Suggestion, dessert: Suggestion) {
        self.id = id
        self.name = name
        self.date = Date()
        self.appetizer = appetizer
        self.mainDish = mainDish
        self.secondDish = secondDish
        self.dessert = dessert
    }
}
