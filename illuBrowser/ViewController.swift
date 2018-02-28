//
//  ViewController.swift
//  illuBrowser
//
//  Created by Friedrich, Ben   (fried017) on 2/27/18.
//  Copyright © 2018 Friedrich, Ben   (fried017). All rights reserved.
//

import UIKit

// Holds all information about a single illustration to be displayed
class Illustration {
    let missingImage = UIImage(named: "noImage")
    let defaultColor = UIColor.blue
    
    var url: String             //URL to the image.  Fetch from URL for small app size
    var title: String           //Title for the illustration
    var image: UIImage          //The fetched image
    var color: UIColor          //Images default Color
    var extras:                 //Any extras to be displayed for this illustration
        [IllustrationExtra] = []
    var tags: [String] = []     //Any tags or collections associated with this illu
    var collections: [String] = []
    
    //Initialization for an illustration, just needs the URL and title
    init(illuUrl: String, illuTitle: String){
        url = illuUrl
        title = illuTitle
        image = missingImage!
        color = defaultColor
        
        image = fetchImage()
        setColor(targetColor: findMainColor())
    }
    
    //Finds the main color of the image
    func findMainColor() -> UIColor
    {
        //ToDo: Calculate the main color of the image
        //Add every pixel to a color range, select most populated range
        //let groupBy = 15
        
        
        //All colors found so far
        /*
        var colors = [UIColor: Int]()
        
        for y in 0 ..< Int(image.size.height) {
            for x in 0 ..< Int(image.size.width){
                
            }
        }
        */
        return UIColor.cyan
    }
    
    //Fetch the image from the supplied URL
    func fetchImage() -> UIImage
    {
        let imageUrl:URL = URL(string: url)!
        let imageData:NSData = NSData(contentsOf: imageUrl)!
        
        image = missingImage!
        image = UIImage(data: imageData as Data)!
        
        //ToDo: Check of found data is an image, if not return missingImage
        return image;
    }
    
    //Returns an IllustrationCollection of images related to this one
    func getRelatedIllustrations()->IllustrationCollection
    {
        //Create an empty collection
        var illuCollection: IllustrationCollection = IllustrationCollection()
        
        //Add images to collection that are related.
        //ToDo: Go though tags to find most related images. Sort by popularity default
        
        return illuCollection
    }
    
    //Set the color for this image
    func setColor(targetColor: UIColor)
    {
        color = targetColor
    }
    
    //Add an IllustrationExtra to this illu
    func addExtra(extra: IllustrationExtra)
    {
        extras.append(extra)
    }
    
    //Add a tag to this illustration
    func addTag(tag: String)
    {
        if(!tags.contains(tag)){
            tags.append(tag)
        }
    }
    
    //Add a collection to this illustration
    func addCollection(collection: String)
    {
        if(!collections.contains(collection)){
            collections.append(collection)
        }
    }
    
    //Returns all of the required panels for this illu
    func panelsForIllustration()->[Panel]
    {
        var panels: [Panel] = []
        
        return panels;
    }
}

//Extra info for an illustration to display
class IllustrationExtra{
    
    }

// If the illustration was drawn from a specific reference
class IllustrationExtra_Reference : IllustrationExtra{
    var title, url: String
    
    init(referenceTitle: String, referenceUrl: String)
    {
        title = referenceTitle
        url = referenceUrl
    }
}

//Panels are the building blocks of the illustration browser
class Panel{
    func fillIn()
    {
        
    }
    
    func hide()
    {
        
    }
    
    func show()
    {
        
    }
}

//The panel that holds the current main illustration
class Panel_Main{
    var illustration: Illustration
    
    init(panelIllustration: Illustration)
    {
        illustration = panelIllustration
    }
}

//Panel that contains related images for Panel_Main
class Panel_Related{
    var illustrations: IllustrationCollection
    
    init(mainIllustration: Illustration)
    {
        illustrations = mainIllustration.getRelatedIllustrations()
    }
}

class IllustrationCollection
{
    var illustrations: [Illustration] = []
    
}

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    //The main panel is limited to just one so using a static var
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Main panel and array to hold all secondary panels
        var panels:[Panel]=[]
        var mainPanel: Panel_Main
        
        //HardCoding the 'database' for now
        //ToDo: Figure out a real database solution
        var mainIllustration: Illustration
        mainIllustration = Illustration(illuUrl: "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png", illuTitle: "Google")
        
        mainPanel = Panel_Main(panelIllustration: mainIllustration)
        
        imageView.image = mainPanel.illustration.image
        mainPanel.illustration.setColor(targetColor: UIColor.red)
        panels = mainPanel.illustration.panelsForIllustration()
        
        view.backgroundColor = mainIllustration.color
        //Build correct panels for this illustration
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

