//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ömer on 5.05.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var hpyLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func getRatesClicked(_ sender: Any) {
        //Request & Session
        //Response & Data
        //Parsing
        
        //1
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=4f0f65408fa3fa136a8938b019788c4b")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            
            if(error != nil){
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true)
                
            }else{
                //2
                if(data != nil){
                    
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,Any>
                          
                          DispatchQueue.main.async {
                              
                              if let raset = jsonResponse["rates"] as? [String : Any]{
                                  
                                  if let cad = raset["CAD"] as? Double {
                                      self.cadLabel.text = "CAD: \(cad)"
                                  }
                                  
                                  if let chf = raset["CHF"] as? Double {
                                      self.chfLabel.text = "CHF: \(chf)"
                                  }
                                  
                                  if let gbp = raset["GBP"] as? Double {
                                      self.gbpLabel.text = "GBP: \(gbp)"
                                  }
                                  
                                  if let hpy = raset["JPY"] as? Double {
                                      self.hpyLabel.text = "JPY: \(hpy)"
                                  }
                                  
                                  if let usd = raset["USD"] as? Double {
                                      self.usdLabel.text = "USD: \(usd)"
                                  }
                                  
                                  if let trys = raset["TRY"] as? Double {
                                      self.tryLabel.text = "TRY: \(trys)"
                                  }
                                  
                                  
                              }
                              
                          }
                        
                    }catch{
                        print("error")
                    }
                    
                    
                }
                
                
            }
            
        }
        
        task.resume()
        
    }
    
    
    
}

