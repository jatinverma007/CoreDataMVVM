//
//  EventsViewController.swift
//  ErouteTech
//
//  Created by JATIN VERMA on 04/05/21.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddNewEventViewControllerProtocol, ENEventViewModelProtocol {

    @IBOutlet weak var tableView: UITableView!

    var eventModel = ENEventViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventModel.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "ENEventTableViewCell", bundle: nil), forCellReuseIdentifier: "ENEventTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        eventModel.loadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return eventModel.events.count == 0 ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventModel.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ENEventTableViewCell", for: indexPath) as! ENEventTableViewCell
        cell.titleLabel.text = eventModel.events[indexPath.row].title
        cell.descriptionLabel.text = eventModel.events[indexPath.row].desc
        cell.locationLabel.text = "Latitude: " + eventModel.events[indexPath.row].lat.doubleString + ", Longitude: " + eventModel.events[indexPath.row].long.doubleString
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddNewEventViewController") as! AddNewEventViewController
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    func didTapUpdateView() {
        eventModel.loadData()
    }
    
    func didUpdate() {
        tableView.reloadData()
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
