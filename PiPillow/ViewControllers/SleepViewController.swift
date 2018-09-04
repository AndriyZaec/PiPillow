//
//  SleepViewController.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 15.05.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import UIKit

class SleepViewController: UIViewController {
    
    //MARK: - Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let collectionViewCellsIds = ["AlarmViewCollectionViewCell",
                               "EasyWakeCollectionViewCell",
                               "StarSoundCollectionViewCell",
                               "SonataCollectionViewCell"]
    
    var step = 0
    var alarm: Date?
    var sonataTime: Int?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Privates
    
    private func nextStepPrepare() {
        
        guard step < collectionViewCellsIds.count - 1 else {
            return
        }
        
        collectionView.scrollToItem(at: IndexPath(item: step + 1, section: 0),
                                    at: UICollectionViewScrollPosition.centeredHorizontally,
                                    animated: true)
        
        step += 1
        
        pageControl.currentPage = step
        
        collectionView.reloadData()
    }
    
    //MARK: - Navigation
    
    //MARK: - UI
    
    private func setupUI() {
        
        for cell in collectionViewCellsIds {
            collectionView.register(UINib(nibName: cell, bundle: nil), forCellWithReuseIdentifier: cell)
        }
        
        collectionView.backgroundColor = .clear
    }
    
}

extension SleepViewController: UICollectionViewDelegate {
    
}

extension SleepViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewCellsIds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellsIds[indexPath.row], for: indexPath) as? BaseSleepCollectionViewCell
        cell?.delegate = self
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let customCell = cell as? EasyWakeCollectionViewCell
            customCell?.configureCell(withalarmTime: alarm ?? Date())
        }
    }
    
}
extension SleepViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidth : CGFloat = 150.0
        
        let numberOfCells = floor(self.view.frame.size.width / cellWidth)
        let edgeInsets = (self.view.frame.size.width - (numberOfCells * cellWidth)) / (numberOfCells + 1)
        
        return UIEdgeInsetsMake(5, edgeInsets, 5, edgeInsets)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width - 50, height: collectionView.frame.size.height - 5)
    }
}

extension SleepViewController: SleepCollectionViewCellDelegate {
    
    func setEasyWakeRange(startAlarmTime: Date, endAlarmTime: Date) {
        print(startAlarmTime.toString(dateFormat: "HH:mm"))
        print(endAlarmTime.toString(dateFormat: "HH:mm"))
    }
    
    
    func nextDidTapped() {
        nextStepPrepare()
    }
    
    func skipDidTapped() {
        nextStepPrepare()
    }
    
    func setUpAlalrm(withDate date: Date) {
        alarm = date
    }
    
    func setUpStarSound(with name: String?) {
        if let name = name {
            let controller = UIStoryboard.controllerFromMainStorybourd(cls: StarSoundViewController.self)!
            controller.starsound = name
            self.present(controller, animated: true) { self.tabBarController?.selectedIndex = 0 }
        } else {
            nextStepPrepare()
        }
    }
    
    func setUpSonataTime(time: Int?) {
        sonataTime = time
        let controller = UIStoryboard.controllerFromMainStorybourd(cls: GoodNightViewController.self)!
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
