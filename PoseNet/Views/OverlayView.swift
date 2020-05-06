// Copyright 2019 The TensorFlow Authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import UIKit
import CoreGraphics


/// UIView for rendering inference output.
@IBDesignable
class OverlayView: UIView {

  var dots = [CGPoint]()
  var lines = [Line]()
  typealias NewDot = (x: CGFloat, y: CGFloat)

  @IBInspectable
  var sizeMultiplier : CGFloat = 0.2{
      didSet{
          self.draw(self.bounds)
      }
  }

  @IBInspectable
  var lineWidth : CGFloat = 10{
      didSet{
          self.draw(self.bounds)
      }
  }

  @IBInspectable
    var lineColor : UIColor = UIColor.black{
      didSet{
          self.draw(self.bounds)
      }
  }
    
  override func draw(_ rect: CGRect) {
    self.drawCorners()

    for dot in dots {
      drawDot(of: dot)
//      backDrawDot(of: dot)
    }
    for line in lines {
      drawLine(of: line)
//        backDrawLine(of: line)
    }
  }

  func drawDot(of dot: CGPoint) {
    let newDot: NewDot = mirrorImage(x: dot.x, y: dot.y)
    let dotRect = CGRect(
      x: newDot.x - Traits.dot.radius / 2, y: newDot.y - Traits.dot.radius / 2,
      width: Traits.dot.radius, height: Traits.dot.radius)
    let dotPath = UIBezierPath(ovalIn: dotRect)
    
    Traits.dot.color.setFill()
    dotPath.fill()
  }
    
  func backDrawDot(of dot: CGPoint) {
    let dotRect = CGRect(
    x: dot.x - Traits.dot.radius / 2, y: dot.y - Traits.dot.radius / 2,
    width: Traits.dot.radius, height: Traits.dot.radius)
    let dotPath = UIBezierPath(ovalIn: dotRect)

    Traits.dot.color.setFill()
    dotPath.fill()
  }
    
  func mirrorImage(x: CGFloat, y: CGFloat) -> NewDot {
    let newDot: NewDot = (x: UIScreen.main.bounds.size.width - x, y: y)
    return newDot
  }

  func drawLine(of line: Line) {
    let fromDot: NewDot = mirrorImage(x: line.from.x, y: line.from.y)
    let toDot: NewDot = mirrorImage(x: line.to.x, y: line.to.y)
    let linePath = UIBezierPath()
    linePath.move(to: CGPoint(x: fromDot.x, y: fromDot.y))
    linePath.addLine(to: CGPoint(x: toDot.x, y: toDot.y))
    linePath.close()

    linePath.lineWidth = Traits.line.width
    Traits.line.color.setStroke()

    linePath.stroke()
  }
    
  func backDrawLine(of line: Line) {
    let linePath = UIBezierPath()
    linePath.move(to: CGPoint(x: line.from.x, y: line.from.y))
    linePath.addLine(to: CGPoint(x: line.to.x, y: line.to.y))
    linePath.close()

    linePath.lineWidth = Traits.line.width
    Traits.line.color.setStroke()

    linePath.stroke()
  }

  func clear() {
    self.dots = []
    self.lines = []
  }
    
  func drawCorners()
  {
      let currentContext = UIGraphicsGetCurrentContext()

      currentContext?.setLineWidth(lineWidth)
      currentContext?.setStrokeColor(lineColor.cgColor)

      //first part of top left corner
      currentContext?.beginPath()
      currentContext?.move(to: CGPoint(x: 0, y: 0))
      currentContext?.addLine(to: CGPoint(x: self.bounds.size.width*sizeMultiplier, y: 0))
      currentContext?.strokePath()

      //top rigth corner
      currentContext?.beginPath()
      currentContext?.move(to: CGPoint(x: self.bounds.size.width - self.bounds.size.width*sizeMultiplier, y: 0))
      currentContext?.addLine(to: CGPoint(x: self.bounds.size.width, y: 0))
      currentContext?.addLine(to: CGPoint(x: self.bounds.size.width, y: self.bounds.size.height*sizeMultiplier))
      currentContext?.strokePath()

      //bottom rigth corner
      currentContext?.beginPath()
      currentContext?.move(to: CGPoint(x: self.bounds.size.width, y: self.bounds.size.height - self.bounds.size.height*sizeMultiplier))
      currentContext?.addLine(to: CGPoint(x: self.bounds.size.width, y: self.bounds.size.height))
      currentContext?.addLine(to: CGPoint(x: self.bounds.size.width - self.bounds.size.width*sizeMultiplier, y: self.bounds.size.height))
      currentContext?.strokePath()

      //bottom left corner
      currentContext?.beginPath()
      currentContext?.move(to: CGPoint(x: self.bounds.size.width*sizeMultiplier, y: self.bounds.size.height))
      currentContext?.addLine(to: CGPoint(x: 0, y: self.bounds.size.height))
      currentContext?.addLine(to: CGPoint(x: 0, y: self.bounds.size.height - self.bounds.size.height*sizeMultiplier))
      currentContext?.strokePath()

      //second part of top left corner
      currentContext?.beginPath()
      currentContext?.move(to: CGPoint(x: 0, y: self.bounds.size.height*sizeMultiplier))
      currentContext?.addLine(to: CGPoint(x: 0, y: 0))
      currentContext?.strokePath()
  }
}

private enum Traits {
  static let dot = (radius: CGFloat(10), color: UIColor.orange)
  static let line = (width: CGFloat(2.0), color: UIColor.orange)
}
