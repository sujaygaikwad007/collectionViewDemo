import UIKit
class ShimmerView: UIView {

    private let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.clear.cgColor, UIColor.gray.cgColor, UIColor.clear.cgColor]
        layer.locations = [0.0, 0.5, 1.0]
        layer.startPoint = CGPoint(x: 0.0, y: 0.5)
        layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        return layer
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        layer.addSublayer(gradientLayer)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = CGRect(x: -bounds.width, y: bounds.origin.y, width: 3 * bounds.width, height: bounds.height)
    }

    func startShimmering() {
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 2
        animation.fromValue = -bounds.width
        animation.toValue = bounds.width
        animation.repeatCount = .infinity
        gradientLayer.add(animation, forKey: "shimmerAnimation")
        
    }

    func stopShimmering() {
        gradientLayer.removeAnimation(forKey: "shimmerAnimation")
    }
}
