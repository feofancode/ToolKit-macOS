//
//  QRViewController.swift
//  ToolKit
//
//  Created by Franky on 23/09/2017.
//  Copyright © 2017 Franky. All rights reserved.
//

import Cocoa

class QRViewController: NSViewController {

    @IBOutlet var textView: NSTextView!
    @IBOutlet weak var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.font = NSFont(name: "Menlo", size: 16)
//        textView.textStorage?.font = NSFont(name: "Menlo", size: 16)
    }
    @IBAction func generateButtonClicked(_ sender: Any) {
        if let string = textView.string {
            if let image = QRCode(string: string)?.image {
                imageView.image = image
            }
        }
    }
}
