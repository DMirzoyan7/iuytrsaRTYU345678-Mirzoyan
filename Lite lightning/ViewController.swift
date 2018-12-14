//
//  ViewController.swift
//  Lite lightning
//
//  Created by Student on 14/12/2018.
//  Copyright © 2018 Serega. All rights reserved.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {

    @IBAction func buttonPressed(_ sender: UIButton) {
        isOn = !isOn
    }
    
    var isOn = true {
        didSet {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        let device =
            AVCaptureDevice.default(for: .video)
        if let device = device, device.hasTorch {
            view.backgroundColor = UIColor.black
            do {
                try device.lockForConfiguration()
                device.torchMode = isOn ? .on : .off
                device.unlockForConfiguration()
            } catch {
                print(#function, error)
            }
        } else {
            
            //        if isOn {
            //            view.backgroundColor = UIColor.white
            //        } else {
            //            view.backgroundColor = UIColor.black
            //        }
            view.backgroundColor = isOn ? UIColor.white : UIColor.black
        }
        
        var prefersStatusBarHidden: Bool {
            return true
        }
    }
    
}

