//
//  SleepCollectionViewCellDelegate.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 21.05.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import Foundation
import UIKit

protocol SleepCollectionViewCellDelegate: class  {
    
    func nextDidTapped()
    func skipDidTapped()
    
    func setUpAlalrm(withDate date: Date)
    
    func setEasyWakeRange(startAlarmTime: Date, endAlarmTime: Date)
    
    func setUpStarSound(with name: String?)
    
    func setUpSonataTime(time: Int?)
}
