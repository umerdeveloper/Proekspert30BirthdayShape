import CoreGraphics
import UIKit

class Custom30BirthdayShape: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let topHalfCirclePath = UIBezierPath(
            arcCenter: .init(x: rect.midX, y: rect.midY),
            radius: 50,
            startAngle: 0,
            endAngle: 3.14159, // 180 degress
            clockwise: false
        )
        
        let topHalfCirclePathLayer = CAShapeLayer()
        topHalfCirclePathLayer.path = topHalfCirclePath.cgPath
        topHalfCirclePathLayer.fillColor = UIColor.clear.cgColor
        topHalfCirclePathLayer.strokeColor = UIColor.cyan.cgColor
        topHalfCirclePathLayer.lineWidth = 25
        
        topHalfCirclePathLayer.add(
            createAnimation(
                from: 0,
                to: 1
            ),
            forKey: "strokeEndAnimation"
        )
        
        let bottomHalfCirclePath = UIBezierPath(
            arcCenter: .init(x: rect.maxX - 96.5, y: rect.midY),
            radius: 50,
            startAngle: 0,
            endAngle: 3.14159, // 180 degress, clockwise
            clockwise: true
        )
        
        let bottomHalfCirclePathLayer = CAShapeLayer()
        bottomHalfCirclePathLayer.path = bottomHalfCirclePath.cgPath
        bottomHalfCirclePathLayer.fillColor = UIColor.clear.cgColor
        bottomHalfCirclePathLayer.strokeColor = UIColor.cyan.cgColor
        bottomHalfCirclePathLayer.lineWidth = 25
        
        bottomHalfCirclePathLayer.add(
            createAnimation(
                from: 0,
                to: 1
            ),
            forKey: "strokeEndAnimation"
        )
        
        let digitBottomBezier = UIBezierPath(
            arcCenter: .init(x: rect.midX, y: rect.midY + 50 + 50),
            radius: 50,
            startAngle: -1.5708,
            endAngle: 1.5708 * 2,
            clockwise: true
        )
        
        let digitBottomPathLayer = CAShapeLayer()
        digitBottomPathLayer.path = digitBottomBezier.cgPath
        digitBottomPathLayer.fillColor = UIColor.clear.cgColor
        digitBottomPathLayer.strokeColor = UIColor.white.cgColor
        digitBottomPathLayer.lineWidth = 25
        
        digitBottomPathLayer.add(
            createAnimation(
                from: 0,
                to: 1
            ),
            forKey: "strokeEndAnimation"
        )
        
        let twoVerticalLinesPath = UIBezierPath()
        twoVerticalLinesPath.move(
            to: .init(x: rect.midX + 50, y: rect.midY)
        )
        twoVerticalLinesPath.addLine(to: .init(x: rect.midX + 50.4, y: rect.midY - 140))
        // come back
        twoVerticalLinesPath.addLine(to: .init(x: rect.midX + 50, y: rect.midY))
        twoVerticalLinesPath.move(to: .init(x: rect.maxX - 46.5, y: rect.midY))
        twoVerticalLinesPath.addLine(to: .init(x: rect.maxX - 46.1, y: rect.midY - 140))
        
        let twoVerticalLinesPathLayer = CAShapeLayer()
        twoVerticalLinesPathLayer.path = twoVerticalLinesPath.cgPath
        twoVerticalLinesPathLayer.fillColor = UIColor.clear.cgColor
        twoVerticalLinesPathLayer.strokeColor = UIColor.white.cgColor
        twoVerticalLinesPathLayer.lineWidth = 25
        
        twoVerticalLinesPathLayer.add(
            createAnimation(
                from: 0,
                to: 1
            ),
            forKey: "strokeEndAnimation"
        )
        
        
        let mostTopRoundedPath = UIBezierPath(
            arcCenter: .init(x: rect.midX + 100.4, y: rect.midY - 139),
            radius: 50,
            startAngle: 0,
            endAngle: 3.14159, // 180 degress
            clockwise: false
        )
        
        let mostTopRoundedPathLayer = CAShapeLayer()
        mostTopRoundedPathLayer.path = mostTopRoundedPath.cgPath
        mostTopRoundedPathLayer.fillColor = UIColor.clear.cgColor
        mostTopRoundedPathLayer.strokeColor = UIColor.white.cgColor
        mostTopRoundedPathLayer.lineWidth = 25
        
        mostTopRoundedPathLayer.add(
            createAnimation(
                from: 0,
                to: 1
            ),
            forKey: "strokeEndAnimation"
        )
        
        let threeDigitTopPartPath = UIBezierPath(
            arcCenter: .init(x: rect.midX, y: rect.midY),
            radius: 50,
            startAngle: 0,
            endAngle: 1.5708, // 90 degress
            clockwise: true
        )
        
        let threeDigitTopPartPathLayer = CAShapeLayer()
        threeDigitTopPartPathLayer.path = threeDigitTopPartPath.cgPath
        threeDigitTopPartPathLayer.fillColor = UIColor.clear.cgColor
        threeDigitTopPartPathLayer.strokeColor = UIColor.white.cgColor
        threeDigitTopPartPathLayer.lineWidth = 25
        
        threeDigitTopPartPathLayer.add(
            createAnimation(
                from: 0,
                to: 1
            ),
            forKey: "strokeEndAnimation"
        )
        
        
        self.layer.insertSublayer(topHalfCirclePathLayer, at: 0)
        self.layer.insertSublayer(bottomHalfCirclePathLayer, at: 0)
        self.layer.insertSublayer(digitBottomPathLayer, at: 0)
        self.layer.insertSublayer(twoVerticalLinesPathLayer, at: 0)
        self.layer.insertSublayer(mostTopRoundedPathLayer, at: 0)
        self.layer.insertSublayer(threeDigitTopPartPathLayer, at: 0)
    }
    
    func createAnimation(from: Int, to: Int) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = from
        animation.toValue = to
        animation.duration = 5
        return animation
    }
}

#Preview {
    let view = Custom30BirthdayShape(
        frame: .init(x: 50, y: 100, width: 500, height: 500)
    )
    view.backgroundColor = .black
    return view
}
