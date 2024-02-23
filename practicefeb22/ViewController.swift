//
//  ViewController.swift
//  practicefeb22
//
//  Created by Arii on 2024-02-22.
//

import UIKit

class ViewController: UIViewController, HeartRateMonitorControllerDelegate {

    @IBOutlet weak var labeltext: UILabel!
    lazy var heartRateMonitor = HeartRateMonitorController() //lazy because it will created only when it is needed no prior creation
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttontext(_ sender: Any) {
        heartRateMonitor.pointToCaller = self
        heartRateMonitor.delegate = self
        heartRateMonitor.startMonitoring()
        labeltext.text = "\(heartRateMonitor.gBpm)"
    }
    func updateLable(witBpm : Int){
    }
    func heartRateMonitorUpdate(pbm : Int){
        print(pbm)
    }
    func numberOfCycles() -> Int{
        return 20
    }
}

protocol HeartRateMonitorControllerDelegate{
    func heartRateMonitorUpdate(pbm : Int)
    func numberOfCycles() -> Int
}

class HeartRateMonitorController{
    var gBpm = 0
    var delegate: ViewController?
    var pointToCaller : ViewController?
    var name: String?
    
    func startMonitoring(){
        for x in 1...(delegate?.numberOfCycles() ?? 100){
            let bpm = Int.random(in: 60...100)
            gBpm = bpm
            print(bpm)
            delegate?.heartRateMonitorUpdate(pbm: bpm)
        }
    }
}

