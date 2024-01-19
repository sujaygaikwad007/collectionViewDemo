import UIKit
import SkeletonView

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionImage: UIImageView!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionImage.layer.cornerRadius = 10

    }
    
    
}

