//
//  OkViewDelegate.swift
//  OkDataSourcesExample
//
//  Created by Roberto Frontado on 4/20/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import UIKit

public class OkViewDelegate<ItemType>: NSObject {
    
    internal let onItemClicked: (item: ItemType, position: Int) -> Void
    internal var onRefreshed: (refreshControl: UIRefreshControl) -> Void = { _ in return }
    internal var onPagination: (item: ItemType) -> Void = { _ in return }
    public var triggerTreshold: Int = 1
    
    init(onItemClicked: (item: ItemType, position: Int) -> Void) {
        self.onItemClicked = onItemClicked
    }
    
    // MARK: Private methods
    internal func refreshControlValueChanged(refreshControl: UIRefreshControl) {
        onRefreshed(refreshControl: refreshControl)
    }
    
    // MARK: - Public methods
    // MARK: Pagination
    public func setOnPagination(onPagination: (item: ItemType) -> Void) {
        setOnPagination(nil, onPagination: onPagination)
    }
    
    public func setOnPagination(triggerTreshold: Int?, onPagination: (item: ItemType) -> Void) {
        if let triggerTreshold = triggerTreshold {
            self.triggerTreshold = triggerTreshold
        }
        self.onPagination = onPagination
    }
    
    // MARK: Pull to refresh
    internal func configureRefreshControl(inout refreshControl: UIRefreshControl?, onRefreshed: (refreshControl: UIRefreshControl) -> Void) {
        self.onRefreshed = onRefreshed
        if refreshControl == nil {
            refreshControl = UIRefreshControl()
            refreshControl!.tintColor = UIColor.grayColor()
        }
        refreshControl!.addTarget(self, action: "refreshControlValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
}