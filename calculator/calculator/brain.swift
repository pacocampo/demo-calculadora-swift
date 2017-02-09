//
//  brain.swift
//  calculator
//
//  Created by Francisco Ocampo Romero on 07/02/17.
//  Copyright © 2017 devf. All rights reserved.
//

import Foundation

enum Operacion {
  case simple((Double, Double)-> Double)
  case pi((Double)-> Double)
}

class Brain {
  
  var operations : Dictionary<String, Operacion> = [
    "➕" : Operacion.simple({ $0 + $1}),
    "➖" : Operacion.simple({ $0 - $1}),
    "✖️" : Operacion.simple({ $0 * $1}),
    "💩" : Operacion.pi({ $0 * M_PI })
  ]
  
  func operationAction(op1 : Double, op2 : Double, op : String) -> String {
    let result : String!
    let myoperation = self.operations[op]
    switch myoperation! {
    case .simple(let function): result = String(function(op1, op2))
    case .pi(let function): result = String(function(op1))
    }
    return result
  }
}
