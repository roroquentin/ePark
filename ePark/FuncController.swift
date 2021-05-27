//
//  FuncController.swift
//  ePark
//
//  Created by Hasan Güzelmansur on 27.05.2021.
//

import Foundation

extension MapViewController {
    @objc func verificarDtn() {
        
        do{
            let content = try String(contentsOf: URL(string: obj.url_get_dtn_value)!, encoding: String.Encoding.utf8)
            
            dtnValue = String(content)
            
            print(content)
            
        } catch {
            print("JSON serialization failed: \(error)")
        }
    }
}
