//
//  headerView.m
//  tableViewCloseAndOpen
//
//  Created by 王绵峰 on 2018/4/24.
//  Copyright © 2018年 王绵峰. All rights reserved.
//

#import "headerView.h"

@implementation headerView


+(UIView *)headerView{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 370, 60)];
    view.backgroundColor = [UIColor whiteColor];
    view.userInteractionEnabled = YES;
//    UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
//    [view addGestureRecognizer:gesture];
//    view.tag = section;
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 100, 60)];
    label.text = @"用户信息";
    [view addSubview:label];
    return view;
}



@end
