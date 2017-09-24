//
//  QRViewController.swift
//  ToolKit
//
//  Created by Franky on 23/09/2017.
//  Copyright © 2017 Franky. All rights reserved.
//

import Cocoa

class QRViewController: NSViewController, NSTextViewDelegate {

    @IBOutlet var textView: NSTextView!
    @IBOutlet weak var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.font = NSFont(name: "Menlo", size: 16)
        textView.delegate = self
    }
    
    func textDidChange(_ notification: Notification) {
        if let string = textView.string {
            print(string)
            if let image = QRCode(string: string)?.image {
                imageView.image = image
            }
        }
    }
}
