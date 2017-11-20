//
//  TinderUIViewController.swift
//  Swift4Playground
//
//  Created by Munesada Yohei on 2017/11/20.
//  Copyright © 2017 Munesada Yohei. All rights reserved.
//

import UIKit
import Koloda

class TinderUIViewController: UIViewController {
    
    // The contents for display.
    let items = [ "Red", "Green", "Blue", "Black", "White", "Orange", "Mageda", "Yellow", "Gray" ]
    
    let kolodaView = KolodaView()
    
    override func viewDidLoad() {
        self.title = "TinderUI Sample"
        self.view.backgroundColor = UIColor.white
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
        
        kolodaView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        kolodaView.center = self.view.center
        self.view.addSubview(kolodaView)
        
    }
    
}

//MARK:- KolodaViewDataSource
extension TinderUIViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return items.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        
        // Card.
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        view.layer.backgroundColor = UIColor.white.cgColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 1.5)
        // Add a label.
        let label = UILabel()
        label.text = items[index]
        label.sizeToFit()
        label.center = view.center
        view.addSubview(label)
        
        return view
    }
}

//MARK:- KolodaViewDelegate
extension TinderUIViewController: KolodaViewDelegate {
    
    func koloda(_ koloda: KolodaView, allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        return [.left, .right, .up]
    }
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        print("Finish cards.")
    }
}

