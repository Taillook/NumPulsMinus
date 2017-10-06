//
//  ViewController.swift
//  NumPulsMinus
//
//  Created by Taillook on 2017/10/04.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit
import Koloda

class ViewController: UIViewController {
    @IBOutlet private weak var cardView: KolodaView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.dataSource = self
        cardView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        print("a")
        cardView.removeFromSuperview()
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        UIApplication.shared.open(URL(string: "https://google.com/")!)
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        if direction == SwipeResultDirection.right {
            // implement your functions or whatever here
            print("user swiped right")
        } else if direction == .left {
            // implement your functions or whatever here
            print("user swiped left")
        }
    }
}

extension ViewController: KolodaViewDataSource {
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return 10
    }
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let view = UIView(frame: koloda.bounds)
        let label = UILabel(frame: koloda.bounds)
        label.text = String(arc4random() % 13 + 1)
        label.font = UIFont.systemFont(ofSize: CGFloat(256))
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = NSTextAlignment.center
        view.backgroundColor = UIColor.gray
        view.addSubview(label)
        return view
    }
}
