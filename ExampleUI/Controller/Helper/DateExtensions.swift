//
//  DateExtensions.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 09/03/24.
//

import UIKit

/*
 Wednesday, Sep 12, 2018           --> EEEE, MMM d, yyyy
 09/12/2018                        --> MM/dd/yyyy
 09-12-2018 14:11                  --> MM-dd-yyyy HH:mm
 Sep 12, 2:11 PM                   --> MMM d, h:mm a
 September 2018                    --> MMMM yyyy
 Sep 12, 2018                      --> MMM d, yyyy
 Wed, 12 Sep 2018 14:11:54 +0000   --> E, d MMM yyyy HH:mm:ss Z
 2018-09-12T14:11:54+0000          --> yyyy-MM-dd'T'HH:mm:ssZ
 12.09.18                          --> dd.MM.yy
 10:41:02.112                      --> HH:mm:ss.SSS
 */

extension Date {
  
  var dateString: String {
    
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = .current
    dateFormatter.locale = .current
    dateFormatter.dateFormat = "MM/dd/yyyy"
    
    return dateFormatter.string(from: self)
  }
  
  var dateTimeString: String {
    
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = .current
    dateFormatter.locale = .current
    dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
    
    return dateFormatter.string(from: self)
  }
  
  var timeZoneString: String {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = .current
    dateFormatter.locale = .current
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    
    return dateFormatter.string(from: self)
  }
  
  var time: String {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = .current
    dateFormatter.locale = .current
    dateFormatter.dateFormat = "HH:mm:ss.SSS"
    
    return dateFormatter.string(from: self)
  }
  
  var dateTime: String {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = .current
    dateFormatter.locale = .current
    dateFormatter.dateFormat = "dd.MM.yy"
    
    return dateFormatter.string(from: self)
  }
  
  var fullDateString: String {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = .current
    dateFormatter.locale = .current
    dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
    
    return dateFormatter.string(from: self)
  }
}
