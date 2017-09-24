//
//  WindowManager.swift
//  ToolKit
//
//  Created by Franky on 21/09/2017.
//  Copyright © 2017 Franky. All rights reserved.
//

import Cocoa


let storyboard = NSStoryboard(name: "Main", bundle: nil)

class WindowManager: NSObject {
    
    lazy var QRWindowController = storyboard.instantiateController(withIdentifier: "QR Window Controller") as? NSWindowController
    lazy var EncodeWindowController = storyboard.instantiateController(withIdentifier: "Encode Window Controller") as? NSWindowController
    
    class var shared: WindowManager {
        struct Static {
            static let instance: WindowManager = WindowManager()
        }
        return Static.instance
    }
}
