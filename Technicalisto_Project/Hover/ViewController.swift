//
//  ViewController.swift
//
//  Created by Technicalisto.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!

    var hoverToastView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.assignXIB()
        
        self.assignGesture()

    }





}



