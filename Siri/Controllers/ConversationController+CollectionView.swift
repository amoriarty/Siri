//
//  ConversationController+CollectionView.swift
//  Siri
//
//  Created by Alexandra Legent on 30/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

extension ConversationController {
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MessageCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MessageCell
        let message = messages[indexPath.item]
        let estimatedFrame = getEstimatedFrame(for: NSString(string: message.text))
        
        cell.message = message
        cell.bubbleWidthConstraint?.constant = estimatedFrame.width + 30
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let message = NSString(string: messages[indexPath.item].text)
        let estimatedFrame = getEstimatedFrame(for: message)
        
        return CGSize(width: collectionView.frame.width, height: estimatedFrame.height + 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    private func getEstimatedFrame(for message: NSString) -> CGRect {
        let size = CGSize(width: collectionView.frame.width - 40, height: 1000)
        let attributes: [NSAttributedStringKey: Any] = [.font: UIFont.systemFont(ofSize: 18)]
        let estimatedFrame = message.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return estimatedFrame
    }
}
