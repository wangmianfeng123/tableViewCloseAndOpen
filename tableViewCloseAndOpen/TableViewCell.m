//
//  TableViewCell.m
//  tableViewCloseAndOpen
//
//  Created by 王绵峰 on 2018/4/24.
//  Copyright © 2018年 王绵峰. All rights reserved.
//

#import "TableViewCell.h"



@interface TableViewCell ()
@property (nonatomic,strong) NSMutableArray * btnArr;
@end


@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



- (void)setSelectedIndexPath:(NSIndexPath *)selectedIndexPath{
    _selectedIndexPath = selectedIndexPath;
}

- (IBAction)btnAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(btnArr:index:)]) {
        [self.delegate btnArr:self.btnArr index:_selectedIndexPath];
    }
}

- (NSMutableArray *)btnArr{
    if (!_btnArr) {
        _btnArr = [NSMutableArray array];
    }
    return _btnArr;
}


- (void)setArr:(NSArray *)arr indexPath:(NSIndexPath *)indexPath{
    _arr = arr;
    self.btn.selected = NO;
    for (int i = 0; i < _arr.count; i++) {
        self.btn.tag = indexPath.row;
        [self.btn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [self.btn setBackgroundImage:[UIImage imageNamed:@"三角向上"] forState:UIControlStateSelected];
        [self.btnArr addObject:self.btn];
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    // Configure the view for the selected state
}

@end
