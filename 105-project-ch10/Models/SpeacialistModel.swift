//
//  SpeacialistModel.swift
//  105-project-ch10
//
//  Created by Robert Vinson on 7/11/26.
//

import Foundation

class Specialist {
    let name: String
    let specialty: String
    let minPrice: Double
    let maxPrice: Double
    let imageReference: String
    let reviewRating: Double
    let description: String

    init(
        name: String,
        specialty: String,
        minPrice: Double,
        maxPrice: Double,
        imageReference: String,
        reviewRating: Double,
        description: String = ""
    ) {
        self.name = name
        self.specialty = specialty
        self.minPrice = minPrice
        self.maxPrice = maxPrice
        self.imageReference = imageReference
        self.reviewRating = reviewRating
        self.description = description
    }
}


// extension

extension Specialist {
    
    static let mocks: [Specialist] = [
        
        Specialist(name: "Maria Perez", specialty: "Hair", minPrice: 599.99, maxPrice: 899.99, imageReference: "person.fill", reviewRating: 4.8, description: "Expert in color treatments and precision cuts with over 10 years of experience in high-end salons. Known for her vibrant balayage and personalized consultations."),
        Specialist(name: "Fernanda Murillo", specialty: "Nails", minPrice: 200.00, maxPrice: 400.00, imageReference: "person", reviewRating: 4.9, description: "Specializes in nail art and gel extensions. Known for intricate designs and meticulous attention to detail. Clients love her creative custom sets."),
        Specialist(name: "Rafael Cabrera", specialty: "Hair", minPrice: 399.99, maxPrice: 599.99, imageReference: "person.fill", reviewRating: 4.8, description: "Master barber offering fades, trims, and styling for all hair types. Brings a modern edge to classic cuts with a relaxed, welcoming approach."),
        Specialist(name: "Emily Carter", specialty: "Lashes", minPrice: 400.00, maxPrice: 800.00, imageReference: "person", reviewRating: 4.6, description: "Certified lash technician providing classic, hybrid, and volume lash sets. Dedicated to enhancing natural beauty with safe, long-lasting results.")
        
    ]
    
}
