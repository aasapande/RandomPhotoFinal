//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Aasavari Pande on 01/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageview: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.backgroundColor = .white
        
        return imageview
    }()
    
    let colours:[UIColor]=[
        .systemPink,
        .systemRed,
        .systemBlue,
        .systemCyan,
        .systemGray,
        .systemTeal,
        .systemBrown,
        .systemOrange,
        .systemIndigo
    ]
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("Click Me!", for: .normal)
        
        button.setTitleColor(.black, for: .normal)
        
        button.layer.cornerRadius = 10
        
        button.clipsToBounds = true
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(imageview)
        imageview.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageview.center = view.center
        imageview.layer.cornerRadius = 50
        imageview.clipsToBounds = true
        imageview.layer.borderWidth = 5
        imageview.layer.borderColor = UIColor.black.cgColor
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(didtapbutton), for: .touchUpInside)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
    
        getRandomPhoto()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 80, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-160, height: 50)

    }
    @objc func didtapbutton(){
        getRandomPhoto()
        view.backgroundColor = colours.randomElement()
        
    }
    
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else{
            return
            
        }
        imageview.image = UIImage(data: data)
    }


}

