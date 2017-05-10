//
//  ScanViewController.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 5/4/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit
import CoreImage
import Firebase

class ScanViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let refTable = FIRDatabase.database().reference(withPath: "Restaurant/Tables")
    
    var table:[Table] = []
    
    var detector: CIDetector? = nil
    
    var result1:String?
    
    @IBOutlet weak var qrImageView: UIImageView!
    
    // MARK: Life cirle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refTable.queryOrdered(byChild: "id").observe(.value, with: { (snapshot) in
            var newTable: [Table] = []
            
            for item in snapshot.children {
                let table = Table(snapshot: item as! FIRDataSnapshot)
                newTable.append(table)
            }
            self.table = newTable
        })
        //show bar button item if login or scan
        if externalUid != nil {
            let logoutBtn = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(signoutButtonPressed(_:)))
            self.navigationItem.rightBarButtonItem = logoutBtn
        }else {
            let backBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dissmissScan))
            self.navigationItem.leftBarButtonItem = backBtn
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //if user exist then show the alert
        if externalUid != nil {
            if self.isBeingPresented {
                let alertController = UIAlertController(title: "Login Successful", message: "You need to scan to see the menu.", preferredStyle: .alert)
                let defaultAlert = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(defaultAlert)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
        //show the main home view
        if result1 != nil {
            for i in 0...table.count - 1 {
                if  table[i].id == result1 {
                    tableID = table[i].id
                    let newRootViewController = self.storyboard!.instantiateViewController(withIdentifier: "MainHome")
                    UIApplication.shared.keyWindow?.rootViewController = newRootViewController
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBAction
    
    @IBAction func scanImageButtonDidTap(_ sender: Any) {
        //TODO: You can handle here to get image from library or from camera
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    // MARK: Business methods
    
    /// Check QR Code with CIDetector
    ///
    /// - Parameter image: input image
    /// - Returns: QR hightlign image + decoded string
    func performQRCodeDetection(image: CIImage) -> (outImage: CIImage?, decode: String) {
        var resultImage: CIImage?
        var decode = ""
        detector = CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options: [CIDetectorAccuracy:CIDetectorAccuracyHigh])
        if let detector = detector {
            let features = detector.features(in: image)
            for feature in features as! [CIQRCodeFeature] {
                resultImage = drawHighlightOverlayForPoints(image,
                                                            topLeft: feature.topLeft,
                                                            topRight: feature.topRight,
                                                            bottomLeft: feature.bottomLeft,
                                                            bottomRight: feature.bottomRight)
                decode = feature.messageString!
            }
        }
        return (resultImage, decode)
    }
    
    /// QR images with highlight
    func drawHighlightOverlayForPoints(_ image: CIImage, topLeft: CGPoint, topRight: CGPoint,
                                       bottomLeft: CGPoint, bottomRight: CGPoint) -> CIImage {
        var overlay = CIImage(color: CIColor(red: 1.0, green: 0, blue: 0, alpha: 0.5))
        overlay = overlay.cropping(to: image.extent)
        overlay = overlay.applyingFilter("CIPerspectiveTransformWithExtent",
                                         withInputParameters: [
                                            "inputExtent": CIVector(cgRect: image.extent),
                                            "inputTopLeft": CIVector(cgPoint: topLeft),
                                            "inputTopRight": CIVector(cgPoint: topRight),
                                            "inputBottomLeft": CIVector(cgPoint: bottomLeft),
                                            "inputBottomRight": CIVector(cgPoint: bottomRight)
            ])
        return overlay.compositingOverImage(image)
    }
    
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            // use the image
            if let imageCI = CIImage(image: image) {
                let result = self.performQRCodeDetection(image: imageCI)
                qrImageView.image = UIImage(ciImage: result.outImage!)
//                    tableID = result.decode
                result1 = result.decode
            }
            
        }else{
            print("Something went wrong")
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // - Mark: IBAction
    
    @IBAction func signoutButtonPressed(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "Logout", message: "You are not at the restaurant, aren't you?", preferredStyle: .alert)
        let defaultAlert = UIAlertAction(title: "Yes", style: .default, handler: { _ in
            do {
                try FIRAuth.auth()!.signOut()
                externalUid = nil
                let newRootViewController = self.storyboard!.instantiateViewController(withIdentifier: "RootView")
                UIApplication.shared.keyWindow?.rootViewController = newRootViewController
            } catch {
                
            }
        })
        let cancelAlert = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alertController.addAction(defaultAlert)
        alertController.addAction(cancelAlert)
        present(alertController, animated: true, completion: nil)
    }

    func dissmissScan() {
        dismiss(animated: true, completion: nil)
    }
    
}
