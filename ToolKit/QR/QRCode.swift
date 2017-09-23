//
//  QRCode.swift
//  ToolKit
//
//  Created by Franky on 23/09/2017.
//  Copyright © 2017 Franky. All rights reserved.
//

import Cocoa

struct QRCode {
    public enum ErrorCorrection: String {
        case Low = "L"
        case Medium = "M"
        case Quartile = "Q"
        case High = "H"
    }
    
    public let data: Data
    
    public var color = CIColor(red: 0, green: 0, blue: 0)
    
    public var backgroundColor = CIColor(red: 1, green: 1, blue: 1)
    
    public var size = CGSize(width: 200, height: 200)
    
    public var errorCorrection = ErrorCorrection.Low
    
    public init(_ data: Data) {
        self.data = data
    }
    
    public init?(string: String) {
        if let data = string.data(using: .utf8) {
            self.data = data
        } else {
            return nil
        }
    }
    
    public init?(url: URL) {
        if let data = url.absoluteString.data(using: .utf8) {
            self.data = data
        } else {
            return nil
        }
    }
    
    public var image: NSImage? {
        guard let ciImage = ciImage else { return nil }
        
        let ciImageRep = NSCIImageRep(ciImage: ciImage)
        let tinyImage = NSImage()
        tinyImage.addRepresentation(ciImageRep)
        if size.width < ciImageRep.size.width {
            return tinyImage
        }
        let nsImage = NSImage(size: size)
        nsImage.lockFocus()
        NSGraphicsContext.current()?.imageInterpolation = .none
        tinyImage.draw(in: NSRect(origin: CGPoint.zero, size: size))
        nsImage.unlockFocus()
        return nsImage
    }
    
    public var ciImage: CIImage? {
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        
        qrFilter.setDefaults()
        qrFilter.setValue(data, forKey: "inputMessage")
        qrFilter.setValue(self.errorCorrection.rawValue, forKey: "inputCorrectionLevel")
        
        guard let colorFilter = CIFilter(name: "CIFalseColor") else { return nil }
        colorFilter.setDefaults()
        colorFilter.setValue(qrFilter.outputImage, forKey: "inputImage")
        colorFilter.setValue(color, forKey: "inputColor0")
        colorFilter.setValue(backgroundColor, forKey: "inputColor1")
        
        return colorFilter.outputImage
    }
}
