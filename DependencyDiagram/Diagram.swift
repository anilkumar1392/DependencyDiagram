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
