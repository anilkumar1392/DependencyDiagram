//
//  EasyChange.swift
//  DependencyDiagram
//
//  Created by mac on 15/08/21.
//

import Foundation
import UIKit

/*
 Fetch data from server is network is their else ftech from local.
 
 Easy way of doing this is confirm to concerte types.
 */

class FeedsViewContoller: UIViewController {
    
    //var feedLoader: FeedLoader!
    var remoteLoader: RemoteFeedLoader!
    var localLoader: LocalFeedLoader!

    convenience init(remoteLoader: RemoteFeedLoader, localLoader: LocalFeedLoader) {
        self.init()
        self.remoteLoader = remoteLoader
        self.localLoader = localLoader
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Reachibilty.isReachable {
            remoteLoader.loadFeed { loadedFeeds in
                // Update UI
            }
        } else {
            localLoader.loadFeed { loadedFeeds in
                // Update UI
            }
        }

    }
}

/*
 Problem:
 Code became complex rather then simple.
 We care usign concrete dependency.
 Code is getting more immobile.
 For more requirement more if else.
 Code not open for extension (we can not change behaviour with out changing the code.)
 
 
 Solution:
 Use Composition
 */
