//
//  CollectionViewCell.swift
//  OkDataSourcesExample
//
//  Created by Roberto Frontado on 4/8/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, OkViewCell {
  
    @IBOutlet weak var valueLabel: UILabel!
    
    func configureItem(_ item: Item) {
        valueLabel.text = item.value
    }
}
