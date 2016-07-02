//
//  Conference.swift
//  UrbanArtFair
//
//  Created by Mastere 1 IT on 23/06/2016.
//  Copyright © 2016 KotKot. All rights reserved.
//

import Foundation

class Planning {
    
    var conf : [Conference] = []
    
    init() {
        let conf1 = Conference(name: "Conference du nouveau Street Art", time: "10-04-2016", intervenant: "Thierry Duval", desc: "Critique d’art et conservateur indépendant, Docteur en philosophie, en architecture et en histoire de l’art, il est Professeur adjoint en Histoire de l’art contemporain à l’Université de Bologne (Campus de Ravenne) et conférencier en théories de la perception à l’académie de beaux arts de Bergame. Il a collaboré à différentes rubriques des magazines Exibart, Digicult, et écrit régulièrement pour Artribune. Il a participé en tant qu’intervenant à des conférences internationales sur l’art urbain en Italie et à l’étranger. Il est co-conservateur du projet Frontier – The Line of Style et fait partie du comité scientifique du Festival roBOt. Il a publié de nombreux articles et essais sur les thématiques du Graffiti et du Street Art et il est co-éditeur du volume Frontier The Line of Style (Damiani, 2013).")
        conf.append(conf1)
        
        let conf2 = Conference(name: "Comment faire du Street Art ?", time: "11-04-2016", intervenant: "Jean Dupont" ,desc: "Docteur en philosophie, critique d’art et conservatrice indépendante. Elle est professeur à l’académie des beaux arts de Bologne et de Bergame. Elle écrit régulièrement pour Flash Art. Elle a édité de nombreux livres et a écrit plusieurs essais, dont : Frontier The Line of Style (w C. Musso), Damiani, Bologne 2013; Tell a Vision.  Il video tra storia e critica, Libri Aparte, Bergame 2012; Do The Right Wall/Fai Il Muro Giusto, Edizioni MAMbo, Bologne, 2010; La mia strada continua e vive oggi più di prima. Il Writing a Bologna dalla fine Settanta a Oggi, in P. PIERI, C. CRETELLA (a cura di), Atlante dei movimenti culturali contemporanei dell’Emilia Romagna 1968-2007. Scritture, Arti, Controculture, Clueb, Bologne, 2007; I’ll be your mirror. Travestimenti fotografici, Cooper & Castelvecchi, Rome, 2003.")
        conf.append(conf2)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let data = NSUserDefaults.standardUserDefaults().objectForKey("myListPlanning") as? NSData {
            let _mySavedListPlanning = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! [Conference]
            conf = _mySavedListPlanning
        }
        
    }
}