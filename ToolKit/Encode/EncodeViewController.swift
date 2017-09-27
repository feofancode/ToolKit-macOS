//
//  EncodeViewController.swift
//  ToolKit
//
//  Created by Franky on 24/09/2017.
//  Copyright © 2017 Franky. All rights reserved.
//

import Cocoa

class EncodeViewController: NSViewController {

    @IBOutlet var textView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        textView.font = NSFont(name: "Menlo", size: 16)
    }
    
    @IBAction func encodeButtonClicked(_ sender: Any) {
        let characterSet = CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[]")
        textView.string = textView.string?.addingPercentEncoding(withAllowedCharacters: characterSet.inverted)
    }
    @IBAction func decodeButtonClicked(_ sender: Any) {
        textView.string = textView.string?.removingPercentEncoding
    }
}
