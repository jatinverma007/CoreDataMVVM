//
//  AddNewEventViewController.swift
//  ErouteTech
//
//  Created by JATIN VERMA on 04/05/21.
//

import UIKit
import CoreLocation

class AddNewEventViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextField!
    @IBOutlet weak var selectLocation: UIButton!
    
    var location:CLLocation! {
        didSet {
            selectLocation.setTitle("Selected", for: .normal)
        }
    }
    private var locationManager = CLLocationManager()
    
    weak var delegate:AddNewEventViewControllerProtocol? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func CancelBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func selectLocationTapped(_ sender: UIButton) {
        if CLLocationManager.locationServicesEnabled() {
            switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.activityType = .other
                locationManager.distanceFilter = kCLDistanceFilterNone
                locationManager.requestAlwaysAuthorization()
                locationManager.startUpdatingLocation()
                break
            case .restricted, .denied:
                let alert = UIAlertController(title: "Allow Location Access", message: "LocationTracker needs access to your location. Turn on Location Services in your device settings.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Settings", style: UIAlertAction.Style.default, handler: { action in
                    guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                        return
                    }
                    if UIApplication.shared.canOpenURL(settingsUrl) {
                        UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                            print("Settings opened: \(success)")
                        })
                    }
                }))
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            case .authorizedAlways, .authorizedWhenInUse:
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.requestAlwaysAuthorization()
                locationManager.startUpdatingLocation()
            @unknown default:
                break
            }
        } else {
            let alert = UIAlertController(title: "Allow Location Access", message: "LocationTracker needs access to your location. Turn on Location Services in your device settings.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Settings", style: UIAlertAction.Style.default, handler: { action in
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                if UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                        print("Settings opened: \(success)")
                    })
                }
            }))
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
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
        
        guard location != nil else {
            self.presentAlertWithTitle(title: "Select Location", message: "", options: "OK") { (option) in
            }
            return
        }
        
        CoreDataFunctions.insertEvent(title: titleTextField.text ?? "", desc: notesTextField.text ?? "", lat: location.coordinate.latitude, long: location.coordinate.longitude)
        self.dismiss(animated: true) {
            self.delegate?.didTapUpdateView()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.last{
            self.location = loc
            self.locationManager.stopUpdatingLocation()
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

protocol AddNewEventViewControllerProtocol: class {
    func didTapUpdateView()
}
