//
//  ViewController.swift
//  pageController using collectionView
//
//  Created by Mohammed Abdullah on 19/07/23.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "one", for: indexPath) as! firstCollectionViewCell
        cell.imageView.image = UIImage(named: names[indexPath.row])
        cell.layer.cornerRadius = 50
        cell.imageView.layer.cornerRadius = 50
        return cell
    }
    
    @IBOutlet weak var page: UIPageControl!

    @IBOutlet weak var collection: UICollectionView!
    var currentPage = 0
    var timer:Timer?
    var names = ["pdf","mp3","mp4","bat","ram"]
    override func viewDidLoad() {
        super.viewDidLoad()
        page.currentPage = 0
        page.numberOfPages = names.count
//        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(scrollToNextPage), userInfo: nil, repeats: true)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath){
        page.currentPage = indexPath.row
        
    }

    @IBAction func pageControl(_ sender: UIPageControl) {
            let currentPage = sender.currentPage
            let indexPath = IndexPath(item: currentPage, section: 0)
            collection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    @objc func scrollToNextPage() {
        let nextPage = (page.currentPage + 1) % names.count
        let indexPath = IndexPath(item: nextPage, section: 0)
        collection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    // Implement viewWillDisappear(_:) method to stop the timer when the view is about to disappear:
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        timer?.invalidate()
//        timer = nil
//    }

}

