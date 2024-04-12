//
//  CustomClass.swift
//  Client App
//
//  Created by Karthik Datta on 09/04/24.
//

import Foundation

class CustomClass {
    
    func exampleMethod(){
        DispatchQueue.background(delay: 3.0, background: {
            // do something in background
        }, completion: {
            // when background job finishes, wait 3 seconds and do something in main thread
        })

        DispatchQueue.background(background: {
            // do something in background
        }, completion:{
            // when background job finished, do something in main thread
        })

        DispatchQueue.background(delay: 3.0, completion:{
            // do something in main thread after 3 seconds
        })    }
    
    
    
}
