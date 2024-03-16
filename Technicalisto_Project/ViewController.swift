//
//  ViewController.swift
//
//  Created by Technicalisto.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!

    private var hoverToastView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: "collectionCell", bundle: nil), forCellWithReuseIdentifier: "cell")

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

    private func showHoverToast(at location: CGPoint, for indexPath: IndexPath) {
        dismissHoverToast() // Dismiss any existing toast

        guard let cellAttributes = collectionView.layoutAttributesForItem(at: indexPath) else {
            return
        }

        let toastWidth = cellAttributes.frame.width + 8
        let toastOriginX = location.x - toastWidth / 2

        let toastOriginY = cellAttributes.frame.origin.y + cellAttributes.frame.height + 8

        let label = UILabel()
        label.text = "( \(indexPath.row + 1) ) \n Technicalisto Logo hover"
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

    private func dismissHoverToast() {
        hoverToastView?.removeFromSuperview()
        hoverToastView = nil
    }

    // MARK: UICollectionViewDataSource

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



