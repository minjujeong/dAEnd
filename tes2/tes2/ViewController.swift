//
//  ViewController.swift
//  tes2
//
//  Created by cscoi045 on 2017. 2. 6..
//  Copyright © 2017년 test. All rights reserved.
//

import UIKit
import Photos
import PhotosUI

let reuseIdentifier = "PhotoCell"
let albumName = "My App2"

class ViewController: UIViewController {
    var albumFound : Bool = false
    var assetCollection : PHAssetCollection!
    var photosAsset : PHFetchResult<PHAsset>!
    var assetThumbnailSize:CGSize! = CGSize(width: 50, height: 50)

    @IBOutlet weak var lefItBeYou: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", albumName)
        let collection : PHFetchResult = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)
        
        if let first_Obj:AnyObject = collection.firstObject {
            //found the album
            self.albumFound = true
            self.assetCollection = first_Obj as! PHAssetCollection
            
        }else {
            //create
            var albumPlaceholder:PHObjectPlaceholder!
            
            NSLog("\nFolder \"%@\" does not exist\n creating now..", albumName)
            PHPhotoLibrary.shared().performChanges({
                let request = PHAssetCollectionChangeRequest.creationRequestForAssetCollection(withTitle: albumName)
                albumPlaceholder = request.placeholderForCreatedAssetCollection
            },
                completionHandler: {(success:Bool, error:Error?)in
                if(success){
                print("Successfully created folder")
                self.albumFound = true
                 let collection = PHAssetCollection.fetchAssetCollections(withLocalIdentifiers: [albumPlaceholder.localIdentifier], options: nil)
                 self.assetCollection = collection.firstObject! as PHAssetCollection
                 self.photosAsset = PHAsset.fetchAssets(in: self.assetCollection, options: nil)
                    }else{
                        print("Error creating folder")
                            self.albumFound = false
                    
                                                    }
            })

      
    }
    }
    override func viewWillAppear(_ animated: Bool) {

        if photosAsset != nil{
        if photosAsset.countOfAssets(with: PHAssetMediaType.image) != 0 {
            PHImageManager.default().requestImage(for: self.photosAsset.firstObject!, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: nil, resultHandler: {(result, info)->Void in
                self.lefItBeYou.image = result})}}
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

