//
//  LYCustomLayout.swift
//  H98
//
//  Created by Jany on 17/9/23.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYCustomLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        scrollDirection = .horizontal
        minimumLineSpacing = 30
        itemSize = CGSize(width: 30, height: 30)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        
        guard let arrary = super.layoutAttributesForElements(in: rect) else {
            return[]
        }
        
        for attributes:UICollectionViewLayoutAttributes in arrary {
            
            if attributes.frame.intersects(rect) {
                attributes.alpha = 0.5
                
                let distance = (collectionView?.contentOffset.x)! - attributes.center.x;
                let normalizedDistance = distance / 80
                
                if abs(distance) < 80 {
                    let zoom = 1 + 0.6 * (1 - abs(normalizedDistance))
                    attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0)
                    attributes.zIndex = 1
                    attributes.alpha = 1.0
                }
            }
        }
        
        return arrary
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
    
        var offsetAdjust = MAXFLOAT
        
        let centerX = proposedContentOffset.x + ((collectionView?.bounds.width)! / 2.0)
        
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: (collectionView?.bounds.size.width)!, height: (collectionView?.bounds.size.height)!)
        
        let array = super.layoutAttributesForElements(in: targetRect)
        
        
        for layoutAttr:UICollectionViewLayoutAttributes in array! {
            
            let itemCenterX = layoutAttr.center.x
            
            if Float(abs(itemCenterX - centerX)) < abs(offsetAdjust) {
                offsetAdjust = Float(itemCenterX - centerX)
            }
        }
        
        return CGPoint(x: CGFloat(Float(proposedContentOffset.x) + offsetAdjust), y: proposedContentOffset.y)
    }
}
