//
//  ViewController.swift
//  Mappap
//
//  Created by SWUCOMPUTER on 2018. 6. 5..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var map: MKMapView!
    
    // 사용자가 선택한 Cell 인덱스를 받아옴
    var selectedIndex: Int? = nil
    // Table View에서 선택한 대학 객체를 전달받기 위함
    var univ: University? = nil
    
    var universityAnnotation: University? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func updateMap(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.map.mapType = MKMapType.standard
        case 1:
            self.map.mapType = MKMapType.satellite
        default:
            self.map.mapType = MKMapType.hybrid }
    
    }

    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        if let _ = selectedIndex {
            map.setRegion(MKCoordinateRegionMake((self.univ?.coordinate)!, MKCoordinateSpanMake(0.007, 0.007)), animated: true)
        }
        // 기존의 맵에 annotation이 있었다면 삭제  -->>> 여기를 삭제하면 만약 설여를 찍고 그다음 고대를 찍으면 지도 위에 빨간색 표시가 없어지지 않고
        // 두군데 다 찍힌다
        if let annotation = universityAnnotation {
        self.map.removeAnnotation(annotation) }
    // 새로운 annotation 위치가 있다면 추가
    if let annotation = univ {
        self.universityAnnotation = annotation
        self.map.addAnnotation(self.universityAnnotation!)
        }}

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toUnivView" {
            if let destVC = segue.destination as? UnivTableViewController {
                destVC.mainVC = self
        } }
    }
    
}

