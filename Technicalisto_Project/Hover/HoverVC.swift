//
//  HoverVC.swift
//  Technicalisto_Project
//
//  Created by Aya Baghdadi on 3/16/24.
//

import UIKit

extension ViewController {
    
     func showHoverToast(at location: CGPoint, for indexPath: IndexPath) {
         
        dismissHoverToast() // Dismiss any existing toast

        guard let cellAttributes = collectionView.layoutAttributesForItem(at: indexPath) else {
            return
        }

        let toastWidth = cellAttributes.frame.width + 8
        let toastOriginX = location.x - toastWidth / 2

        let toastOriginY = cellAttributes.frame.origin.y + cellAttributes.frame.height + 8

        let label = UILabel()
        label.text = "( \(indexPath.row + 1) ) \(self.myData[indexPath.row])"
        label.textAlignment = .center
        label.textColor = UIColor(named: "color_white")
        label.font = UIFont.systemFont(ofSize: 12) // Set font size
        label.numberOfLines = 0 // Allow multiple lines

        let labelSize = label.sizeThatFits(CGSize(width: toastWidth - 16, height: .greatestFiniteMagnitude))
        let toastHeight = labelSize.height + 16 // Add some padding

        let toastView = UIView(frame: CGRect(x: toastOriginX, y: toastOriginY, width: toastWidth, height: toastHeight))
        toastView.backgroundColor = UIColor(named: "color_black") // Set background color for toast
        toastView.layer.cornerRadius = 8
        toastView.layer.masksToBounds = true

        label.frame = CGRect(x: 8, y: 8, width: toastWidth - 16, height: labelSize.height)

        toastView.addSubview(label)

        self.view.addSubview(toastView)
        self.hoverToastView = toastView
         
    }

     func dismissHoverToast() {
        hoverToastView?.removeFromSuperview()
        hoverToastView = nil
    }

    
}
