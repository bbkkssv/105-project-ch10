//
//  SpecialistCardView.swift
//  105-project-ch10
//
//  Created by Robert Vinson on 7/11/26.
//

import SwiftUI

struct CampsiteCardView: View {
    let campsite: Campsite

    @State private var isLiked: Bool = false
    @State private var isExpanded: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 14) {
                Image(systemName: campsite.imageReference)
                    .font(.system(size: 38))
                    .foregroundStyle(Color("MainColor"))
                    .frame(width: 54, height: 54)

                VStack(alignment: .leading, spacing: 4) {
                    Text(campsite.name)
                        .font(.headline.bold())
                        .foregroundStyle(Color("MainColor"))
                        .lineLimit(1)

                    Text(campsite.hookupType)
                        .font(.subheadline)
                        .foregroundStyle(.black)

                    Text("$\(campsite.minPrice, specifier: "%.2f") - $\(campsite.maxPrice, specifier: "%.2f")")
                        .font(.subheadline.bold())
                        .foregroundStyle(.black)
                }

                Spacer(minLength: 8)

                VStack(alignment: .trailing, spacing: 8) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundStyle(isLiked ? .red : .gray)

                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundStyle(.orange)

                        Text("\(campsite.reviewRating, specifier: "%.1f")")
                            .font(.caption.bold())
                            .foregroundStyle(.black)
                    }

                    NavigationLink(destination: BookAppointmentView()) {
                        Text("Book")
                            .font(.subheadline.bold())
                            .foregroundStyle(.white)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 7)
                            .background(Color("MainColor"))
                            .cornerRadius(10)
                    }
                }
            }

            if !campsite.description.isEmpty {
                VStack(alignment: .leading, spacing: 4) {
                    Text(campsite.description)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .lineLimit(isExpanded ? nil : 2)

                    Text(isExpanded ? "Read Less" : "Read More")
                        .font(.caption.bold())
                        .foregroundStyle(Color("MainColor"))
                        .onTapGesture {
                            isExpanded.toggle()
                        }
                }
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(18)
        .onTapGesture(count: 2) {
            withAnimation(.spring(response: 0.5)) {
                isLiked.toggle()
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(campsite.name), \(campsite.hookupType), rated \(String(format: "%.1f", campsite.reviewRating)) stars, price $\(String(format: "%.2f", campsite.minPrice)) to $\(String(format: "%.2f", campsite.maxPrice))")
        .accessibilityHint("Double tap to like. Double tap Book to reserve \(campsite.name)")
    }
}

#Preview {
    NavigationStack {
        CampsiteCardView(
            campsite: Campsite(
                name: "Riverside Pull-Through",
                hookupType: "Full Hookup",
                minPrice: 45,
                maxPrice: 65,
                imageReference: "tent",
                reviewRating: 4.8,
                description: "Spacious pull-through site along the river with full hookups. Perfect for large rigs with easy in-out access and scenic water views."
            )
        )
    }
}
