//
//  MapViewController.swift
//  ePark
//
//  Created by Hasan Güzelmansur on 12.05.2021.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var dtnValue: String = ""
    
    var locationManager = CLLocationManager()
    
    var obj = IoTObj()
        
    var checkDtn : Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkDtn = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(verificarDtn), userInfo: nil, repeats: true)
        
        mapView.delegate = self
        
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        // Do any additional setup after loading the view.
        
        addCostumPin()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        
    }
    
    private func  addCostumPin() {
        
        let pinPark = MKPointAnnotation()
        let pinLoc = CLLocationCoordinate2D(latitude: 41.137439, longitude: 29.094000)
        pinPark.coordinate = pinLoc
        pinPark.title = "Park alanı"
        mapView.addAnnotation(pinPark)
        
        
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "costum")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "costum")
            annotationView?.canShowCallout = true
        }else {
            
            annotationView?.annotation = annotation
        }
            
            annotationView?.image = UIImage(named: "pi")
       
        
        return annotationView
    }

}
