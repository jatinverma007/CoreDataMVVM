//
//  AlarmViewController.swift
//  ErouteTech
//
//  Created by JATIN VERMA on 04/05/21.
//

import UIKit

class AlarmViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AlarmAddEditViewControllerProtocol, ENAlarmViewModelProtocol {

    @IBOutlet weak var tableView: UITableView!
    
    var alarmModel = ENAlarmViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alarmModel.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "ENAlarmTableViewCell", bundle: nil), forCellReuseIdentifier: "ENAlarmTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        alarmModel.loadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return alarmModel.alarms.count == 0 ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmModel.alarms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ENAlarmTableViewCell", for: indexPath) as! ENAlarmTableViewCell
        let amAttr: [NSAttributedString.Key : Any] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : UIFont.systemFont(ofSize: 20.0)]
        let str = NSMutableAttributedString(string: alarmModel.alarms[indexPath.row].date.formattedTime, attributes: amAttr)
        let timeAttr: [NSAttributedString.Key : Any] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : UIFont.systemFont(ofSize: 45.0)]
        str.addAttributes(timeAttr, range: NSMakeRange(0, str.length-2))
        cell.firstLabel?.attributedText = str
        if alarmModel.alarms[indexPath.row].snooze {
            cell.secondLabel.text = "Snooze: On"
        }
        else {
            cell.secondLabel.text = "Snooze: Off"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlarmAddEditViewController") as! AlarmAddEditViewController
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    func didTapUpdateView() {
        alarmModel.loadData()
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

    @IBAction func cancelTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
