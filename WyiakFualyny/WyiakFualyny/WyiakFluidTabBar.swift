import UIKit

class WyiakFluidTabBar: UITabBar {
    private var shapeLayer: CAShapeLayer?
    private let gradientLayer = CAGradientLayer()
    
  
    private let circleRadius: CGFloat = 35.0
    private let curveHeight: CGFloat = 45.0
    
    var currentSelectedIndex: Int = 0 {
        didSet {
            self.setNeedsLayout()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        guard self.bounds.width > 0 else { return }
        
        if shapeLayer == nil {
            setupTabBar()
        }
        
        gradientLayer.frame = self.bounds
        let newPath = createPath(for: currentSelectedIndex)
        
      
        animatePath(to: newPath)
        
        updateItemOffsets()
    }

    private func setupTabBar() {
       
        gradientLayer.colors = [
            UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1).cgColor,
            UIColor(red: 1, green: 0.26, blue: 0.73, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        self.layer.insertSublayer(gradientLayer, at: 0)

        let shape = CAShapeLayer()
        shape.fillColor = UIColor.black.cgColor
        gradientLayer.mask = shape
        self.shapeLayer = shape
        
        self.backgroundImage = UIImage()
        self.shadowImage = UIImage()
        self.backgroundColor = .clear
    }

    private func createPath(for index: Int) -> CGPath {
        let path = UIBezierPath()
        let count = CGFloat(items?.count ?? 1)
        let itemWidth = self.frame.width / count
        let centerX = (CGFloat(index) * itemWidth) + (itemWidth / 2)
        
        // 起点
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: centerX - circleRadius - 10, y: 0))
        
        // 向内凹陷的曲线 (curveHeight 为正值即向下凹)
        path.addCurve(to: CGPoint(x: centerX + circleRadius + 10, y: 0),
                      controlPoint1: CGPoint(x: centerX - circleRadius, y: curveHeight),
                      controlPoint2: CGPoint(x: centerX + circleRadius, y: curveHeight))
        
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        
        return path.cgPath
    }

    private func animatePath(to newPath: CGPath) {
        guard let shape = shapeLayer else { return }
        let animation = CABasicAnimation(keyPath: "path")
        animation.toValue = newPath
        animation.duration = 0.3
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        shape.add(animation, forKey: "pathAnimation")
        shape.path = newPath
    }

    private func updateItemOffsets() {
        guard let items = items else { return }
        for (idx, item) in items.enumerated() {
            if idx == currentSelectedIndex {
              
                item.imageInsets = UIEdgeInsets(top: -38, left: 0, bottom: 18, right: 0)
            } else {
                item.imageInsets = .zero
            }
        }
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.isHidden || self.alpha == 0 { return nil }
        for subview in subviews.reversed() {
            let subPoint = subview.convert(point, from: self)
           
            if let result = subview.hitTest(subPoint, with: event) {
                return result
            }
        }
        return super.hitTest(point, with: event)
    }
    
    
    
}
