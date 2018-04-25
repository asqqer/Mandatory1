//
//  SecondViewController.swift
//  mandatory1
//
//  Created by Asger Deleuran on 4/22/18.
//  Copyright © 2018 Asger Deleuran. All rights reserved.
//

import UIKit
import MapKit

final class annotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    init(cordinates: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = cordinates
        self.subtitle = subtitle
        self.coordinate = cordinates
        
        super.init()
    }
    
    var region: MKCoordinateRegion{
        let span = MKCoordinateSpanMake(0.05, 0.05)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
}

class SecondViewController: UIViewController, MKMapViewDelegate{
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        let startcordinates = CLLocationCoordinate2D(latitude: 42, longitude: -71)
        let firstplaceAnnotation = annotation(cordinates: startcordinates, title: "firstplace", subtitle: "firstplace to visit")
        
        mapView.addAnnotation(firstplaceAnnotation)
        mapView.setRegion(firstplaceAnnotation.region, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? MKMarkerAnnotationView{
            annotation.animatesWhenAdded = true
            annotation.titleVisibility = .adaptive
            annotation.subtitleVisibility = .adaptive
        }
        return nil
    }

}

