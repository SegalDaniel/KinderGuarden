//
//  HeartRateViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 02/06/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class HeartRateViewController: MyViewController {

    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var bpmLabel: UILabel!
    var pulseListener:NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateView(heartImageView, animate: true)
        pulseListener = ModelNotification.pulseAlert.observe(cb: { (pulse) in
            DispatchQueue.main.async {
                self.bpmLabel.text = "דופק: \(pulse)"
            }
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Model.instance.startPollingPulseAlerts()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Model.instance.stopPulseAlertPolling()
    }
    
    func animateView(_ view: UIView, animate: Bool) {
        if animate {
            UIView.animate(withDuration: 1.0, delay: 0, options: [.autoreverse, .repeat, .allowUserInteraction], animations: {
                            view.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)}, completion: nil)
        }
        else {
            self.view.layer.removeAllAnimations()
            UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseOut, .beginFromCurrentState, .allowUserInteraction], animations: { view.transform = CGAffineTransform.identity}, completion: nil)
        }
    }
}
