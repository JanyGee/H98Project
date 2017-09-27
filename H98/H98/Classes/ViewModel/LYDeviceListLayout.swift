//
//  LYDeviceListLayout.swift
//  H98
//
//  Created by Jany on 17/9/27.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class LYDeviceListLayout: UICollectionViewFlowLayout {

    var itemW: CGFloat = 70
    var itemH: CGFloat = 80
    
    override init() {
        super.init()
        
        //设置每一个元素的大小
        self.itemSize = CGSize(width: itemW, height: itemH)
        //设置滚动方向
        self.scrollDirection = .horizontal
        //设置间距
        self.minimumLineSpacing = 5
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
    
}
