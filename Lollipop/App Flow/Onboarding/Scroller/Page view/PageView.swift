//
//  PageView.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 22/04/2024.
//

import UIKit

class PageView: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let pageControl = UIPageControl.appearance()
        //Customizing
        pageControl.pageIndicatorTintColor = AppColors.mediumGrey
        pageControl.currentPageIndicatorTintColor = AppColors.black
        
    }
    
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           for view in view.subviews{
               if view is UIScrollView{
                   view.frame = UIScreen.main.bounds
               }else if view is UIPageControl{
                   //view.backgroundColor = UIColor.clear
                   view.frame.origin.y = self.view.frame.size.height - 155
                   self.view.bringSubviewToFront(view)
               }
           }
       }
}
