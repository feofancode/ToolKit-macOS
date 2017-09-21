//
//  WindowManager.swift
//  ToolKit
//
//  Created by Franky on 21/09/2017.
//  Copyright © 2017 Franky. All rights reserved.
//

import Cocoa


class WindowManager: NSObject {
    var window: NSWindow?
    
    class var shared: WindowManager {
        struct Static {
            static let instance: WindowManager = WindowManager()
        }
        return Static.instance
    }
}
