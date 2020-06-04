//
//  InterfaceController.swift
//  WatchFitness Extension
//
//  Created by Anzer Arkin on 06.05.20.
//  Copyright © 2020 tensorflow. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {
    let session = WCSession.default
    
    @IBOutlet weak var label: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        session.delegate = self
        session.activate()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

extension InterfaceController: WCSessionDelegate {
  
  func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
  }
  
  func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
    print("received data: \(message)")
    if let value = message["iPhone"] as? String {
        self.label.setText(value)
        WKInterfaceDevice.current().play(.success)
    }
  }
}
