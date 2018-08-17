//
//  ResViewController.swift
//  test2
//
//  Created by ADUP05 on 2018/8/17.
//  Copyright © 2018年 ADUP05. All rights reserved.
//

import UIKit

class ResViewController: UIViewController {
    @IBOutlet var resImg :UIImageView!
    var resName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        resImg.image = UIImage(named: "good")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
