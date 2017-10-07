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
    private var count: Int = 0
    private var randoms: [Int] = []
    @IBOutlet private weak var cardView: KolodaView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<10 {
            randoms.append(Int(arc4random() % 13 + 1))
        }
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
        //UIApplication.shared.open(URL(string: "https://google.com/")!)
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        print(randoms[index])
        if direction == SwipeResultDirection.right {
            // implement your functions or whatever here
            //print("num")
            //print((koloda.viewWithTag(2) as! UILabel).text!)
        } else if direction == .left {
            // implement your functions or whatever here
            //print("num")
            //print((koloda.viewWithTag(2) as! UILabel).text!)
        }
    }
}

extension ViewController: KolodaViewDataSource {
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return randoms.count
    }
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let view = UIView(frame: koloda.bounds)
        let label = UILabel(frame: koloda.bounds)
        label.text = String(randoms[index])
        label.font = UIFont.systemFont(ofSize: CGFloat(256))
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = NSTextAlignment.center
        label.tag = 2
        view.backgroundColor = UIColor.gray
        view.addSubview(label)
        return view
    }
}
