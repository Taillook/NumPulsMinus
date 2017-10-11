//
//  ResultViewController.swift
//  NumPulsMinus
//
//  Created by Taillook on 2017/10/06.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var ans: Int = 0
    @IBOutlet weak var ansLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ansLabel.text = String(ans)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func allBack(_ sender: Any) {
        _ = self.navigationController?.popToViewController(navigationController!.viewControllers[0], animated: true)
    }
    
    
}
