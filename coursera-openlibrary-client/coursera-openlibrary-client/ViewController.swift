//
//  ViewController.swift
//  coursera-openlibrary-client
//
//  Created by Ricardo Tercero Solis on 29/07/18.
//  Copyright © 2018 R3S Web Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchTerm: UITextField!
    @IBOutlet weak var resultTitle: UITextField!
    @IBOutlet weak var resultAuthors: UITextView!
    @IBOutlet weak var resultCover: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Clean all input and output outlets
        self.searchTerm.text = ""
        self.resultTitle.text = ""
        self.resultAuthors.text = ""
        self.searchTerm.delegate = self
        
        // Show keyboard by default
        self.searchTerm.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func searchAction(_ sender: Any) {
        self.searchBook(isbn: self.searchTerm.text!)
    }
    
    @IBAction func cleanAction(_ sender: Any) {
        self.searchTerm.text = ""
        self.resultCover.image = nil
        self.resultAuthors.text = ""
        self.resultTitle.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        self.searchTerm.resignFirstResponder()
        self.searchBook(isbn: self.searchTerm.text!)
        return true
    }
    
    func searchBook(isbn: String) -> Void {
        
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + isbn
        let url = URL(string: urls)
        
        let session = URLSession.shared
        
        let compleationHandler = {
            (data: Data?, resp: URLResponse?, error: Error?) -> Void in
            if let error = error {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Request Error", message: error.localizedDescription, preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    
                    self.present(alert, animated: true)
                }
            }
            else {
                do{
                    let jsonObject = try JSONSerialization.jsonObject(with: data!, options: [])
                    let json = jsonObject as! [String: Any]
                    let rootKey = "ISBN:" + isbn
                    let bookData = json[rootKey] as! [String: Any]
                    let authors = bookData["authors"] as? Array<[String:Any]>
                    var authorNames = ""
                    for author in authors! {
                        authorNames += (author["name"] as? String)! + "\n"
                    }
                    var image :UIImage?
                    if let cover = bookData["cover"] as? [String: Any]{
                        if let coverUrl = cover["large"] as? String{
                            let url = URL(string: coverUrl)
                            let data = try? Data(contentsOf: url!)
                            
                            if let imageData = data {
                                image = UIImage(data: imageData)
                            }
                        }else if let coverUrl = cover["medium"] as? String{
                            let url = URL(string: coverUrl)
                            let data = try? Data(contentsOf: url!)
                            
                            if let imageData = data {
                                image = UIImage(data: imageData)
                            }
                        }else if let coverUrl = cover["small"] as? String{
                            let url = URL(string: coverUrl)
                            let data = try? Data(contentsOf: url!)
                            
                            if let imageData = data {
                                image = UIImage(data: imageData)
                            }
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.resultTitle.text = bookData["title"] as? String
                        self.resultAuthors.text = authorNames
                        if (image != nil) {
                            self.resultCover.image = image!
                        }
                    }
                }catch _{
                    
                }
            }
        }
        
        session.dataTask(with: url!, completionHandler: compleationHandler).resume()
        
    }
    
}

