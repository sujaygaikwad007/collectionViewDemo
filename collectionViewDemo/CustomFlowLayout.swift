import Foundation
import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }

        minimumInteritemSpacing = 4
        minimumLineSpacing = 4

        let itemsPerRow = 3
        let spacing = CGFloat(itemsPerRow - 1) * 4
        let width = (collectionView.bounds.width - spacing) / CGFloat(itemsPerRow)

        itemSize = CGSize(width: width, height: width)
    }
}
