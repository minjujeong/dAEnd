//
//  ViewPhoto.swift
//  hasibal
//
//  Created by cscoi045 on 2017. 2. 7..
//  Copyright © 2017년 test. All rights reserved.
//

import UIKit
import Photos

class ViewPhoto: UIViewController {

    var assetCollection : PHAssetCollection!
    var photosAsset : PHFetchResult<PHAsset>!
    var index : Int = 0
    var imageBoo : UIImage!
    
    @IBAction func cancel(_ sender: Any) {
    }

    @IBAction func share(_ sender: Any) {
    }
    @IBAction func trash(_ sender: Any) {
    }

    
    @IBOutlet weak var bigPhoto: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        bigPhoto.image = imageBoo
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
