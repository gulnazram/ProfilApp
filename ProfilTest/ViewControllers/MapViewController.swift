//
//  MapViewController.swift
//  ProfilTest
//
//  Created by Gulnaz on 28.10.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

 }
    //когда уже всё отобразилось
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationEnabled()
    }
    //включена ли служба геолокации
    func checkLocationEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            setupManager()
            checkAuthorization()
            
        } else {
            showAlertLocation(title: "У вас выключена служба геолокации", message: "Хотите включить?", url: URL(string: "App-Prefs:root=LOCATION_SERVICES"))
        }
    }
    

    func setupManager(){
        locationManager.delegate = self
        //точность работы местоположения, насколько точно будет работать gps
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    

    func checkAuthorization() {
        
        if CLLocationManager.locationServicesEnabled() {
        switch locationManager.authorizationStatus {
        case .authorizedAlways : //
            break
        case .authorizedWhenInUse :
            mapView.showsUserLocation = true
            break
        case .denied :
            showAlertLocation(title: "Вы запретили использование местоположения", message: "Хотите это изменить?", url: URL(string: UIApplication.openSettingsURLString))
            break
        case .restricted :
            break
        case .notDetermined :
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            break
        @unknown default:
            break
        }
     }
    }
    
    func showAlertLocation(title: String, message: String?, url: URL?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Настройки", style: .default) { (alert) in
            if let url = url {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
    
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate{
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAuthorization()
    }
}

