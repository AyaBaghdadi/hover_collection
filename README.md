
# Technicalisto

## IOS Swift : Hover appear Toast in CollectionView Cell like Website

Github [@Link](https://github.com/AyaBaghdadi/hover_collection.git)

### Follow Full Code this part

```

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
    

```

### Thanks

This app is inspired by Aya Baghdadi”
and copyright for [@Technicalisto](https://www.youtube.com/channel/UC7554uvArdSxL4tlws7Wf8Q)
