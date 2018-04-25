//
//  headerView.h
//  tableViewCloseAndOpen
//
//  Created by 王绵峰 on 2018/4/24.
//  Copyright © 2018年 王绵峰. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol headerViewDelegate <NSObject>

- (void)headerViewIndex:(NSInteger)index btn:(UIButton *)btn;

@end


@interface headerView : UITableViewHeaderFooterView

@property (nonatomic,assign)NSInteger section;

@property (nonatomic,strong)NSMutableDictionary * dict;

@property (nonatomic,weak)id<headerViewDelegate>delegate;

-(void)headerView;


@end
