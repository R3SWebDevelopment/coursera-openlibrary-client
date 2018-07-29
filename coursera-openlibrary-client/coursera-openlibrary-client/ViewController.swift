//
//  ViewController.swift
//  coursera-openlibrary-client
//
//  Created by Ricardo Tercero Solis on 29/07/18.
//  Copyright © 2018 R3S Web Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTerm: UITextField!
    @IBOutlet weak var searchResult: UITextView!
    
    let tempResults = """
        {
            "ISBN:978-84-376-0494-7":
                {
                    "publishers": [{"name": "Catedral"}],
                    "pagination": "550 p. :",
                    "identifiers": {"openlibrary": ["OL20654427M"], "isbn_10": ["843760494X"], "librarything": ["5864"], "goodreads": ["789385"]},
                    "title": "Cien años de soledad",
                    "url": "https://openlibrary.org/books/OL20654427M/Cien_años_de_soledad",
                    "notes": "Includes bibliographical references (p. 57-78).",
                    "number_of_pages": 550,
                    "subject_places": [
                        {
                            "url": "https://openlibrary.org/subjects/place:latin_america",
                            "name": "Latin America"
                        },
                        {
                            "url": "https://openlibrary.org/subjects/place:america_latina",
                            "name": "America Latina"
                        },
                        {
                            "url": "https://openlibrary.org/subjects/place:colombia",
                            "name": "Colombia"
                        }
                    ],
                    "subjects": [
                        {
                            "url": "https://openlibrary.org/subjects/fiction",
                            "name": "Fiction"
                        },
                        {
                            "url": "https://openlibrary.org/subjects/macondo_(imaginary_place)",
                            "name": "Macondo (Imaginary place)"
                        },
                        {
                            "url": "https://openlibrary.org/subjects/social_conditions",
                            "name": "Social conditions"
                        },
                        {
                            "url": "https://openlibrary.org/subjects/novela",
                            "name": "Novela"
                        },
                        {
                            "url": "https://openlibrary.org/subjects/condiciones_sociales",
                            "name": "Condiciones sociales"
                        },
                        {
                            "url": "https://openlibrary.org/subjects/translations_into_russian",
                            "name": "Translations into Russian"
                        },
                        {
                            "url": "https://openlibrary.org/subjects/spanish_language_materials",
                            "name": "Spanish language materials"
                        },
                        {
                            "url": "https://openlibrary.org/subjects/criticism_and_interpretation",
                            "name": "Criticism and interpretation"
                        },
                        {
                            "url": "https://openlibrary.org/subjects/colombian_fiction",
                            "name": "Colombian fiction"
                        },
                        {
                            "url": "https://openlibrary.org/subjects/macondo_(lugar_imaginario)",
                            "name": "Macondo (Lugar imaginario)"
                        },
                        {
                            "url": "https://openlibrary.org/subjects/protected_daisy",
                            "name": "Protected DAISY"
                        }
                    ],
                    "subject_people": [
                        {
                            "url": "https://openlibrary.org/subjects/person:gabriel_garcia_marquez_(1928-)",
                            "name": "Gabriel Garcia Marquez (1928-)"
                        }
                    ],
                    "key": "/books/OL20654427M",
                    "authors": [
                        {
                            "url": "https://openlibrary.org/authors/OL4586796A/Gabriel_Garcia_Marquez",
                            "name": "Gabriel Garcia Marquez"
                        }
                    ],
                    "publish_date": "2004",
                    "by_statement": "Gabriel Garcia Marquez ; edicion de Jacques Joset.",
                    "publish_places": [
                        {
                            "name": "Madrid"
                        }
                    ],
                    "subject_times": [
                        {
                            "url": "https://openlibrary.org/subjects/time:20th_century",
                            "name": "20th century"
                        }
                    ]
            }
        }
    """
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Clean all input and output outlets
        self.searchTerm.text = ""
        self.searchResult.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func searchAction(_ sender: Any) {
        self.searchResult.text = self.tempResults
    }
    
    @IBAction func cleanAction(_ sender: Any) {
        self.searchTerm.text = ""
        self.searchResult.text = ""
    }
    
    

}

