//
//  HeartRateViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 02/06/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class HeartRateViewController: MyViewController {
    
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var pulsesTableView: UITableView!
    var pulseListener:NSObjectProtocol?
    var pulses:[Int] = []
    var pulsesCount:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pulsesTableView.dataSource = self
        pulsesTableView.delegate = self
        pulseListener = ModelNotification.multiPulseAlerts.observe(cb: { (count, pulses) in
            DispatchQueue.main.async {
                self.pulses = pulses
                self.pulsesCount = count
                self.pulsesTableView.reloadData()
                self.participantsLabel.text = "מספר משתתפים: \(count)"
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
}

extension HeartRateViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pulsesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "heartRateCell") as! HeartRateTableViewCell
        cell.pulseLabel.text = "דופק \(pulses[indexPath.row])"
        if !cell.animated{
            animateView(cell.heartImageView, animate: true)
            cell.animated = true
        }
        adjustPulseLabel(p: pulses[indexPath.row], pulseLabel: cell.pulseLabel)
        return cell
    }
    
    func adjustPulseLabel(p:Int, pulseLabel:UILabel){
        if p < 40 && p > 20{
            pulseLabel.textColor = UIColor.orange
            self.animateViewEmergency(pulseLabel, animate: true)
        }
        else if p >= 0 && p <= 20{
            pulseLabel.textColor = UIColor.red
            self.animateViewEmergency(pulseLabel, animate: true)
        }
        else{
            pulseLabel.textColor = Utility.btnTextWhite
            self.animateViewEmergency(pulseLabel, animate: false)
        }
    }
    
    func animateView(_ view: UIView, animate: Bool) {
        if animate {
            UIView.animate(withDuration: 1.0, delay: 0, options: [.autoreverse, .repeat, .allowUserInteraction], animations: {
                view.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)}, completion: nil)
        }
        else {
            view.layer.removeAllAnimations()
            UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseOut, .beginFromCurrentState, .allowUserInteraction], animations: { view.transform = CGAffineTransform.identity}, completion: nil)
        }
    }
    
    func animateViewEmergency(_ view: UIView, animate: Bool) {
        if animate {
            UIView.animate(withDuration: 0.3, delay: 0, options: [.autoreverse, .repeat, .allowUserInteraction], animations: {
                view.alpha = 0.0}, completion: nil)
        }
        else {
            view.layer.removeAllAnimations()
            UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseOut, .beginFromCurrentState, .allowUserInteraction], animations: { view.alpha = 1.0}, completion: nil)
        }
    }
}
