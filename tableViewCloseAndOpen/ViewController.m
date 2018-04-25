//
//  ViewController.m
//  tableViewCloseAndOpen
//
//  Created by 王绵峰 on 2018/4/24.
//  Copyright © 2018年 王绵峰. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "headerView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,headerViewDelegate,btnDelegate>
{
    NSArray *_arr;
    NSMutableDictionary *_dict;
    NSMutableDictionary *_seleDict;
}
@property (nonatomic,strong)UITableView * tableView;

@property (assign, nonatomic) NSIndexPath *selectedIndexPath;//单选，当前选中的行

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dict = [NSMutableDictionary dictionary];
    _seleDict = [NSMutableDictionary dictionary];
    _arr = @[@"王绵峰",@"fengzi",@"疯子"];
    [self.view addSubview:self.tableView];
    
    for (int i = 0; i < 5; i++) {
        NSString * string = [NSString stringWithFormat:@"%d",i];
        [_dict setValue:@"0" forKey:string];
    }
    
}



- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        [_tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"cellId"];
        [_tableView registerClass:[headerView class] forHeaderFooterViewReuseIdentifier:@"headerId"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}



- (void)headerViewIndex:(NSInteger)index btn:(UIButton *)btn{
//    UIButton * bt = btn;
    [self headerSelectedIndex:index];
}



- (void)headerSelectedIndex:(NSInteger)index{
    NSString * keyStr = [NSString stringWithFormat:@"%ld",(long)index];
    NSString * value = [_dict objectForKey:keyStr];
    if ([value isEqualToString:@"0"]) {
        NSLog(@"打开");
        [_dict setValue:@"1" forKey:keyStr];
    }else{
        NSLog(@"关闭");
        [_dict setValue:@"0" forKey:keyStr];
    }
    NSIndexSet * set = [[NSIndexSet alloc] initWithIndex:index];
    [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationAutomatic];
    NSLog(@"点击header");
}




- (void)btnArr:(NSArray *)btnArr index:(NSInteger)index{
//        for (int j = 0; j < btnArr.count; j++) {
//            UIButton * bnt = btnArr[j];
//            if (bnt.tag == index) {
//                bnt.selected = YES;
//            }else{
//                bnt.selected = NO;
//            }
//        }
}




- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 0.01;
}



- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 0) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
        view.backgroundColor = [UIColor grayColor];
        return view;
    }
    return nil;
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    headerView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerId"];
//        UIView * view = [headerView headerView];
    headerView.delegate = self;
    headerView.section = section;
    [headerView setDict:_dict];
        return headerView;
    
}





- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 60;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString * string = [NSString stringWithFormat:@"%ld",(long)section];
    NSInteger currentIndex = [[_dict objectForKey:string] integerValue];
    if (currentIndex == 1) {
        return _arr.count;
    }else{
        return 0;
    }

    return 0;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        TableViewCell * cell = [tableView cellForRowAtIndexPath:_selectedIndexPath];
        [cell.btn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        cell.delegate = self;
        cell.selectedIndexPath = indexPath;
        //记录当前选中的位置索引
        _selectedIndexPath = indexPath;
        TableViewCell * selectedCell = [tableView cellForRowAtIndexPath:indexPath];
        selectedCell.delegate = self;
        [selectedCell.btn setBackgroundImage:[UIImage imageNamed:@"三角向上"] forState:UIControlStateNormal];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
        cell.textLable.text = _arr[indexPath.row];
    cell.delegate = self;
    [cell.btn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    if (_selectedIndexPath == indexPath) {
        [cell.btn setBackgroundImage:[UIImage imageNamed:@"三角向上"] forState:UIControlStateNormal];
    }
    return cell;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
