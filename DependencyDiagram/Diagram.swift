//
//  Diagram.swift
//  DependencyDiagram
//
//  Created by mac on 15/08/21.
//

import Foundation
import UIKit

//typealias feedLoader = (([String]) -> Void) -> Void

/*
 Replacing closures with protocol (Both can be used it's up to you.)
 */

protocol FeedLoader {
    func loadFeed(compltion: @escaping ([String]) -> Void)
}

class FeedViewController: UIViewController {
    var loader: FeedLoader?
    
    convenience init(loader: FeedLoader) {
        self.init()
        self.loader = loader
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader?.loadFeed { loadedItems in
            // Feeds
        }
    }
}

/*
  NOw someone who implements feedloader.
 */
// Data loaded form server
class RemoteFeedLoader: FeedLoader {
    func loadFeed(compltion: @escaping ([String]) -> Void) {
        // do something
    }
}

// Data loaded form Local
class LocalFeedLoader: FeedLoader {
    func loadFeed(compltion: @escaping ([String]) -> Void) {
        // do something
    }
}

class RemoteWithLocalFallbackFeedLoader : FeedLoader {
    var remoteLoader: RemoteFeedLoader!
    var localloader: LocalFeedLoader!
    
    func loadFeed(compltion: @escaping ([String]) -> Void) {
        /*
        if Reachibilty.isReachable {
            remoteLoader.loadFeed(compltion: compltion)
        } else {
            localloader.loadFeed(compltion: compltion)
        }*/
        
        let load = Reachibilty.isReachable ? remoteLoader.loadFeed : localloader.loadFeed
        load(compltion)
    }
 
}
