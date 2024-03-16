//
//  GestureVC.swift
//  Technicalisto_Project
//
//  Created by Aya Baghdadi on 3/16/24.
//

import UIKit

extension ViewController {
    
    func assignGesture(){
    
        let hoverGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleHover(_:)))
        collectionView.addGestureRecognizer(hoverGestureRecognizer)
        
    }
    
    @objc private func handleHover(_ gestureRecognizer: UILongPressGestureRecognizer) {
        let location = gestureRecognizer.location(in: collectionView)

        switch gestureRecognizer.state {
        case .began, .changed:
            if let indexPath = collectionView.indexPathForItem(at: location) {
                showHoverToast(at: location, for: indexPath)
            } else {
                dismissHoverToast()
            }
        case .ended, .cancelled:
            dismissHoverToast()
        default:
            break
        }
    }
    
}
