//
//  SpecialistCardView.swift
//  105-project-ch10
//
//  Created by Robert Vinson on 7/11/26.
//

import SwiftUI

struct SpecialistCardView: View {
    let specialist: Specialist

    @State private var isLiked: Bool = false
    @State private var isExpanded: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 14) {
                Image(systemName: specialist.imageReference)
                    .font(.system(size: 38))
                    .foregroundStyle(Color("MainColor"))
                    .frame(width: 54, height: 54)

                VStack(alignment: .leading, spacing: 4) {
                    Text(specialist.name)
                        .font(.headline.bold())
                        .foregroundStyle(Color("MainColor"))
                        .lineLimit(1)

                    Text(specialist.specialty)
                        .font(.subheadline)
                        .foregroundStyle(.black)

                    Text("$\(specialist.minPrice, specifier: "%.2f") - $\(specialist.maxPrice, specifier: "%.2f")")
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

                        Text("\(specialist.reviewRating, specifier: "%.1f")")
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

            if !specialist.description.isEmpty {
                VStack(alignment: .leading, spacing: 4) {
                    Text(specialist.description)
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
        .accessibilityLabel("\(specialist.name), \(specialist.specialty), rated \(String(format: "%.1f", specialist.reviewRating)) stars, price $\(String(format: "%.2f", specialist.minPrice)) to $\(String(format: "%.2f", specialist.maxPrice))")
        .accessibilityHint("Double tap to like. Double tap Book to schedule an appointment with \(specialist.name)")
    }
}

#Preview {
    NavigationStack {
        SpecialistCardView(
            specialist: Specialist(
                name: "Spiderman",
                specialty: "Mohawks",
                minPrice: 999,
                maxPrice: 999,
                imageReference: "person.fill",
                reviewRating: 4.9,
                description: "Friendly neighborhood specialist with years of experience swinging into action for all your styling needs. Punctual, precise, and always on time."
            )
        )
    }
}
