//
//  RemindersViewController.swift
//  ErouteTech
//
//  Created by JATIN VERMA on 04/05/21.
//

import UIKit

class RemindersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddNewReminderViewControllerProtocol, ENReminderViewModelProtocol {

    @IBOutlet weak var tableView: UITableView!
    
    var reminderModel = ENReminderViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reminderModel.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "ENReminderTableViewCell", bundle: nil), forCellReuseIdentifier: "ENReminderTableViewCell")
    }
    
    func didUpdate() {
        tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reminderModel.loadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return reminderModel.reminder.count == 0 ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminderModel.reminder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ENReminderTableViewCell", for: indexPath) as! ENReminderTableViewCell
        cell.titleLabel.text = reminderModel.reminder[indexPath.row].title
        cell.descriptionLabel.text = reminderModel.reminder[indexPath.row].desc
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddNewReminderViewController") as! AddNewReminderViewController
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    func didUpdateView() {
        reminderModel.loadData()
    }


}
