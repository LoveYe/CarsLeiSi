//
//  XSCarScrollView.m
//  ZuChe
//
//  Created by apple  on 2017/5/18.
//  Copyright © 2017年 佐途. All rights reserved.
//

#import "XSCarScrollView.h"
#import "UIImageView+WebCache.h"

#import <math.h>

//#define SPACE 5
//#define WIDTH ([UIScreen mainScreen].bounds.size.width - 80)

#define width1 ([UIScreen mainScreen].bounds.size.width)
#define WIDTH (width1 - width1*0.25)
#define SPACE (width1 * 0.02)

@implementation XSCarScrollView{
    
    UIScrollView *_scrollView;
    NSMutableArray *_arr;
    
    NSInteger _count;
    
    
    CGRect *qqq;
 
    NSString *type;

    float _huadong;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (id)initWithFrame:(CGRect)frame imageArr:(NSArray *)imageArr {
    
    if (self = [super initWithFrame:frame]) {
        
        _huadong = 0.0;
        _arr = [NSMutableArray arrayWithArray:imageArr];
        
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled = YES;
        
        [self createScrollView:frame];
    }
    return self;
}

- (void)createScrollView:(CGRect)frame{
    
    qqq = &frame;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(40, 0, WIDTH, frame.size.height)];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    _scrollView.clipsToBounds = NO;
    _scrollView.bounces = NO;
    
    for (int i = 0 ; i< _arr.count; i++) {
        
        UIImageView *label = [[UIImageView alloc] initWithFrame:CGRectMake((i * WIDTH)+SPACE, 0, WIDTH*1.04 - SPACE * 2, frame.size.height)];
//        label.image = [UIImage imageNamed:@"六背景.png"];
        [label sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://wx.leisurecarlife.com%@",_arr[i][@"cartu"]]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
        }];
        [_scrollView addSubview:label];
    }
    _scrollView.contentSize = CGSizeMake(WIDTH * _arr.count , frame.size.height);
    [_scrollView setContentOffset:CGPointMake(0, 0)];
    
    
    [self addSubview:_scrollView];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    UIView *view  = [super hitTest:point withEvent:event];
    
    if ([view isEqual:self]) {
        
        for (UIView *subview in _scrollView.subviews) {
            
            CGPoint offset = CGPointMake(point.x - _scrollView.frame.origin.x + _scrollView.contentOffset.x - subview.frame.origin.x,
                                         point.y - _scrollView.frame.origin.y + _scrollView.contentOffset.y - subview.frame.origin.y);
            
            if ((view = [subview hitTest:offset withEvent:event])){
                
                return view;
            }
        }
        return [_scrollView hitTest:point withEvent:event];
    }
    return view;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}
- (void)handleTapGR:(NSInteger)tap  {

}
- (void)carDetailInfo:(UIButton *)sender{
    
    
}



@end
