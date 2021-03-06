//
//  Request.swift
//  ConvertCurrency
//
//  Created by George Kye on 2016-08-14.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation


struct Request{
  
  static func getRequest(base: String = "USD", completionHandler: (RateModel?, json: JSON?) -> ()) -> (){
    let url = "https://api.fixer.io/latest?base=\(base)"
    guard let data = try? Data(contentsOf: URL(string: url)!)else{
      print("URL Request failed")
      completionHandler(nil, json: nil)
      return
    }
    let json = JSON(data: data)
    completionHandler(RateModel.init(json: json["rates"]), json: json)
  }
}
