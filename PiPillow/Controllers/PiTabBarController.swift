//
//  PiTabBarController.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 14.05.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import UIKit

class PiTabBarController: UITabBarController {
    
    //MARK: - Properties
    @IBOutlet weak var tabBarContainerView: UIView!
    
    var currentIndex = 0
    
    override var selectedIndex: Int {
        didSet {
            currentIndex = selectedIndex
            updateUI()
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for view in tabBarContainerView.subviews {
            if let btn = view as? UIButton {
                btn.imageView?.alpha = 0.5
            }
        }
        
        let currentTab = tabBarContainerView.viewWithTag(currentIndex) as! UIButton
        currentTab.backgroundColor = #colorLiteral(red: 0, green: 0.6823529412, blue: 0.8705882353, alpha: 1)
        currentTab.imageView?.alpha = 1
        currentIndex = self.selectedIndex
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Privates
    
    @IBAction func changeTab(_ sender: UIButton) {
        self.selectedIndex = sender.tag
        currentIndex = sender.tag
        
        updateUI()
    }
    //MARK: - Navigation
    
    func select(index: Int, previousIndex: Int) {
        self.currentIndex = index
        self.selectedIndex = index
        
        updateUI()
    }
    
    //MARK: - UI
    
    private func updateUI() {
        
        let currentTab = tabBarContainerView.viewWithTag(currentIndex) as! UIButton
        currentTab.backgroundColor = #colorLiteral(red: 0, green: 0.6823529412, blue: 0.8705882353, alpha: 1)
        currentTab.imageView?.alpha = 1
        
        tabBarContainerView.subviews.forEach { tab in
            if tab.tag != currentIndex {
                let tabButton = tab as? UIButton
                tabButton?.backgroundColor = #colorLiteral(red: 0.1395442486, green: 0.1621768475, blue: 0.1871702671, alpha: 1)
                tabButton?.imageView?.alpha = 0.5
                tabButton?.isSelected = false
            }
        }
    }
    
    private func setupUI() {
        
       tabBarContainerView.frame = CGRect(x: 20,
                                        y: self.view.frame.size.height - 70,
                                        width: self.view.frame.size.width - 35,
                                        height: 50)
        
        tabBarContainerView.layer.cornerRadius = tabBarContainerView.frame.width / 15
        tabBarContainerView.clipsToBounds = true
        
        self.view.addSubview(tabBarContainerView)
        
    }
    
}
