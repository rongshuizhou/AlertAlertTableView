//
//  AlertTableView.m
//  AlertTableView
//
//  Created by 周荣水 on 16/8/2.
//  Copyright © 2016年 周荣水. All rights reserved.
//

#import "AlertTableView.h"
#import "AlertTableViewCell.h"
#import "Masonry.h"
#import "UITableView+Extension.h"

#define WEAK(weakSelf)  __weak __typeof(&*self)weakSelf = self;
static NSString *const reuseAlertCell = @"AlertTableViewCell";

@interface AlertTableView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end
@implementation AlertTableView

-(void)viewDidLoad{
    [super viewDidLoad];
    [self setBackGroundColor];
    [self configLayout];
}


#pragma mark BackGroundColor
- (void)setBackGroundColor
{
    self.view.backgroundColor = [UIColor clearColor];
    UIView *backGroundView = [[UIView alloc] initWithFrame:self.view.bounds];
    switch (self.viewState) {
        case viewStateNormal:
            backGroundView.backgroundColor = [UIColor clearColor];
            break;
            
        case viewStateGray:
            backGroundView.backgroundColor = [UIColor blackColor];
            backGroundView.alpha = 0.5;
            break;
            
        case viewStateWhite:
            backGroundView.backgroundColor = [UIColor whiteColor];
            backGroundView.alpha = 0.5;
            break;
        default:
            break;
    }
    
    UITapGestureRecognizer *tapToDismiss = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissSelfView)];
    [backGroundView addGestureRecognizer:tapToDismiss];
    [self.view addSubview:backGroundView];
}

- (void)dismissSelfView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark AutoLayout
- (void)configLayout
{
    [self.view addSubview:self.tableView];
    
    switch (self.AlertcornerRaidus) {
        case IS_cornerRadiusSide:
            self.tableView.layer.cornerRadius = 7.5;
            self.tableView.layer.masksToBounds = YES;
            break;
        case IS_UncornetRaidusSide:
            
            break;
        default:
            self.tableView.layer.cornerRadius = 7.5;
            self.tableView.layer.masksToBounds = YES;
            break;
    }
    
    
    
    switch (self.AlertFromDirect) {
            
        case fromDirectCenter:
            [self alertFromCenterAType];
            break;
            
        case fromDirectBottom:
            [self alertFromBottomType];
            break;
            
        case fromDirectTop:
            [self alertFromTopType];
            self.tableView.scrollEnabled = NO;
            break;
            
        default:
            [self alertFromCenterAType];
            break;
    }
}



#pragma mark FromDirect
- (void)alertFromCenterAType
{
    WEAK(weakSelf);
    CGFloat height;
    if ([self.titleString isEqualToString:@""]) {
        height = self.rowHight * self.AlertArray.count;
    } else {
        height  = self.rowHight * self.AlertArray.count + 1.2 *self.rowHight;
    }
    
    if (height > [UIScreen mainScreen].bounds.size.height - 64- 49) {
        height = [UIScreen mainScreen].bounds.size.height - 64- 49;
    }
    [weakSelf.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(weakSelf.view);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(height);
    }];
}

- (void)alertFromBottomType
{
    WEAK(weakSelf);
    CGFloat height;
    if ([self.titleString isEqualToString:@""]) {
        height = self.rowHight * self.AlertArray.count;
    } else {
        height  = self.rowHight * self.AlertArray.count + 1.2 *self.rowHight;
    }
    
    if (height > [UIScreen mainScreen].bounds.size.height - 64- 49) {
        height = [UIScreen mainScreen].bounds.size.height - 64- 49;
    }
    [weakSelf.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(weakSelf.view);
        make.rightMargin.mas_equalTo(weakSelf.view);
        make.bottom.mas_equalTo(weakSelf.view);
        make.height.mas_equalTo(300);
        /**
         *  项目需求，所以限制住，可以直接使用height
         */
    }];
}

- (void)alertFromTopType
{
    WEAK(weakSelf);
    CGFloat height;
    if ([self.titleString isEqualToString:@""]) {
        height = self.rowHight * self.AlertArray.count;
    } else {
        height  = self.rowHight * self.AlertArray.count + 1.2 *self.rowHight;
    }
    
    if (height > [UIScreen mainScreen].bounds.size.height - 64- 49) {
        height = [UIScreen mainScreen].bounds.size.height - 64- 49;
    }
    [weakSelf.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(weakSelf.view);
        make.rightMargin.mas_equalTo(weakSelf.view);
        make.top.mas_equalTo(weakSelf.view).offset(64);
        make.height.mas_equalTo(height);
    }];
}



#pragma mark TableDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.AlertArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AlertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseAlertCell];
    cell.titleLabel.text = [self.AlertArray objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.rowHight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 1.2*self.rowHight)];
    titleLabel.backgroundColor = self.viewColor;
    titleLabel.text = self.titleString;
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    return titleLabel;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([self.titleString isEqualToString:@""]) {
        return 0;
    } else {
        return 1.2*self.rowHight;
    }
}



#pragma mark TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *titleStr =  self.AlertArray[indexPath.row];
    self.titleAndIndex(titleStr,indexPath.row);
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark SET/GET

-(UITableView *)tableView{
    if (_tableView == nil) {
        UITableView *tempTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tempTableView.backgroundColor = self.viewColor;
        tempTableView.delegate = self;
        tempTableView.dataSource = self;
        [tempTableView registerNib:[UINib nibWithNibName:reuseAlertCell bundle:nil] forCellReuseIdentifier:reuseAlertCell];
//        tempTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [tempTableView eraseBottomSeparateLines];
        _tableView = tempTableView;
    }
    return _tableView;
}

- (NSArray *)AlertArray
{
    if (_AlertArray == nil) {
        NSArray *tempArray = [NSArray array];
        _AlertArray = tempArray;
    }
    return _AlertArray;
}

- (CGFloat)rowHight
{
    if (!_rowHight) {
        CGFloat tempHeight = 60;
        _rowHight = tempHeight;
    }
    return _rowHight;
}

- (FromDirect)AlertFromDirect
{
    if (!_AlertFromDirect) {
        FromDirect tempFromDirect = fromDirectCenter;
        _AlertFromDirect = tempFromDirect;
    }
    return _AlertFromDirect;
}

- (ViewState)viewState
{
    if (!_viewState) {
        ViewState tempviewState = viewStateNormal;
        _viewState = tempviewState;
    }
    return _viewState;
}

- (UIColor *)viewColor
{
    if (_viewColor == nil) {
        UIColor *tempColor = [UIColor whiteColor];
        _viewColor = tempColor;
    }
    return _viewColor;
}

- (NSString *)titleString
{
    if (!_titleString) {
        NSString *tempString = @"";
        _titleString = tempString;
    }
    return _titleString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
