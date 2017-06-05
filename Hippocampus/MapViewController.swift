//
//  MapViewController.swift
//  Hippocampus
//
//  Created by Eileen on 2017/5/2.
//  Copyright © 2017年 Eileen. All rights reserved.
//  
//

import UIKit
import GoogleMaps
import SwiftyJSON
import Firebase

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    
    let locationManager = CLLocationManager()
    var currentLocation = CLLocation()
    var sheet = [diary]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 配置 locationManager
        locationManager.delegate = self;
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
        
        
        
        ref = FIRDatabase.database().reference().child("diary")
        ref.observe(FIRDataEventType.value, with:{(snapshot) in
            if snapshot.childrenCount>0
            {
                self.sheet.removeAll()
                
                for d in snapshot.children.allObjects as![FIRDataSnapshot]
                {
                    let sheetOjbect = d.value as? [String: AnyObject]
                    let sheettitle = sheetOjbect?["title"] as! String?
                    let sheetdate = sheetOjbect?["date"] as! String?
                    let sheetcomment = sheetOjbect?["comment"] as! String?
                    let sheetlocation = sheetOjbect?["location"] as! String?
                    let sheetweather = sheetOjbect?["weather"] as! String?
                    let sheettag = sheetOjbect?["tag"] as! String?
                    let sheetdata = diary(title: sheettitle, date: sheetdate, comment: sheetcomment, location: sheetlocation, weather: sheetweather, tag: sheettag)
                    self.sheet.append(sheetdata)
                }
            }
        })
        print("=================================")
        print(sheet.count)
        print("=================================")

        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView() {
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        
        let camera = GMSCameraPosition.camera(withLatitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
            
        var lat : Double = 0.0
        var lon : Double = 0.0
        var address = [String]()
        
        for j in stride(from: 0, to: sheet.count, by: 1){
            address.append(sheet[j].location!)
            print(sheet[j].location!)
        }
        
        for i in address{

            do {
                
                let url = String(format: "https://maps.google.com/maps/api/geocode/json?sensor=false&address=%@", (i.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!))
                let result = try Data(contentsOf: URL(string: url)!)
                let json = JSON(data: result)
                
                lat = json["results"][0]["geometry"]["location"]["lat"].doubleValue
                lon = json["results"][0]["geometry"]["location"]["lng"].doubleValue
                
            }
            catch let error{
                print(error)
            }
            
            
            // Creates a marker in the center of the map.
            let marker = GMSMarker()
            marker.tracksInfoWindowChanges = true
            marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(lon))
            marker.title = "Taipei"
            marker.snippet = "NTUST"
            marker.map = mapView
        }
    
    }
}

