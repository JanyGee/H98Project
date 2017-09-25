//
//  LYCustomLayout.swift
//  H98
//
//  Created by Jany on 17/9/23.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYCustomLayout: UICollectionViewFlowLayout {

    var itemW: CGFloat = 200
    var itemH: CGFloat = 300
    
    lazy var inset: CGFloat = {
        //这样设置，inset就只会被计算一次，减少了prepareLayout的计算步骤
        return  (self.collectionView?.bounds.width ?? 0)  * 0.5 - self.itemSize.width * 0.5
    }()
    
    override init() {
        super.init()
        
        //设置每一个元素的大小
        self.itemSize = CGSize(width: itemW, height: itemH)
        //设置滚动方向
        self.scrollDirection = .horizontal
        //设置间距
        self.minimumLineSpacing = 0.4 * itemW
    }
    
    //苹果推荐，对一些布局的准备操作放在这里
    override func prepare() {
        //设置边距(让第一张图片与最后一张图片出现在最中央)
        self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     返回true只要显示的边界发生改变就重新布局:(默认是false)
     内部会重新调用prepareLayout和调用
     layoutAttributesForElementsInRect方法获得部分cell的布局属性
     */
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    /**
     用来计算出rect这个范围内所有cell的UICollectionViewLayoutAttributes，
     并返回。
     */
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let arrary = super.layoutAttributesForElements(in: rect) else {
            return[]
        }
        
        for attributes:UICollectionViewLayoutAttributes in arrary {
            
            if attributes.frame.intersects(rect) {
                attributes.alpha = 0.5
                
                let distance = (collectionView?.contentOffset.x)! - attributes.center.x + itemW;
                let normalizedDistance = distance / itemW
                
                if abs(distance) < itemW {
                    let zoom = 1 + 0.6 * (1 - abs(normalizedDistance))
                    attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0)
                    attributes.zIndex = 1
                    attributes.alpha = 1.0
                }
            }
        }
        
        return arrary
    }
    
    /**
     用来设置collectionView停止滚动那一刻的位置
     
     - parameter proposedContentOffset: 原本collectionView停止滚动那一刻的位置
     - parameter velocity:              滚动速度
     
     - returns: 最终停留的位置
     */
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
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
