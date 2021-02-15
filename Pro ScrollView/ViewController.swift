//
//  ViewController.swift
//  Pro ScrollView
//
//  Created by Hossam on 12/20/19.
//  Copyright © 2019 Hossam. All rights reserved.
//

import UIKit
import SwiftUI
class ViewController: UIViewController {

    override func loadView() {
        self.view = UIView()
        view.backgroundColor = .white
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        switch self.view.traitCollection.horizontalSizeClass {
        case .regular : setupMyScrollView()
            
        case .compact : print("GGG")
        case .unspecified : print("")
        }
    }
    
   
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
    }
    func setupMyScrollView(){
      
        let scrollView = UIScrollView()
        scrollView.indicatorStyle = .black
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        let scrollFrame = scrollView.frameLayoutGuide
        let scrollContent = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([scrollFrame.leadingAnchor.constraint(equalTo: view.leadingAnchor) ,
                                     scrollFrame.topAnchor.constraint(equalTo: view.topAnchor) ,
                                     scrollFrame.trailingAnchor.constraint(equalTo: view.trailingAnchor) ,
                                     scrollView.heightAnchor.constraint(equalToConstant: 200)])
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints  = false
        scrollView.addSubview(stackView)
        
        
        let image1 : UIImageView = {
            let image = UIImage(named: "1.jpeg")
            let imageView = UIImageView(image: image)
           
            imageView.contentMode = .scaleToFill
            imageView.translatesAutoresizingMaskIntoConstraints =  false
             imageView.clipsToBounds = true
            return imageView
        
        }()
    
        
        let image2 : UIImageView = {
                   let image = UIImage(named: "1.jpeg")
                   let imageView = UIImageView(image: image)
                    imageView.clipsToBounds = true
                   imageView.contentMode = .scaleToFill
                   imageView.translatesAutoresizingMaskIntoConstraints =  false
                   
                   return imageView
               
               }()
        let image3 : UIImageView = {
                   let image = UIImage(named: "1.jpeg")
                   let imageView = UIImageView(image: image)
            
                   
            imageView.contentMode = .scaleToFill
            imageView.clipsToBounds = true
                   imageView.translatesAutoresizingMaskIntoConstraints =  false
                   
                   return imageView
               
               }()
        
       
        stackView.addArrangedSubview(image1)
        stackView.addArrangedSubview(image2)
        stackView.addArrangedSubview(image3)

        //stackView
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
               
        
        stackView.centerXAnchor.constraint(equalTo: scrollFrame.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollContent.topAnchor).isActive = true
        
        stackView.bottomAnchor.constraint(equalTo: scrollContent.bottomAnchor).isActive = true
       
        
        
        
    }

    
}
@available(iOS 13.0.0, *)
struct VCPreview : PreviewProvider {
    static var previews: some View {
    VCContainerView()
    }
    struct VCContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<VCPreview.VCContainerView>) -> UIViewController {
        return ViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<VCPreview.VCContainerView>) {
            
        }
        
        
        
    typealias UIViewControllerType = UIViewController
    }
    
}

