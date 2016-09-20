//
//  ViewController.swift
//  MotionExample
//
//  Created by Alexandra Kaulfuss on 03.08.16.
//  Copyright © 2016 Alexandra Kaulfuss. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var currentAccXmax: Double = 0.0
    var currentAccYmax: Double = 0.0
    var currentAccZmax: Double = 0.0
    
    var movementManager = CMMotionManager()

    // MARK: Properties
    
    @IBOutlet weak var accX: UILabel!
    @IBOutlet weak var accY: UILabel!
    @IBOutlet weak var accZ: UILabel!
    
    @IBOutlet weak var accXmax: UILabel!
    @IBOutlet weak var accYmax: UILabel!
    @IBOutlet weak var accZmax: UILabel!
    
    
    @IBAction func resetMaxValues(sender: UIButton) {
        currentAccXmax = 0.0
        currentAccYmax = 0.0
        currentAccZmax = 0.0
    }
    
    override func viewDidLoad() {

        currentAccXmax = 0.0
        currentAccYmax = 0.0
        currentAccZmax = 0.0
        
        movementManager.gyroUpdateInterval = 0.2
        movementManager.accelerometerUpdateInterval = 0.2
        
        //Start Recording Data
        
        movementManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!) { (accelerometerData: CMAccelerometerData?, NSError) -> Void in
            
            self.outputAccData(accelerometerData!.acceleration)
            if(NSError != nil) {
                print("\(NSError)")
            }
        }
        
        super.viewDidLoad()

    }
    
    func outputAccData(acceleration: CMAcceleration){
        
        accX?.text = "\(acceleration.x).2fg"
        
        if fabs(acceleration.x) > fabs(currentAccXmax) {
            currentAccXmax = acceleration.x
        }

        
        accY?.text = "\(acceleration.y).2fg"
        
        if fabs(acceleration.y) > fabs(currentAccYmax) {
            currentAccYmax = acceleration.y
        }
        
        accZ?.text = "\(acceleration.z).2fg"

        if fabs(acceleration.z) > fabs(currentAccZmax) {
            currentAccZmax = acceleration.z
        }
        
        accXmax.text = "\(currentAccXmax).2f"
        accYmax.text = "\(currentAccYmax).2f"
        accZmax.text = "\(currentAccZmax).2f"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

