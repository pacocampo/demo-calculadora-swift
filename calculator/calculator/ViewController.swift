//
//  ViewController.swift
//  calculator
//
//  Created by Francisco Ocampo Romero on 03/02/17.
//  Copyright © 2017 devf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var isUserTyping = false
  var isNewOperation = true
  var operador1 = 0.0
  var operador2 = 0.0
  var operacion : String!
  

  //MARK: Outlets
  @IBOutlet weak var equalsButton: UIButton!
  @IBOutlet weak var resultLabel: UILabel!
  @IBOutlet weak var calculadoraButton: UIButton!
  
  //MARK: Functions
  ///Limpia y coloca el número del botón en el label
  @IBAction func putNumber(_ sender: UIButton) {
    clearLabel()
    guard let titulo = sender.currentTitle else {
        print("upps tuvimos un error")
        return
    }
    resultLabel.text = resultLabel.text! + titulo
  }
  
  @IBAction func piCall(_ sender: UIButton) {
    operador1 = Double(resultLabel.text!)!
    self.resultLabel.text = Brain().operationAction(op1: operador1, op2: 0, op: sender.currentTitle!)
    self.isNewOperation = true
    self.isUserTyping = false
  }
  
  
  ///Guarda el tipo de operación junto con el operando 1
  @IBAction func operandoAction(_ sender : UIButton) {
    if isNewOperation {
      operador1 = Double(resultLabel.text!)!
      self.isNewOperation = false
      self.isUserTyping = false
      
    }
    self.operacion = sender.currentTitle!
  }
  
  ///Ejecuta el equals
  @IBAction func operationAction(_ sender : UIButton) {
    operador2 = Double(resultLabel.text!)!
    self.resultLabel.text = Brain().operationAction(op1: operador1, op2: operador2, op: operacion)
    self.isNewOperation = true
    self.isUserTyping = false
  }
  
  func clearLabel() {
    if !isUserTyping {
      resultLabel.text = ""
      isUserTyping = true
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    calculadoraButton.backgroundColor = UIColor.yellow
    // Do any additional setup after loading the view, typically from a nib.
  }


}

