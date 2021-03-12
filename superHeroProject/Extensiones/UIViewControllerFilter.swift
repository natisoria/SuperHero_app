//
//  UIViewControllerFilter.swift
//  superHeroProject
//
//  Created by Natalia Soria on 4/3/21.
//

import UIKit

/* extension UIViewController {
 
 func filterActionSheet(dcFilter: ((UIAlertAction) -> Void)? = nil) {
 
 
 let actionSheet = UIAlertController(title: title,
 message: nil,
 preferredStyle: .actionSheet)
 
 actionSheet.addAction(UIAlertAction(title: "DC", style: .default,
 handler: dcFilter))
 
 actionSheet.addAction(UIAlertAction(title: "Marvel", style: .default,
 handler: dcFilter))
 
 actionSheet.addAction(UIAlertAction(title: "Neutrals", style: .default,
 handler: dcFilter))
 
 
 
 present(actionSheet, animated: true)
 
 }
 } */

/* actionSheet */

extension UIViewController {
    func filterActionSheet(dcFilter: ((UIAlertAction) -> Void)? = nil, marvelFilter: ((UIAlertAction) -> Void)? = nil, neutralsFilter: ((UIAlertAction) -> Void)? = nil, allFilter: ((UIAlertAction) -> Void)? = nil) {
        
        // 1
        let optionMenu = UIAlertController(title: nil,
                                           message: NSLocalizedString("titleAction", comment: ""),
                                           preferredStyle: .actionSheet)
        
        // 2
        let titleDC = UIAlertAction(title: NSLocalizedString("titleDC", comment: ""),
                                    style: .default,
                                    handler: dcFilter)
        let titleMArvel = UIAlertAction(title: NSLocalizedString("titleMarvel", comment: ""),
                                        style: .default,
                                        handler: marvelFilter)
        let titleNeutrals = UIAlertAction(title: NSLocalizedString("titleOtros", comment: ""),
                                          style: .default,
                                          handler: neutralsFilter)
        let titleAllHero = UIAlertAction(title: "All",
                                          style: .default,
                                          handler: allFilter)

        
        // 3
        optionMenu.addAction(titleDC)
        optionMenu.addAction(titleMArvel)
        optionMenu.addAction(titleNeutrals)
        optionMenu.addAction(titleAllHero)
        
        // 5
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    
    func cast(power: String?) -> Float {
        Float(power ?? "") ?? 0 / Float(100)
    }
    
}

