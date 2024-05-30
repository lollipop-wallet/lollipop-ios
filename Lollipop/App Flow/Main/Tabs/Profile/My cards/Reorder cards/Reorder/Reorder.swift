//
//  Reorder.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 30/05/2024.
//

import UIKit

extension ReorderCardsView {
    //MARK: Drag&Drop method for tableView
    @objc func longPressGestureRecognized(_ gestureRecognizer: UIGestureRecognizer) {
        let longPress = gestureRecognizer as! UILongPressGestureRecognizer
        let state = longPress.state
        let locationInView = longPress.location(in: tableView)
        let indexPath = tableView.indexPathForRow(at: locationInView)
        struct My {
            static var cellSnapshot : UIView? = nil
            static var cellIsAnimating : Bool = false
            static var cellNeedToShow : Bool = false
        }
        struct Path {
            static var initialIndexPath : IndexPath? = nil
        }
        switch state {
        case UIGestureRecognizer.State.began:
                if indexPath != nil {
                    let generator = UIImpactFeedbackGenerator(style: .light)
                    generator.impactOccurred()
                    
                    Path.initialIndexPath = indexPath
                    let cell = tableView.cellForRow(at: indexPath!) as! ReorderCardsTableViewCell?
                    cell?.cellContentView.backgroundColor = AppColors.lightGrey
                    My.cellSnapshot  = snapshotOfCell(inputView: cell!)
                    var center = cell?.center
                    My.cellSnapshot!.center = center!
                    My.cellSnapshot!.alpha = 0.0
                    tableView.addSubview(My.cellSnapshot!)
                    UIView.animate(withDuration: 0.25, animations: { () -> Void in
                        center?.y = locationInView.y
                        My.cellIsAnimating = true
                        My.cellSnapshot!.center = center!
                        My.cellSnapshot!.transform = CGAffineTransform(scaleX: 1, y: 1)
                        My.cellSnapshot!.alpha = 0.98
                        cell?.alpha = 0.0
                        cell?.cellContentView.backgroundColor = AppColors.lightGrey
                    }, completion: { (finished) -> Void in
                            if finished {
                                    My.cellIsAnimating = false
                                    if My.cellNeedToShow {
                                            My.cellNeedToShow = false
                                            UIView.animate(withDuration: 0.25, animations: { () -> Void in
                                                    cell?.alpha = 1
                                            })
                                    } else {
                                        cell?.isHidden = true
                                    }
                            }
                    })
                }
        case UIGestureRecognizer.State.changed:
                if My.cellSnapshot != nil {
                    var center = My.cellSnapshot!.center
                    center.y = locationInView.y
                    My.cellSnapshot!.center = center
                    if ((indexPath != nil) && (indexPath != Path.initialIndexPath)) {
                        let movedObject = self.datasource[Path.initialIndexPath!.row]
                        self.datasource.remove(at: Path.initialIndexPath!.row)
                        self.datasource.insert(movedObject, at: indexPath!.row)
                        tableView.moveRow(at: Path.initialIndexPath!, to: indexPath!)
                        presenter?.updateDatasourceWith(datasource: self.datasource)
                        Path.initialIndexPath = indexPath
                        let generator = UIImpactFeedbackGenerator(style: .light)
                        generator.impactOccurred()
                    }
                }
        default:
            if Path.initialIndexPath != nil {
                let cell = tableView.cellForRow(at: Path.initialIndexPath!) as! ReorderCardsTableViewCell?
                if My.cellIsAnimating {
                    My.cellNeedToShow = true
                } else {
                    cell?.isHidden = false
                    cell?.alpha = 0.0
                }
                UIView.animate(withDuration: 0.25, animations: { () -> Void in
                    My.cellSnapshot!.center = (cell?.center)!
                    My.cellSnapshot!.transform = CGAffineTransform.identity
                    My.cellSnapshot!.alpha = 0.0
                    cell?.alpha = 1.0
                }, completion: { (finished) -> Void in
                    if finished {
                        Path.initialIndexPath = nil
                        My.cellSnapshot!.removeFromSuperview()
                        My.cellSnapshot = nil
               }
            })
          }
        }
    }
    
    fileprivate func snapshotOfCell(inputView: UIView) -> UIView {
        UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, false, 0.0)
        inputView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
        UIGraphicsEndImageContext()
        
        let cellSnapshot : UIView = UIImageView(image: image)
        cellSnapshot.layer.masksToBounds = true
        cellSnapshot.layer.cornerRadius = 16.0
        cellSnapshot.layer.shadowOffset = CGSize(width: -5.0, height: 0)
        cellSnapshot.layer.shadowRadius = 5.0
        cellSnapshot.layer.shadowOpacity = 0.4
        return cellSnapshot
    }
}
