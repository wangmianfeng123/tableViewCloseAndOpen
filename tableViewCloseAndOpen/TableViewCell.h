//
//  TableViewCell.h
//  tableViewCloseAndOpen
//
//  Created by 王绵峰 on 2018/4/24.
//  Copyright © 2018年 王绵峰. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol btnDelegate <NSObject>

- (void)btnArr:(NSArray*)btnArr index:(NSIndexPath *)index;

@end

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UILabel *textLable;

@property (weak,nonatomic)id<btnDelegate>delegate;

@property (nonatomic,strong) NSArray * arr;

@property (assign, nonatomic) NSIndexPath *selectedIndexPath;

- (void)setArr:(NSArray *)arr indexPath:(NSIndexPath *)indexPath;


@end
