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
    var lat : Double = 0.0
    var lon : Double = 0.0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 配置 locationManager
        locationManager.delegate = self;
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
        
        let camera = GMSCameraPosition.camera(withLatitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        //從 firebase 上讀取資料
        ref = FIRDatabase.database().reference().child("diary")
        ref.observe(FIRDataEventType.value, with:{(snapshot) in
            if snapshot.childrenCount>0
            {
                self.sheet.removeAll()
                
                for d in snapshot.children.allObjects as![FIRDataSnapshot]
                {
                    let sheetOjbect = d.value as! [String: Any]
                    
                    let sheetdate = sheetOjbect["date"] as! String
                    let sheetlocation = sheetOjbect["location"] as! String
                    let sheettitle = sheetOjbect["title"] as! String
                    
                    
                    //地址轉經緯度
                    do {
                        
                        let url = String(format: "https://maps.google.com/maps/api/geocode/json?sensor=false&address=%@", (sheetlocation.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed))!)
                        let result = try Data(contentsOf: URL(string: url)!)
                        let json = JSON(data: result)
                        
                        self.lat = json["results"][0]["geometry"]["location"]["lat"].doubleValue
                        self.lon = json["results"][0]["geometry"]["location"]["lng"].doubleValue
                        
                    }
                    catch let error{
                        print(error)
                    }
                    
                    
                    // Creates a marker in the center of the map.
                    let marker = GMSMarker()
                    marker.tracksInfoWindowChanges = true
                    marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(self.lat), longitude: CLLocationDegrees(self.lon))
                    marker.title = sheettitle
                    marker.snippet = sheetdate
                    marker.map = mapView
                    
                }

            }
                
        })
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

