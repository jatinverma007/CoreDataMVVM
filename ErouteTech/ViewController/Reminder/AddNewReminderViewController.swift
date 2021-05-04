//
//  AddNewReminderViewController.swift
//  ErouteTech
//
//  Created by JATIN VERMA on 04/05/21.
//

import UIKit

class AddNewReminderViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextField!
    
    weak var delegate:AddNewReminderViewControllerProtocol? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CancelBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        guard titleTextField.text != "" else {
            self.presentAlertWithTitle(title: "Enter title", message: "", options: "OK") { (option) in
            }
            return
        }
        
        guard notesTextField.text != "" else {
            self.presentAlertWithTitle(title: "Enter Notes", message: "", options: "OK") { (option) in
            }
            return
        }
        
        CoreDataFunctions.insertReminder(title: titleTextField.text!, desc: notesTextField.text!)
        self.dismiss(animated: true) {
            self.delegate?.didUpdateView()
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

protocol AddNewReminderViewControllerProtocol:class {
    func didUpdateView()
}
