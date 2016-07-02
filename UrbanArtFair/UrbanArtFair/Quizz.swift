//
//  Quizz.swift
//  UrbanArtFair
//
//  Created by Mastere 1 IT on 24/06/2016.
//  Copyright © 2016 KotKot. All rights reserved.
//

import Foundation

class Quizz: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var reponse1: UIButton!
    @IBOutlet weak var reponse2: UIButton!
    @IBOutlet weak var reponse3: UIButton!
    @IBOutlet weak var reponse4: UIButton!
    @IBOutlet weak var Next: UIButton!
   
    @IBOutlet weak var LabelEnd: UILabel!

    
    
    var CorrectAnswer = String()
    var RandomNumber = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        RandomNumber = 1
        RandomQuestions()
        Next.hidden = true
        Hide()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func RandomQuestions (){
        
        //var RandomNumber = arc4random() % 2
        
        switch (self.RandomNumber) {
        case 1:
            
            question.text = "Ou est né Bansky?"
            reponse1.setTitle("Copenhague", forState: UIControlState.Normal)
            reponse2.setTitle("Paris", forState: UIControlState.Normal)
            reponse3.setTitle("Londres", forState: UIControlState.Normal)
            reponse4.setTitle("Bristol", forState: UIControlState.Normal)
            CorrectAnswer = "4"
            break
            
            
        case 2:
            
            question.text = "La ville la plus connue pour son graffiti?"
            reponse1.setTitle("New York", forState: UIControlState.Normal)
            reponse2.setTitle("Paris", forState: UIControlState.Normal)
            reponse3.setTitle("Otawa", forState: UIControlState.Normal)
            reponse4.setTitle("Berlin", forState: UIControlState.Normal)
            CorrectAnswer = "4"
            HideQuestion()
            break
        
            
        default:
            
            break
        }
    }
    
    
    func Hide() {
        LabelEnd.hidden = true
    }
    
    func UnHide() {
        LabelEnd.hidden = false
    }
    
    func ChangeLabel(response: String) {
        LabelEnd.text = response
    }
    
    
    func HideQuestion() {
        Next.hidden = true
    }
    
    
    @IBAction func reponse1action(sender: AnyObject) {
        UnHide()
        if (CorrectAnswer == "1") {
            ChangeLabel("Bonne réponse !")
        
             self.Next.hidden = false
            
        }
            
            
        else {
            ChangeLabel("Mauvaise réponse !")
             Next.hidden = true
        }
    }
    
    @IBAction func reponse2action(sender: AnyObject) {
        UnHide()
        if (CorrectAnswer == "2") {
            ChangeLabel("Bonne réponse !")
          
             Next.hidden = false
          
        }
        else {
            ChangeLabel("Mauvaise réponse !")
             Next.hidden = true
        }
    }
    
    @IBAction func reponse3action(sender: AnyObject) {
        UnHide()
        if (CorrectAnswer == "3") {
            ChangeLabel("Bonne réponse !")
             Next.hidden = false
        }
        else {
            ChangeLabel("Mauvaise réponse !")
             Next.hidden = true
        }
    }
    
    @IBAction func reponse4action(sender: AnyObject) {
        UnHide()
        if (CorrectAnswer == "4") {
            ChangeLabel("Bonne réponse !")
            Next.hidden = false
        }
        else {
            ChangeLabel("Mauvaise réponse !")
             Next.hidden = true
        }
    }
    
    
    @IBAction func Next(sender: AnyObject) {
        Hide()
        self.RandomNumber = 2
        RandomQuestions()
    }
    
    

    
    
}