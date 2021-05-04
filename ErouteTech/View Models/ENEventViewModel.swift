//
//  ENEventViewModel.swift
//  ErouteTech
//
//  Created by jatin verma on 04/05/21.
//

import Foundation

class ENEventViewModel: NSObject {
    
    var events = [ENEvent]()
    weak var delegate:ENEventViewModelProtocol? = nil
    
    func loadData() {
        self.events = CoreDataFunctions.fetchEvents()
        self.delegate?.didUpdate()
    }
}

protocol ENEventViewModelProtocol: class {
    func didUpdate()
}
