//
//  ENReminderViewModel.swift
//  ErouteTech
//
//  Created by jatin verma on 04/05/21.
//

import Foundation


class ENReminderViewModel: NSObject {
    
    var reminder = [ENReminder]()
    weak var delegate:ENReminderViewModelProtocol? = nil
    
    func loadData() {
        self.reminder = CoreDataFunctions.fetchReminders()
        self.delegate?.didUpdate()
    }
}

protocol ENReminderViewModelProtocol: class {
    func didUpdate()
}
