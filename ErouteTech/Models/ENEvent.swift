//
//  ENEvent.swift
//  ErouteTech
//
//  Created by jatin verma on 04/05/21.
//

import Foundation


class ENEvent {
    var title:String!
    var desc:String!
    var lat:Double!
    var long:Double!
    
    init(title: String, desc: String, lat: Double, long: Double) {
        self.title = title
        self.desc = desc
        self.lat = lat
        self.long = long
    }
}
