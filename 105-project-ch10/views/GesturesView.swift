//
//  GesturesView.swift
//  105-project-ch10
//
//  Created by Robert Vinson on 7/16/26.
//

import SwiftUI

struct GesturesView: View {
    
    var paragraph: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis ante ac dui laoreet tempus. Donec nec consectetur nisl. Duis porta scelerisque eros ut egestas. Duis suscipit dignissim risus, eu cursus dolor vulputate nec. Mauris vel aliquet purus."
    
    @State private var isExpanded: Bool = false
    @State private var isFavorited: Bool = false
    @State private var isCardFavorited: Bool = false
    
    var body: some View {
        // MARK: - Exercise 1: Tab
        // .onTapGesture -> Text, image, stack (V,H,C)
        Text("Tap Me")
            .onTapGesture {
                print("Tapped")
            }
        
        // MARK: -Exercise 2: Expand Text with a tap
        VStack(alignment:.leading, spacing:10){
            
            Text(paragraph)
                .lineLimit(isExpanded ? nil : 2)
            
            Text(isExpanded ? "See Less" : "See More")
                .italic()
                .foregroundStyle(.blue)
                .onTapGesture {
                    //print("Tapped")
                    isExpanded.toggle()
                    
                }
            
        }
        .padding(35)
        
        // MARK: -Exercise 3: Double Tap
        Text("Double Tap Me")
            .onTapGesture(count: 2){
                print("Double Tap")
            }
        //MARK: -Exercise 4: Double Tap - like/favorite
        Image(systemName: isFavorited ? "heart.fill" : "heart")
            .foregroundStyle(isFavorited ? .red : .gray)
            .padding(20)
            .onTapGesture(count: 2) {
                isFavorited.toggle()
            }
        
        // Card
        HStack(spacing: 12) {
            Image("bob")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())


            VStack(alignment: .leading, spacing: 2) {
                Text("Robert Vinson")
                    .font(.headline)
                Text("MDI Student")
                    .font(.subheadline)
            }

            Spacer()

            Image(systemName: isCardFavorited ? "heart.fill" : "heart")
                .foregroundStyle(isCardFavorited ? .red : .gray)
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        .frame(height: 72)
        .background(Color(.systemGray6))
        .padding(.horizontal, 20)
        .onTapGesture(count: 2) {
            withAnimation(.spring(response: 0.5)) {
                isCardFavorited.toggle()
            }
        }

    }
}

#Preview {
    GesturesView()
}
