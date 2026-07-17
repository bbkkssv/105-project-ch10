//
//  CategoriesView.swift
//  105-project-ch10
//
//  Created by Robert Vinson on 7/11/26.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Image(systemName: "progress.indicator")
                    .font(.system(size: 34, weight: .regular))
                    .foregroundStyle(.black)

                Text("All Categories")
                    .font(.title.bold())
                    .foregroundStyle(.black)

                Text("Under Construction...")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
        }
        .navigationTitle("All Categories")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CategoriesView()
    }
}
