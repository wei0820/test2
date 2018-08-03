//
//  ViewController.swift
//  test2
//
//  Created by ADUP05 on 2018/7/27.
//  Copyright © 2018年 ADUP05. All rights reserved.
//

import UIKit
import GoogleMobileAds
var rest = ["1","2","3"]
class ViewController: UIViewController ,GADBannerViewDelegate,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rest.count
    }
    override var prefersStatusBarHidden: Bool{
        return true 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = "Cell"
        let ce = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath)
        ce.textLabel?.text = rest[indexPath.row]
        ce.imageView?.image = UIImage(named:"icphoto")
        return ce
    }
    
    var bannerView: GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Google Mobile Ads SDK version: \(GADRequest.sdkVersion())")
        let id = "ca-app-pub-7019441527375550/6780946225"
        
        
        bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        bannerView.adUnitID = id
        bannerView.delegate = self
        bannerView.rootViewController = self
    
        bannerView.load(GADRequest())
    
    }
    
    // Called when an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        addBannerViewToView(bannerView)

        print(bannerView.adUnitID)
    }
    
    // Called when an ad request failed.
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print((error.localizedDescription))
    }
    
    // Called just before presenting the user a full screen view, such as a browser, in response to
    // clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    // Called just before dismissing a full screen view.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    // Called just after dismissing a full screen view.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    // Called just before the application will background or terminate because the user clicked on an
    // ad that will launch another application (such as the App Store).
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print(#function)
    }

    @IBAction func show(sender:UIButton){
        let s = sender.titleLabel?.text
        switch s {
        case "one":
            
            sender.setTitleColor(UIColor.red, for: UIControl.State.normal)
            print("it is one ")
        case "two":
            sender.setTitleColor(UIColor.brown , for: UIControl.State.normal)

            print("it is two ")
        default:
             print("default")
        }
        let alert = UIAlertController.init(title: "title", message: s, preferredStyle:UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "title", style: UIAlertAction.Style.default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
   
    @IBAction func closeView(b :UIButton){
        
        self.dismiss(animated: true, completion: nil)
    }

}
