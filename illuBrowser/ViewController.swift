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
        color = findMainColor()
    }
    
    //Finds the main color of the image
    func findMainColor() -> UIColor
    {
        //ToDo: Calculate the main color of the image
        //Add every pixel to a color range, select most populated range
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
}

//An extra Panel to be
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

class ViewController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var mainIllustration: Illustration
        mainIllustration = Illustration(illuUrl: "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png", illuTitle: "Google")
        
        //Test out an Illustration object
        mainImage.image = mainIllustration.image
        
        //Build correct panels for this illustration
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

