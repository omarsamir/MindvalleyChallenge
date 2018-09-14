//
//  ResourseController.swift
//  MindvalleyChallenge
//
//  Created by Omar Samir on 9/14/18.
//  Copyright © 2018 Omar Samir. All rights reserved.
//

import UIKit
import ObjectMapper

class ResourceController: NSObject {

    static func getResources(completion: @escaping (_ result: [Resource]?, _ error: NSError?) -> Void) {
        let url = URL(string: Constants.RESOURCES_URL)
        var request : URLRequest = URLRequest(url: url!)
        request.httpMethod = Constants.HTTPREQUEST_TYPE_GET
        let dataTask = URLSession.shared.dataTask(with: request) {
            data,response,error in
            do {
                let responseDictionary = try! JSONSerialization.jsonObject(with: data!, options: [])
                if let theJSONData = try? JSONSerialization.data(
                    withJSONObject: responseDictionary,
                    options: []) {
                    let theJSONText = String(data: theJSONData,
                                             encoding: .ascii)
                    let resources : [Resource] = [Resource](JSONString: theJSONText!)!
                    completion(resources,nil)
                }
            } catch let error as NSError {
                completion(nil,error)
            }
        }
        dataTask.resume()
    }
}