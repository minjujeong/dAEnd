//
//  ViewController2.swift
//  tes2
//
//  Created by cscoi045 on 2017. 2. 7..
//  Copyright © 2017년 test. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

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

    @IBAction func filterAction(_ sender: Any) {
        
        guard let image = self.imageView.image?.cgImage else { return }
        //이게 뭐냐면 가드렛안되면 그냥 브레이크하는것임
        
        let openGLContext = EAGLContext(api: .openGLES3)
        let context = CIContext(eaglContext: openGLContext!)
        
        let ciImage = CIImage(cgImage: image)
        
        let filter = CIFilter(name: "CISepiaTone")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        filter?.setValue(1 ,forKey: kCIInputIntensityKey)
        
        if let output = filter?.value(forKey: kCIOutputImageKey) as? CIImage{
            self.imageView?.image = UIImage(cgImage: context.createCGImage(output, from: output.extent)!)
        }
        
        
        
        
    }
}
