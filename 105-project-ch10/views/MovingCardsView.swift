//
//  MovingCardsView.swift
//  105-project-ch10
//
//  Created by Robert Vinson on 7/16/26.
//

import SwiftUI

struct MovingCardsView: View {
    
    @State private var cards: [String] = ["Fernanda", "Michael", "Robert", "Lemuel", "Rafael"]

    var body: some View {
        VStack {
            Text("Moving Cards")
                .font(.largeTitle)
            List{
                ForEach(cards, id: \.self) { card in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue.opacity(0.2))
                        .frame(height: 50)
                        .overlay(
                            Text(card)
                                .font(.title3)
                        )
                }
                .onMove { from, to in
                    cards.move(fromOffsets: from, toOffset: to)
                }
            }
            .environment(\.editMode, .constant(.active))
        }
        .padding(.vertical, 50)
    }
}

#Preview {
    MovingCardsView()
}
