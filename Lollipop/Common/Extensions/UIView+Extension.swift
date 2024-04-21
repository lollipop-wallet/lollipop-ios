//
//  UIView+Extension.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import UIKit


extension UIView {

   class func initFromNib<T: UIView>() -> T {
           return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?[0] as! T
    }
    
    func applyGradient(color1: UIColor, color2: UIColor, startPoint: CGPoint, endPoint: CGPoint) {
        var gradColors = [CGColor]()
        gradColors = [color1.cgColor, color2.cgColor]
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = gradColors
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    enum Direction: Int {
        case topToBottom = 0
        case bottomToTop
        case leftToRight
        case rightToLeft
        case custom
    }
    
    func applyGradient1(colors: [Any]?, locations: [NSNumber]? = [0.0, 1.0], direction: Direction = .topToBottom) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        
        switch direction {
        case .topToBottom:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
            
        case .bottomToTop:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
            
        case .leftToRight:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            
        case .rightToLeft:
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        case .custom:
            gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        }
        
        gradientLayer.name = "gradient"
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
   func showSpinner() {
    let backgroundView = UIView()
    let spinnerVIew = UIView()
    let backgroundImage = UIImageView()
    backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    backgroundView.backgroundColor = .clear
    backgroundView.tag = 475647
    
    self.addSubview(backgroundView)
    
    spinnerVIew.frame = CGRect.init(x: 0, y: 0, width: 90, height: 90)
    spinnerVIew.tag = 23125231
    spinnerVIew.center = backgroundView.center
    spinnerVIew.layer.cornerRadius = 12

    backgroundView.addSubview(spinnerVIew)

    backgroundImage.frame = CGRect.init(x: 0, y: 0, width: 90, height: 90)
    backgroundImage.center = CGPoint(x: spinnerVIew.frame.size.width  / 2,
                                     y: spinnerVIew.frame.size.height / 2)
    backgroundImage.image = UIImage(named: "ic_activityIndicator")
    backgroundImage.contentMode = .scaleAspectFill
    spinnerVIew.addSubview(backgroundImage)
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 200, y: 200, width: 50, height: 50))
    activityIndicator.center = CGPoint(x: spinnerVIew.frame.size.width  / 2,
                                       y: spinnerVIew.frame.size.height / 2)
    activityIndicator.hidesWhenStopped = true
    if #available(iOS 13.0, *) {
        activityIndicator.style = UIActivityIndicatorView.Style.large
    } else {
        activityIndicator.style = UIActivityIndicatorView.Style.white
    }
    activityIndicator.color = .gray
    activityIndicator.startAnimating()
    self.isUserInteractionEnabled = false
    
    spinnerVIew.addSubview(activityIndicator)

    }

    func hideSpinner() {
        if let background = viewWithTag(475647){
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }
    
    func showInvisibleView(){
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.01)
        backgroundView.tag = 26989
        self.isUserInteractionEnabled = false
        self.addSubview(backgroundView)
    }
    
    func hideInvisibleView(){
        if let background = viewWithTag(26989){
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }
    
    func add(view: UIView, left: CGFloat, right: CGFloat, top: CGFloat, bottom: CGFloat, shoudIncludeBottom: Bool) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: left).isActive = true
        view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: right).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: top).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: bottom).isActive = shoudIncludeBottom
    }

    
    func startShimmeringAnimation(animationSpeed: Float = 1.4,
                                  direction: Direction = .leftToRight,
                                  repeatCount: Float = MAXFLOAT) {
      
      // Create color  ->2
      let lightColor = UIColor(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 0.1).cgColor
      let blackColor = UIColor.black.cgColor
      
      // Create a CAGradientLayer  ->3
      let gradientLayer = CAGradientLayer()
      gradientLayer.colors = [blackColor, lightColor, blackColor]
      gradientLayer.frame = CGRect(x: -self.bounds.size.width, y: -self.bounds.size.height, width: 3 * self.bounds.size.width, height: 3 * self.bounds.size.height)
      
      switch direction {
      case .topToBottom:
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
      case .bottomToTop:
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        
      case .leftToRight:
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
      case .rightToLeft:
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        
      case .custom:
          gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
          gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
      }
      
      gradientLayer.locations =  [0.35, 0.50, 0.65] //[0.4, 0.6]
      self.layer.mask = gradientLayer
      
      // Add animation over gradient Layer  ->4
      CATransaction.begin()
      let animation = CABasicAnimation(keyPath: "locations")
      animation.fromValue = [0.0, 0.1, 0.2]
      animation.toValue = [0.8, 0.9, 1.0]
      animation.duration = CFTimeInterval(animationSpeed)
      animation.repeatCount = repeatCount
      CATransaction.setCompletionBlock { [weak self] in
        guard let strongSelf = self else { return }
        strongSelf.layer.mask = nil
      }
      gradientLayer.add(animation, forKey: "shimmerAnimation")
      CATransaction.commit()
    }
    
    func stopShimmeringAnimation() {
      self.layer.mask = nil
    }
    
    func setView(hidden: Bool) {
        UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.isHidden = hidden
        })
    }
  }
