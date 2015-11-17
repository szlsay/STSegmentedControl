//
//  ViewController.m
//  STSegmentControlDemo
//
//  Created by shentian on 15/11/17.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "ViewController.h"

#import "STSegmentControl.h"

@interface ViewController ()<STSegmentControlDelegate>

@property (nonatomic, strong, nonnull)STSegmentControl *segmentControl; // 1.分节控制器
@property (nonatomic, strong, nullable)UILabel *label; //

@end

@implementation ViewController

#pragma mark - lift cycle 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.segmentControl];
    
    [self.view addSubview:self.label];
}

#pragma mark - Delegate 视图委托
- (void)segmentSelectionChange:(NSInteger)selection
{
    NSLog(@"%s, %ld", __FUNCTION__, (long)selection);
    self.label.text = [NSString stringWithFormat:@"%ld",(long)selection];
}

#pragma mark - event response 事件相应

#pragma mark - private methods 私有方法

#pragma mark - getters and setters 属性
- (STSegmentControl *)segmentControl
{
    if (_segmentControl == nil) {
        _segmentControl = [STSegmentControl segmentedControlWithFrame:CGRectMake(0, 100, 400, 50)
                                                      backgroundColor:[UIColor lightGrayColor]
                                                           titleArray:[@[@"1", @"2", @"3", @"4", @"5"] mutableCopy]
                                                            titleFont:20
                                                           titleColor:[UIColor greenColor]
                                                          selectColor:[UIColor yellowColor]
                                                            lineColor:[UIColor redColor]];
        _segmentControl.delegate = self;
    }
    return _segmentControl;
}

- (UILabel *)label
{
    if (_label == nil) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 100, 50)];
        [_label setText:@"0"];
        [_label setTextColor:[UIColor blueColor]];
        [_label setFont:[UIFont systemFontOfSize:25]];
    }
    return _label;
}
@end
