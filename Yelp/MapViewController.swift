//
//  MapViewController.swift
//  Yelp
//
//  Created by Vincent Duong on 2/14/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var lat: Double?
    var long: Double?
    
    //GUIDE: https://guides.codepath.com/ios/Maps
    override func viewDidLoad() {
        super.viewDidLoad()

        // set the region to display
        let centerLocation = CLLocation(latitude: lat!, longitude: long!)
//        print("\(lat!) , \(long!)")
        goToLocation(centerLocation)
        
        let storeLocation = CLLocationCoordinate2DMake(lat!, long!)
        // Drop a pin
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = storeLocation
        mapView.addAnnotation(dropPin)
    }
    
    func goToLocation(location: CLLocation) {
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(location.coordinate, span)
        mapView.setRegion(region, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "customAnnotationView"
        // custom pin annotation
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        if (annotationView == nil) {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        else {
            annotationView!.annotation = annotation
        }
        
        if #available(iOS 9.0, *) {
            annotationView!.pinTintColor = UIColor.greenColor()
        } else {
            // Fallback on earlier versions
        }
        
        return annotationView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
