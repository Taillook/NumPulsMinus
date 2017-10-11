//
//  ViewController.swift
//  NumPulsMinus
//
//  Created by Taillook on 2017/10/04.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit
import Koloda

class CalculateViewController: UIViewController {
    private var count: Int = 0
    private var randoms: [Int] = []
    @IBOutlet private weak var cardView: KolodaView!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    
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

    @IBAction func tappedPlus(_ sender: UIButton) {
        cardView.swipe(.left)
    }

    @IBAction func tappedMinus(_ sender: UIButton) {
        cardView.swipe(.right)
    }
    
    @IBAction func TappedCheck(_ sender: UIButton) {
        performSegue(withIdentifier: "toAnswer",sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toAnswer") {
            let vc: ResultViewController = (segue.destination as? ResultViewController)!
            // ViewControllerのtextVC2にメッセージを設定
            vc.ans = count
        }
    }
    
}

extension CalculateViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        print("collect ans is \(count)")
        cardView.removeFromSuperview()
        plus.removeFromSuperview()
        minus.removeFromSuperview()
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        //UIApplication.shared.open(URL(string: "https://google.com/")!)
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        //print(randoms[index])
        if direction == SwipeResultDirection.right {
            count -= randoms[index]
            print(count)
        } else if direction == SwipeResultDirection.left {
            count += randoms[index]
            print(count)
        }
    }
}

extension CalculateViewController: KolodaViewDataSource {
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    
    func kolodaNumberOfCards(_  koloda: KolodaView) -> Int {
        return randoms.count
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let view = UIView(frame: koloda.bounds)
        let label = UILabel(frame: koloda.bounds)
        label.text = String(randoms[index])
        label.font = UIFont.systemFont(ofSize: CGFloat(256))
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        view.backgroundColor = UIColor.hex(hexStr: "007AFF", alpha: 1)
        view.addSubview(label)
        return view
    }
}
