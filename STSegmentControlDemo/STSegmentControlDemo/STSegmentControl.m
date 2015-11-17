//
//  STSegmentControl.m
//  STSegmentControlDemo
//
//  Created by shentian on 15/11/17.
//  Copyright © 2015年 ST. All rights reserved.
//

#define TagSub 1000

#import "STSegmentControl.h"
@interface STSegmentControl()
@property (nonatomic, assign)CGFloat                    width;          // 1.每个小按钮的宽度
@property (nonatomic, assign)NSInteger                  currentSegment; // 2.当前的选中
@property (nonatomic, strong, nullable)NSMutableArray  *arraySub;       // 3.子视图集
@property (nonatomic, strong, nonnull)UIView           *lineView;       // 4.下边线
@end

@implementation STSegmentControl

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.currentSegment = 0;
        self.arraySub       = [NSMutableArray array];
    }
    return self;
}

+ (STSegmentControl *)segmentedControlWithFrame:(CGRect)frame
                                backgroundColor:(UIColor *)backgroundColor
                                     titleArray:(NSMutableArray *)titleArray
                                      titleFont:(CGFloat)titleFont
                                     titleColor:(UIColor *)titleColor
                                    selectColor:(UIColor *)selectColor
                                      lineColor:(UIColor *)lineColor
{
    STSegmentControl *segmentControl = [[STSegmentControl alloc]initWithFrame:frame];
    segmentControl.backgroundColor = backgroundColor;
    
    segmentControl.titleArray  = titleArray;
    segmentControl.titleFont   = titleFont;
    segmentControl.titleColor  = titleColor;
    segmentControl.selectColor = selectColor;
    segmentControl.lineColor   = lineColor;
    
    [segmentControl addSegmentArray:titleArray];
    
    return segmentControl;
}

- (void)addSegmentArray:(NSMutableArray *)segmentArray
{
    // 1.按钮的数量
    NSInteger segmentNumber = segmentArray.count;
    
    // 2.按钮的宽度
    self.width = self.bounds.size.width / segmentNumber;
    
    // 3.添加按钮
    for (int i = 0; i < segmentNumber; i++) {
        CGFloat btnW = self.width;
        CGFloat btnH = self.bounds.size.height;
        CGFloat btnX = i * self.width;
        CGFloat btnY = 0;
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
        [btn setTitle:segmentArray[i] forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:self.titleFont]];
        [btn setTitleColor:self.titleColor forState:UIControlStateNormal];
        [btn setTitleColor:self.selectColor forState:UIControlStateSelected];
        [btn setTag:TagSub+i];
        [self addSubview:btn];
        
        [btn addTarget:self
                action:@selector(changeAction:)
      forControlEvents:UIControlEventTouchUpInside];
        
        [self.arraySub addObject:btn];
        
        
        if (i == 0) {
            
            // 1.设置首个是默认选中的
            [btn setSelected:YES];
            
            // 2.添加下边线
            CGFloat lineW = self.width;
            CGFloat lineH = 2;
            CGFloat lineX = 0;
            CGFloat lineY = self.bounds.size.height - lineH;
            self.lineView = [[UIView alloc]initWithFrame:CGRectMake(lineX, lineY, lineW, lineH)];
            [self.lineView setBackgroundColor:self.lineColor];
            [self addSubview:self.lineView];
        }
    }
}


- (void)changeAction:(UIButton *)btn
{
    
    if (self.currentSegment != (btn.tag- TagSub)) {
        // 1.设置字体变大
        UIButton *preBtn = self.arraySub[self.currentSegment];
        [preBtn.titleLabel setFont:[UIFont systemFontOfSize:self.titleFont]];
        
        [btn.titleLabel setFont:[UIFont systemFontOfSize:self.titleFont + 5]];
        
        // 2.设置选中状态
        [self.arraySub[self.currentSegment] setSelected:NO];
        
        self.currentSegment = btn.tag - TagSub;
        [self.arraySub[self.currentSegment] setSelected:YES];
        
        // 3.设置下边线的移动
        CGRect frame = self.lineView.frame;
        frame.origin.x = self.currentSegment * self.width;
        
        [UIView animateWithDuration:0.4 animations:^{
            [self.lineView setFrame:frame];
            
        }];
        
        // 4.回调函数
        if ([self.delegate respondsToSelector:@selector(segmentSelectionChange:)]) {
            [self.delegate segmentSelectionChange:self.currentSegment];
        }
    }
}

@end
