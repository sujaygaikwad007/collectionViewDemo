
import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var collectionImage: UIImageView!
    
    private let shimmerView = ShimmerView()


    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionImage.layer.cornerRadius = 10
        
        contentView.addSubview(shimmerView)
        shimmerView.frame = bounds
        shimmerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    
    }
    
    
    func startShimmering() {
        
            shimmerView.startShimmering()
        }

        func stopShimmering() {
            shimmerView.stopShimmering()
            shimmerView.removeFromSuperview()
        }
    
   
}
