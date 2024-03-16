//
//  collectionVC.swift
//  Technicalisto_Project
//
//  Created by Aya Baghdadi on 3/16/24.
//

import UIKit

extension ViewController {
    
    // MARK: UICollectionViewDataSource

    func assignXIB() {
        
        collectionView.register(UINib(nibName: "collectionCell", bundle: nil), forCellWithReuseIdentifier: "cell")

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 // Assuming you have 10 items
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        // Configure cell
        cell.backgroundColor = .darkGray // Set background color for demonstration
        return cell
    }

    // MARK: UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 3 - 26 , height: 120) // Adjust size as needed
    }
    
}
