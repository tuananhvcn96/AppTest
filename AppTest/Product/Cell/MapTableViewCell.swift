//
//  MapTableViewCell.swift
//  AppTest
//
//  Created by T.A Savvycom on 10/18/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit
import MapKit
import SwiftyJSON

class MapTableViewCell: UITableViewCell,UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var venues = [Venue]()
    var anotionTitle: String? = ""
    var anotionSubtitle: String? = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let initialLocation = CLLocation(latitude: 37.7749, longitude: -122.431297)
        zoomMapOn(location: initialLocation)
        
        //        let sampleStarbucks = Venue(title: "Starbucks Imagination", locationName: "Imagination Street", coordinate: CLLocationCoordinate2D(latitude: 21.030314, longitude: 105.784759))
        //        mapView.addAnnotation(sampleStarbucks)
        
       // mapView.delegate = self
        fetchData()
        mapView.addAnnotations(venues)
        checkLocationServiceAuthenticationStatus()
        
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
    
//    func showPopup(sender: UIButton!) {
//
//        let popupVC = self.storyboard?.instantiateViewController(withIdentifier: "Popup") as? Popup
//        popupVC?.preferredContentSize = CGSize(width: 250, height: 150)
//        popupVC?.modalPresentationStyle = UIModalPresentationStyle.popover
//
//        let rect = sender.superview?.convert(sender.frame, to: self.view)
//        popupVC?.popoverPresentationController?.delegate = self;
//        popupVC?.popoverPresentationController?.sourceView = self.view
//        popupVC?.popoverPresentationController?.sourceRect = rect!
//        popupVC?.popoverPresentationController?.backgroundColor = UIColor.white
//        popupVC?.titleString = self.anotionTitle ?? ""
//        popupVC?.subtitleString = self.anotionSubtitle ?? ""
//
//        self.present(popupVC!, animated: true, completion: nil)
//    }
    
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension MapTableViewCell: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last!
        self.mapView.showsUserLocation = true
        zoomMapOn(location: location)
    }
}

extension MapTableViewCell: MKMapViewDelegate {
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
