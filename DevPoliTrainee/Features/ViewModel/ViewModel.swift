//
//  FirstViewModel.swift
//  DevPoliTrainee-UITableView
//
//  Created by mateusdias on 19/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func setData(data: [String])
}

class ViewModel {
    let data = DatasCells().data
    
    weak var delegate: ViewModelDelegate?
    
    func onLoadDatas() {
        delegate?.setData(data: data)
    }
}
