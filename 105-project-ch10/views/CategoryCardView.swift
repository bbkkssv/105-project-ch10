//
//  CategoryCardView.swift
//  105-project-ch10
//
//  Created by Robert Vinson on 7/11/26.
//

import SwiftUI

struct CategoryCardView<Destination: View>: View {
    let icon: String
    let title: String
    let destination: Destination

    var body: some View {
        NavigationLink {
            destination
        } label: {
            
            VStack(spacing: 8) {
                ZStack {
                    Circle()
                        .fill(Color("MainColor"))
                        .frame(width: 38, height: 38)
                    
                    Image(systemName: icon)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundStyle(.white)
                }
                
                Text(title)
                    .font(.caption.bold())
                    .foregroundStyle(.black)
            }
            .frame(width: 92, height: 92)
            .background(Color.white)
            .cornerRadius(6)
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("\(title) category")
            .accessibilityHint("Tap to view \(title) specialists")
        }
    }
}

#Preview {
    CategoryCardView(icon: "hand.raised", title: "Nails", destination: CategoriesView())
        .padding()
}

