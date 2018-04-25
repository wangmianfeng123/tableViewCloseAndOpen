//
//  headerView.m
//  tableViewCloseAndOpen
//
//  Created by 王绵峰 on 2018/4/24.
//  Copyright © 2018年 王绵峰. All rights reserved.
//

#import "headerView.h"



@interface headerView ()

@property (nonatomic,strong) UIButton * iconBtn;

@property (nonatomic,strong) UIView * headerV;

@end



@implementation headerView



- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self headerView];
    }
    return self;
}




- (void)setDict:(NSMutableDictionary *)dict{
    _dict = dict;
    [self loadSelected];
    NSLog(@"()()()()()()()()%@",_dict);
   
}


- (void)loadSelected{
    NSString * string = [NSString stringWithFormat:@"%ld",_section];
    if ([[_dict valueForKey:string] isEqualToString:@"0"]) {
        [self btnSetBackdown];
    }else{
        [self btnsetBackUp];
    }
}

- (void)layoutIfNeeded{
    [super layoutIfNeeded];
    
}

- (void)setSection:(NSInteger)section{
    _section = section;
}



-(void)headerView{
    _headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
    _headerV.backgroundColor = [UIColor whiteColor];
    _headerV.userInteractionEnabled = YES;
    UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [_headerV addGestureRecognizer:gesture];
        _iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _iconBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-40, 0, 15, 15);
    [self btnsetBackUp];
    [self btnSetBackdown];
    [_iconBtn addTarget:self action:@selector(iconBtnAction:) forControlEvents:UIControlEventTouchUpInside];
         [_headerV addSubview:_iconBtn];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 100, 60)];
    label.text = @"用户信息";
    [_headerV addSubview:label];
    [self.contentView addSubview:_headerV];
}



- (void)btnSetBackdown{
     [_iconBtn setBackgroundImage:[UIImage imageNamed:@"三角向下"] forState:UIControlStateNormal];
}


- (void)btnsetBackUp{
     [_iconBtn setBackgroundImage:[UIImage imageNamed:@"三角向上"] forState:UIControlStateNormal];
}


- (void)response{
    if ([self.delegate respondsToSelector:@selector(headerViewIndex:btn:)]) {
        [self.delegate headerViewIndex:_section btn:_iconBtn];
    }
}

- (void)iconBtnAction:(UIButton *)btn{
    [self response];
    [self loadSelected];
}


- (void)tapAction:(UITapGestureRecognizer *)geture{
    [self response];
}



@end
