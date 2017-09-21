//
//  QRWindowController.swift
//  ToolKit
//
//  Created by Franky on 21/09/2017.
//  Copyright © 2017 Franky. All rights reserved.
//

import Cocoa

class QRWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    override func close() {
        super.close()
        WindowManager.shared.window = nil
    }

}
