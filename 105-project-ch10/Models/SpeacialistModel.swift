//
//  SpeacialistModel.swift
//  105-project-ch10
//
//  Created by Robert Vinson on 7/11/26.
//

import Foundation

class Campsite {
    let name: String
    let hookupType: String
    let minPrice: Double
    let maxPrice: Double
    let imageReference: String
    let reviewRating: Double
    let description: String

    init(
        name: String,
        hookupType: String,
        minPrice: Double,
        maxPrice: Double,
        imageReference: String,
        reviewRating: Double,
        description: String = ""
    ) {
        self.name = name
        self.hookupType = hookupType
        self.minPrice = minPrice
        self.maxPrice = maxPrice
        self.imageReference = imageReference
        self.reviewRating = reviewRating
        self.description = description
    }
}


// extension

extension Campsite {

    static let mocks: [Campsite] = [

        Campsite(name: "Riverside Pull-Through", hookupType: "Full Hookup", minPrice: 45.00, maxPrice: 65.00, imageReference: "tent", reviewRating: 4.8, description: "Spacious pull-through site along the river with full hookups. Perfect for large rigs with easy in-out access and scenic water views."),
        Campsite(name: "Shaded Back-In", hookupType: "30/50 Amp", minPrice: 35.00, maxPrice: 50.00, imageReference: "car", reviewRating: 4.9, description: "Nestled under a canopy of oaks with 30/50 amp service. Quiet and private, ideal for those seeking shade and serenity."),
        Campsite(name: "Creekside Cabin", hookupType: "Cabin", minPrice: 95.00, maxPrice: 140.00, imageReference: "house", reviewRating: 4.7, description: "Cozy cabin steps from the creek with a covered porch and rustic décor. Sleeps 4 comfortably with climate control and a mini kitchen."),
        Campsite(name: "Tent Loop Site", hookupType: "Primitive", minPrice: 20.00, maxPrice: 30.00, imageReference: "leaf", reviewRating: 4.6, description: "Primitive tent site in a secluded loop surrounded by nature. Bring your gear and enjoy the sounds of the wild with minimal amenities.")

    ]

}
