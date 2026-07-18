//
//  SpecialistView.swift
//  105-project-ch10
//
//  Created by Robert Vinson on 7/11/26.
//

import SwiftUI

struct CampsiteView: View {
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
            Text("Find Your\nCampsite")
                .font(.largeTitle.bold())
                .foregroundStyle(Color.white)
                .multilineTextAlignment(.center)
                .padding(.top, 24)
                .accessibilityLabel("Find your campsite")
                .accessibilityAddTraits(.isHeader)
                .accessibilityIdentifier("campsiteView.title")

            TextField("Search", text: .constant(""))
                .padding()
                .background(Color.white)
                .cornerRadius(5)
                .padding(.horizontal, 42)
                .accessibilityLabel("Search")
                .accessibilityValue("")
                .accessibilityHint("Enter a campsite name or type to search")
                .accessibilityAddTraits(.isSearchField)
                .accessibilityIdentifier("campsiteView.searchField")
        }
        .padding(.bottom, 30)
    }

    private var contentSection: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 30) {
                categoriesSection
                topCampsitesSection
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
                    .accessibilityIdentifier("campsiteView.categoriesTitle")

                Spacer()

                NavigationLink(destination: CategoriesView()) {
                    Text("See All")
                        .font(.body.bold())
                        .foregroundStyle(Color("MainColor"))
                }
                .accessibilityLabel("See all categories")
                .accessibilityHint("Opens the full list of categories")
                .accessibilityAddTraits(.isLink)
                .accessibilityIdentifier("campsiteView.seeAllLink")
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 18) {
                    CategoryCardView(icon: "car", title: "RV Sites", destination: CategoriesView())
                    CategoryCardView(icon: "tent", title: "Tent Sites", destination: CategoriesView())
                    CategoryCardView(icon: "house", title: "Cabins", destination: CategoriesView())
                    CategoryCardView(icon: "fish", title: "Fishing", destination: CategoriesView())
                }
            }
        }
    }

    private var topCampsitesSection: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Top Campsites")
                .font(.title2.bold())
                .accessibilityLabel("Top campsites")
                .accessibilityAddTraits(.isHeader)
                .accessibilityIdentifier("campsiteView.topCampsitesTitle")

            VStack(spacing: 18) {
                ForEach(Campsite.mocks, id: \.name) { campsite in
                    CampsiteCardView(campsite: campsite)
                }
            }
        }
    }
}

#Preview {
    CampsiteView()
}
