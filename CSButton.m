//
//  CSButton.m
//  JT
//
//  Created by 朱来飞 on 2018/2/26.
//  Copyright © 2018年 zhulaifei. All rights reserved.
//

#import "CSButton.h"
@implementation CSButton


- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat btnW = self.frame.size.width ;
    CGFloat btnH = self.frame.size.height ;
    
    CGRect imageRect = self.imageView.frame;
    CGRect titleRect = self.titleLabel.frame;

    CGFloat th = self.titleLabel.intrinsicContentSize.height ;
    CGFloat tw = self.titleLabel.intrinsicContentSize.width ;
    
    CGFloat min = MIN(btnH, btnW);
    //图片与文字间距
    CGFloat gap = 2.f ;
    
    if (_imgPt == P_Top) {
        
        imageRect.size = CGSizeMake(min/2, min/2);
        imageRect.origin.x = btnW/2 - min/4;
        imageRect.origin.y = (btnH - min/2 - gap - th) / 2 ;
        
        titleRect.size = CGSizeMake(btnW - 10, th);
        titleRect.origin.x = 5;
        titleRect.origin.y = (btnH - min/2 - gap - th) / 2 + min/2 + gap ;
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter ;
        
    }else if (_imgPt == P_Left){
        
        imageRect.size = CGSizeMake(min/2, min/2);
        imageRect.origin.x = (btnW - imageRect.size.width - gap - tw )/2;
        imageRect.origin.y =  btnH / 2 - min/4 ;

        titleRect.size = CGSizeMake(tw , th);
        titleRect.origin.x =  imageRect.origin.x + imageRect.size.width  + gap;
        titleRect.origin.y = btnH /2 - th/2 ;
        self.titleLabel.textAlignment = NSTextAlignmentLeft ;
        
    }else if (_imgPt == P_Bottom){
        
        imageRect.size = CGSizeMake(min/2, min/2);
        imageRect.origin.x = btnW/2 - min/4;
        imageRect.origin.y = btnH - (btnH - min/2 - gap - th) / 2 - min / 2 ;
        
        titleRect.size = CGSizeMake(btnW - 10, th);
        titleRect.origin.x = 5;
        titleRect.origin.y = (btnH - min/2 - gap - th) / 2 ;
        self.titleLabel.textAlignment = NSTextAlignmentCenter ;
        
    }else if (_imgPt == P_Right){
        
        titleRect.size = CGSizeMake(tw , th);
        titleRect.origin.x =  (btnW - min/2 - gap - tw )/2 ;
        titleRect.origin.y = btnH /2 - th/2 ;
        
        imageRect.size = CGSizeMake(min/2, min/2);
        imageRect.origin.x = titleRect.origin.x + tw + gap;
        imageRect.origin.y =  btnH / 2 - min/4 ;
        
        self.titleLabel.textAlignment = NSTextAlignmentRight ;
    }    
    self.imageView.frame = imageRect;
    self.titleLabel.frame = titleRect;
    
}
- (void)setImgPt:(ImagePosition)imgPt{
    _imgPt = imgPt ;
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
}

@end
