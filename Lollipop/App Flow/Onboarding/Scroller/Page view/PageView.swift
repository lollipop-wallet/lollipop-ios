//
//  PageView.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 22/04/2024.
//

import UIKit

class PageView: UIPageViewController {
    
    let device = UIDevice.current.dc.deviceModel
    var pagerDistanceFromBottom =  Double()

    override func viewDidLoad() {
        super.viewDidLoad()
        let pageControl = UIPageControl.appearance()
        //Customizing
        pageControl.pageIndicatorTintColor = AppColors.mediumGrey
        pageControl.currentPageIndicatorTintColor = AppColors.black
        
        switch device {
        case .iPhone6, .iPhone6S, .iPhone6Plus, .iPhone6SPlus, .iPhone7, .iPhone7Plus, .iPhone8, .iPhone8Plus, .iPhoneSE2, .iPhoneSE3:
            pagerDistanceFromBottom = self.view.frame.size.height - 107
        default:
            pagerDistanceFromBottom = self.view.frame.size.height - 155
        }
    }
    
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           for view in view.subviews{
               if view is UIScrollView{
                   view.frame = UIScreen.main.bounds
               }else if view is UIPageControl{
                   //view.backgroundColor = UIColor.clear
                   view.frame.origin.y = pagerDistanceFromBottom
                   self.view.bringSubviewToFront(view)
               }
           }
       }
}
