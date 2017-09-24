//
//  AppDelegate.swift
//  ToolKit
//
//  Created by Franky on 20/09/2017.
//  Copyright © 2017 Franky. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSSquareStatusItemLength)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named: "StatusBarButtonImage")
        }
        constructMenu()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @objc func showQRCodeWindow(_ sender: Any?) {
        if let windowController = WindowManager.shared.QRWindowController {
            windowController.showWindow(self)
            NSApplication.shared().activate(ignoringOtherApps: true)
        }
    }
    
    @objc func showEncodeWindow(_ sender: Any?) {
        if let windowController = WindowManager.shared.EncodeWindowController {
            windowController.showWindow(self)
            NSApplication.shared().activate(ignoringOtherApps: true)
        }
    }
    
    @objc func terminate(_ sender: Any?) {
        
    }
    
    func constructMenu() {
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "QR Code", action: #selector(showQRCodeWindow(_:)), keyEquivalent: "R"))
        menu.addItem(NSMenuItem(title: "Encode", action: #selector(showEncodeWindow(_:)), keyEquivalent: "E"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quote", action: #selector(terminate(_:)), keyEquivalent: "Q"))
        
        statusItem.menu = menu;
    }


}

