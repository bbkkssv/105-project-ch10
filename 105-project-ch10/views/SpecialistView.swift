//
//  SpecialistView.swift
//  105-project-ch10
//
//  Created by Robert Vinson on 7/11/26.
//

import SwiftUI

struct SpecialistView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                headerSection
                contentSection
            }
            .background(Color("MainColor"))
        }
    }

    private var headerSection: some View {
        VStack(spacing: 22) {
            Text("Find Your\nBeauty Specialist")
                .font(.largeTitle.bold())
                .foregroundStyle(Color.white)
                .multilineTextAlignment(.center)
                .padding(.top, 24)
                .accessibilityLabel("Find your beauty specialist")
                .accessibilityAddTraits(.isHeader)
                .accessibilityIdentifier("specialistView.title")

            TextField("Search", text: .constant(""))
                .padding()
                .background(Color.white)
                .cornerRadius(5)
                .padding(.horizontal, 42)
                .accessibilityLabel("Search")
                .accessibilityValue("")
                .accessibilityHint("Enter a specialist name or service to search")
                .accessibilityAddTraits(.isSearchField)
                .accessibilityIdentifier("specialistView.searchField")
        }
        .padding(.bottom, 30)
    }

    private var contentSection: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 30) {
                categoriesSection
                topSpecialistSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 28)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("SurfaceColor"))
    }

    private var categoriesSection: some View {
        VStack(spacing: 18) {
            HStack(alignment: .firstTextBaseline) {
                Text("Categories")
                    .font(.title2.bold())
                    .accessibilityLabel("Categories")
                    .accessibilityAddTraits(.isHeader)
                    .accessibilityIdentifier("specialistView.categoriesTitle")

                Spacer()

                NavigationLink(destination: CategoriesView()) {
                    Text("See All")
                        .font(.body.bold())
                        .foregroundStyle(Color("MainColor"))
                }
                .accessibilityLabel("See all categories")
                .accessibilityHint("Opens the full list of categories")
                .accessibilityAddTraits(.isLink)
                .accessibilityIdentifier("specialistView.seeAllLink")
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 18) {
                    
                    CategoryCardView(icon: "hand.raised", title: "Nails", destination: CategoriesView())
                    
                    CategoryCardView(icon: "eye", title: "Lashes", destination: BookAppointmentView())
                    
                    CategoryCardView(icon: "hand.raised", title: "Nails", destination: CategoriesView())
                    
                    CategoryCardView(icon: "eye", title: "Lashes", destination: BookAppointmentView())
                    
                    CategoryCardView(icon: "hand.raised", title: "Nails", destination: CategoriesView())
                    
                    CategoryCardView(icon: "eye", title: "Lashes", destination: BookAppointmentView())
//                    CategoryCardView()
//                    CategoryCardView()
//                    CategoryCardView()

                }
            }
        }
    }

    private var topSpecialistSection: some View {
            VStack(alignment: .leading, spacing: 18) {
                Text("Top Specialist")
                    .font(.title2.bold())
                    .accessibilityLabel("Top specialists")
                    .accessibilityAddTraits(.isHeader)
                    .accessibilityIdentifier("specialistView.topSpecialistTitle")

                VStack(spacing: 18) {
                    ForEach(Specialist.mocks, id: \.name) { specialist in
                        SpecialistCardView(specialist: specialist)
                    }
                }
            }
        }
    }
#Preview {
    SpecialistView()
}
