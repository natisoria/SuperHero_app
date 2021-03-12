//
//  SplashViewController.swift
//  superHeroProject
//
//  Created by Natalia Soria on 11/3/21.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
    @IBOutlet weak var imageSplash : UIImageView!
    @IBOutlet weak var loadedView: UIView!
    
    private var loading : AnimationView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        loadData()
        
        
    }
        
        
    private func configureViews(){
        loading = .init(name: "progress")
        loading?.frame = loadedView.bounds
        loading?.contentMode = .scaleAspectFill
        loading?.loopMode = .playOnce
        
        if let loadingAnimation = loading {
            loadedView.addSubview(loadingAnimation)
        }
    }
        
    
    override func viewWillDisappear(_ animated: Bool) {
        DataProvider.shared.loadHeroObserver = nil
        super.viewWillDisappear(animated)
    }
  
       
    private func loadData(){
        DataProvider.shared.loadHeroObserver = { [weak self] progress in
            print("\(progress * 100) %")
            self?.loading?.play(toProgress: CGFloat(progress))
            
            if progress >= 0.9{
                self?.performSegue(withIdentifier: "FROM_SPLASH_TO_MAIN",
                                   sender: nil)
            }
            
        }
        DataProvider.shared.fetchHeroesId()
    }
    
    
} //Cierre class


