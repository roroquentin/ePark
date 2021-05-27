//
//  IoTObj.swift
//  ePark
//
//  Created by Hasan Güzelmansur on 27.05.2021.
//

import UIKit

class IoTObj: NSObject{
    
    let api_key : String = "7RRHBA8XJF80Y1CL"
    
    let url_post_commands : String = "https://api.thingspeak.com/talkbacks/42824/commands.json"
        
    let url_get_dtn_value : String = "https://api.thingspeak.com/channels/1359671/fields/1/last.txt?api_key=7RRHBA8XJF80Y1CL"
    
    var request : URLRequest!
        
    var postAPIString : String = "{ \"api_key\": \"7RRHBA8XJF80Y1CL\""
    
    
    
    func getDtn(){
        
        request = URLRequest(url: URL(string: url_post_commands)!)
        request.httpMethod = "POST"
                
        let postString = postAPIString + " , \"https://api.thingspeak.com/talkbacks/42824/commands/last.json?api_key=VUAD8DKJ8IO9KQC4\": \"dtn\"}"
                
        request.httpBody = postString.data(using: String.Encoding.utf8)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        ejecutarComando()
    }
    
    func ejecutarComando() {
         let task = URLSession.shared.dataTask(with: request) {
             data, response, error in
             //let res = String(data: data!, encoding: String.Encoding.utf8)
             //print(res!)
         }
         task.resume()
     }
    
}

