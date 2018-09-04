//
//  StatisticViewController.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 30.06.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import UIKit

class StatisticViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var statisticCollectionView: UICollectionView!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Privates
    
    //MARK: - Navigation
    
    //MARK: - UI
    
    private func setupUI() {
        statisticCollectionView.register(UINib(nibName: "NightStatisticCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NightStatisticCollectionViewCell")
    }

}

extension StatisticViewController: UICollectionViewDelegate {
    
}

extension StatisticViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

extension StatisticViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NightStatisticCollectionViewCell", for: indexPath) as! NightStatisticCollectionViewCell
        return cell
    }
    
    
}
