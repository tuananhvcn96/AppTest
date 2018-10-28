//
//  UserViewController.swift
//  AppTest
//
//  Created by Tuan Anh on 10/19/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit
import MapKit
import SwiftyJSON

class UserViewController: UIViewController,UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var imageViewIM: UIImageView!
    @IBOutlet weak var image1: UIButton!
    @IBOutlet weak var image2: UIButton!
    @IBOutlet weak var image3: UIButton!
    @IBOutlet weak var image4: UIButton!
    static let iddentifer = "UserViewController"

    
    var venues = [Venue]()
    var anotionTitle: String? = ""
    var anotionSubtitle: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let initialLocation = CLLocation(latitude: 37.7749, longitude: -122.431297)
        zoomMapOn(location: initialLocation)
        fetchData()
        mapView.addAnnotations(venues)
        checkLocationServiceAuthenticationStatus()
        mapView.delegate = self
        self.borderImage()
    }
    
    func borderImage(){
        self.imageViewIM.layer.cornerRadius = imageViewIM.frame.height / 2
        self.imageViewIM.layer.masksToBounds = true
        
        self.image1.layer.cornerRadius = image1.frame.height / 2
        self.image1.layer.masksToBounds = true
        
        self.image2.layer.cornerRadius = image2.frame.height / 2
        self.image2.layer.masksToBounds = true
        
        self.image3.layer.cornerRadius = image3.frame.height / 2
        self.image3.layer.masksToBounds = true
        
        self.image4.layer.cornerRadius = image4.frame.height / 2
        self.image4.layer.masksToBounds = true
    }
    
    func fetchData(){
        let fileName = Bundle.main.path(forResource: "Venues", ofType: "json")
        let filePath = URL(fileURLWithPath: fileName!)
        var data: Data?
        do {
            data = try Data(contentsOf: filePath, options: Data.ReadingOptions(rawValue: 0))
        } catch let error {
            data = nil
            print("Reprt error \(error.localizedDescription)")
        }

        if let jsonData = data {
            do {
                let json = try JSON(data: jsonData)
                if let venueJSONs = json["response"]["venues"].array {
                    for venueJSON in venueJSONs {
                        if let venue = Venue.from(json: venueJSON){
                            self.venues.append(venue)
                        }
                    }
                }
            } catch {
                print("error")
            }

        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        // This *forces* a popover to be displayed on the iPhone
        return .none
    }
    
    let regionRadius: CLLocationDistance = 1000 // 1km ~ 1 mile = 1.6km
    func zoomMapOn(location: CLLocation)
    {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    var locationManager = CLLocationManager()
    
    func checkLocationServiceAuthenticationStatus(){
        locationManager.delegate = self
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
}

extension UserViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last!
        self.mapView.showsUserLocation = true
        zoomMapOn(location: location)
    }
}

extension UserViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "pin"
        var annotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as! AniitationView?
        
        if annotationView == nil {
            
            annotationView = AniitationView(annotation: annotation, reuseIdentifier: identifier)
            guard let title = annotation.title! else { return nil }
            guard let antionsubtitle = annotation.subtitle! else { return nil }
            //            self.anotionTitle = title
            //            self.anotionSubtitle = antionsubtitle
            annotationView?.annotation = annotation
            
        }
        let pinImage = UIImage.init(named: "iconMenuLocationBig")
        annotationView?.frame = CGRect(x: 0, y: 0, width: (pinImage?.size.width)!, height: (pinImage?.size.width)!)
        annotationView?.mapPin = UIButton(frame: (annotationView?.frame)!);
        //annotationView?.mapPin.addTarget(self, action: #selector(MapViewController.showPopup(sender:)), for: .touchUpInside)
        
        annotationView?.addSubview((annotationView?.mapPin)!)
        annotationView?.mapPin.setImage(pinImage, for: .normal)
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let annotationView = view as! AniitationView
        self.anotionTitle = (view.annotation?.title)!
        self.anotionSubtitle = (view.annotation?.subtitle)!
        //showPopup(sender: annotationView.mapPin)
        //annotationView.mapPin.addTarget(self, action: #selector(MapViewController.showPopup(sender:)), for: .touchUpInside)
    }
}

