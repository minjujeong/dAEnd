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
        // nil 이 아니면 다음 문단으로 넘어가라
        // ui 가 아니라 cgimage로 불러왔다
        
        let openGLContext = EAGLContext(api: .openGLES3)
        // open geo context // gpu에 접근하는 것. 필터 매우 복잡한 작업이기 때문에
        let context = CIContext(eaglContext: openGLContext!)
        // open image context // core image와 gpu를 잇는 conjunction
        
        let ciImage = CIImage(cgImage: image)
        // create a core image
        let filter = CIFilter(name: "CISepiaTone")
        // create a filter : we want to use
        
        filter?.setValue(ciImage, forKey: kCIInputImageKey) // 필터가 적용될 이미지로 ciimage를 넣어라
        filter?.setValue(1, forKey: kCIInputIntensityKey) // 필터의 적용 강도를 1로 정해라
        
        
       /* if let sepiaOutput = filter?.value(forKey: kCIOutputImageKey) as? CIImage {
            let exposureFilter = CIFilter(name: "CIExposureAdjust")
            exposureFilter?.setValue(sepiaOutput, forKey: kCIInputImageKey)
            exposureFilter?.setValue(1, forKey: kCIInputEVKey) */
            
        if let output = filter?.value(forKey: kCIOutputImageKey) as? CIImage{
            self.imageView?.image = UIImage(cgImage: context.createCGImage(output, from: output.extent)!)
        }
        
        // kCIOutputImageKey 필터를 적용해라 - 그것을 ciimage로 타입 변환해라 - 그리고 다시 uiimage로 넣어줘라 : context에 우리의 아웃풋을 넣자 = 이것은 이미지뷰로 넣어질 것
        
        
    }
}
