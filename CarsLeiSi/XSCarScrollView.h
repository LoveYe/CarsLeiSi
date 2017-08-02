//
//  XSCarScrollView.h
//  ZuChe
//
//  Created by apple  on 2017/5/18.
//  Copyright © 2017年 佐途. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol View1Delegate <NSObject>

- (void)sendstr:(NSString *)str;

@end

@interface XSCarScrollView : UIView <UIScrollViewDelegate>

- (id)initWithFrame:(CGRect)frame imageArr:(NSArray *)imageArr;

@property (nonatomic , weak)id <View1Delegate>aDelegate;

@end
