//
//  SwiftUIView.swift
//  dopaMenu
//
//  Created by Gaia Salzano on 13/12/24.
//
import SwiftUI

struct CustomAlertModifier: ViewModifier {
    @Binding var isPresented: Bool
    @Binding var textFieldInput: String
    let onClickSave: () -> Void
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .blur(radius: isPresented ? 2 : 0)
            
            if isPresented {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Your Dopamenu is ready!")
                        .font(.headline)
                    
                    Text("Add a title.")
                        .font(.subheadline)
                    
                    TextField("...", text: $textFieldInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    HStack {
                        Button("Cancel") {
                            isPresented = false
                        }
                        .foregroundColor(.red)
                        
                        Button("Save") {
                            isPresented = false
                            // Save action logic here
                        }
                        .foregroundColor(.blue)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 20)
                .frame(maxWidth: 300)
            }
        }
    }
}

extension View {
    func customAlert(isPresented: Binding<Bool>, textFieldInput: Binding<String>, onClickSave: @escaping () -> Void) -> some View {
        self.modifier(CustomAlertModifier(isPresented: isPresented, textFieldInput: textFieldInput, onClickSave: onClickSave))
    }
}

//
//#Preview {
//    CustomAlertModifier(isPresented: .constant(true), textFieldInput: .constant("ciao"))
//}
