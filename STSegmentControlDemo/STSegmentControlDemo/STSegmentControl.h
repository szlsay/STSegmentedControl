//
//  STSegmentControl.h
//  STSegmentControlDemo
//
//  Created by shentian on 15/11/17.
//  Copyright © 2015年 ST. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol STSegmentControlDelegate <NSObject>

-(void)segmentSelectionChange:(NSInteger)selection;

@end

@interface STSegmentControl : UIView

@property (nonatomic, strong, nullable)NSMutableArray  *titleArray; // 1.标题数组
@property (nonatomic, assign)CGFloat titleFont; //
@property (nonatomic, strong, nullable)UIColor         *titleColor; // 3.标题颜色
@property (nonatomic, strong, nullable)UIColor         *selectColor;// 4.选中时标题的颜色
@property (nonatomic, strong, nullable)UIColor         *lineColor;  // 5.下边线的颜色

@property (nonatomic, weak, nullable) id <STSegmentControlDelegate> delegate; //

/**
 *  创建一个分节控件
 *
 *  @param frame           控件的框架
 *  @param backgroundColor 背景色
 *  @param titleArray      字体数组
 *  @param titltFont       字体尺寸
 *  @param titleColor      字体颜色
 *  @param selectColor     选中字体的颜色
 *  @param lineColor       下边线的颜色
 *
 *  @return 分节控件
 */
+ (STSegmentControl * _Nonnull)segmentedControlWithFrame:(CGRect)frame
                                backgroundColor:(UIColor *_Nullable)backgroundColor
                                     titleArray:(NSMutableArray *_Nullable)titleArray
                                      titleFont:(CGFloat)titleFont
                                     titleColor:(UIColor *_Nullable)titleColor
                                    selectColor:(UIColor *_Nullable)selectColor
                                      lineColor:(UIColor *_Nullable)lineColor;

@end