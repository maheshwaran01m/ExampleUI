//
//  Platform.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif


#if os(iOS) || os(tvOS)
public typealias PlatformView = UIView
public typealias PlatformImage = UIImage
public typealias PlatformColor = UIColor

#else
public typealias PlatformView = NSView
public typealias PlatformImage = NSImage
public typealias PlatformColor = NSColor
#endif

