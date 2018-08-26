//
//  ViewController.swift
//  TestingReplayKit
//
//  Created by Diego Quimbo on 8/24/18.
//  Copyright © 2018 OnIt. All rights reserved.
//

import UIKit
import ReplayKit

class ViewController: UIViewController {

    @IBOutlet weak var flashView: UIView!
    @IBOutlet weak var flashView2: UIView!
    @IBOutlet weak var flashView3: UIView!
    @IBOutlet weak var flashView4: UIView!
    @IBOutlet weak var flashView5: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startRecording()
        blink()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func startRecording() {
        RPScreenRecorder.shared().startCapture(handler: { (sampleBuffer, bufferType, error) in
            switch bufferType {
                
            case RPSampleBufferType.video:
                print("is Recording..")
                break
                
            case RPSampleBufferType.audioApp:
                break
            case RPSampleBufferType.audioMic:
                break
            }
            
        }, completionHandler: nil)
    }
    
    func blink(){
        flashView.alpha = 0.0
        flashView2.alpha = 0.0
        flashView3.alpha = 0.0
        flashView4.alpha = 0.0
        flashView5.alpha = 0.0
        
        UIButton.animate(withDuration: 0.5, animations: {
            self.flashView.alpha = 1.0
            self.flashView2.alpha = 1.0
            self.flashView3.alpha = 1.0
            self.flashView4.alpha = 1.0
            self.flashView5.alpha = 1.0
        }, completion: {
            (value: Bool) in
           
            self.blink()
        })
        
        
        
    }


}

