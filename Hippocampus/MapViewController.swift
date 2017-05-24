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

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    
    let locationManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        getLocationFromAddress(Diary_Location)

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        
        let camera = GMSCameraPosition.camera(withLatitude: 25.013502, longitude: 121.541151, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
            
        var lat : Double = 0.0
        var lon : Double = 0.0
        let address: [String] = ["台北市大安區溫州街16巷3號","台北市大安區基隆路四段43號"]
        
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

