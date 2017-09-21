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
        let storyBoard = NSStoryboard(name: "Main", bundle: nil)
        if let windowController = storyBoard.instantiateController(withIdentifier: "QR Code Window") as? NSWindowController, let window = windowController.window {
            WindowManager.shared.window = window
            window.makeKeyAndOrderFront(nil)
        }
        print("hahaha")
    }
    
    @objc func terminate(_ sender: Any?) {
        
    }
    
    func constructMenu() {
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "QR Code", action: #selector(showQRCodeWindow(_:)), keyEquivalent: "P"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quote", action: #selector(terminate(_:)), keyEquivalent: "Q"))
        
        statusItem.menu = menu;
    }


}

