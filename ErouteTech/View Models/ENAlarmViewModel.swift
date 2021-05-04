//
//  ENAlarmViewModel.swift
//  ErouteTech
//
//  Created by jatin verma on 04/05/21.
//

import Foundation

class ENAlarmViewModel: NSObject {
    
    var alarms = [ENAlarm]()
    weak var delegate:ENAlarmViewModelProtocol? = nil
    
    func loadData() {
        self.alarms = CoreDataFunctions.fetchAlarms()
        self.delegate?.didUpdate()
    }
}

protocol ENAlarmViewModelProtocol: class {
    func didUpdate()
}
