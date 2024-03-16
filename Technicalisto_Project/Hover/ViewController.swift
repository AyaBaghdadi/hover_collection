//
//  ViewController.swift
//
//  Created by Technicalisto.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!

    var hoverToastView: UIView?

    var myData = ["IOS" , "Android" , "Frontend" , "Backend" , "Graphic Designer" , "Tester" , "Project Manager" , "Project Coordinator" , "Team Leader" , "Technical Team Lead"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.assignXIB()
        
        self.assignGesture()

    }





}



