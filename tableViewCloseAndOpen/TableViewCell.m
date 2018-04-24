//
//  TableViewCell.m
//  tableViewCloseAndOpen
//
//  Created by 王绵峰 on 2018/4/24.
//  Copyright © 2018年 王绵峰. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    // Configure the view for the selected state
}

@end
