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

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_arr;
    NSMutableDictionary *_dict;
}
@property (nonatomic,strong)UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dict = [NSMutableDictionary dictionary];
   
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
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}



- (void)tapAction:(UITapGestureRecognizer *)gesture{
    NSInteger key = gesture.view.tag;
    NSString * keyStr = [NSString stringWithFormat:@"%ld",(long)key];
    NSString * value = [_dict objectForKey:keyStr];
    if ([value isEqualToString:@"0"]) {
        NSLog(@"打开");
        [_dict setValue:@"1" forKey:keyStr];
    }else{
        NSLog(@"关闭");
        [_dict setValue:@"0" forKey:keyStr];
    }
    NSIndexSet * set = [[NSIndexSet alloc] initWithIndex:gesture.view.tag];
    [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationAutomatic];
    NSLog(@"点击header");
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
        UIView * view = [headerView headerView];
        view.tag = section;
           UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [view addGestureRecognizer:gesture];
        return view;
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



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
             cell.textLable.text = _arr[indexPath.row];
    return cell;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
