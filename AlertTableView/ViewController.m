//
//  ViewController.m
//  AlertTableView
//
//  Created by 周荣水 on 16/8/2.
//  Copyright © 2016年 周荣水. All rights reserved.
//

#import "ViewController.h"
#import "AlertTableView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
- (IBAction)clickAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickAction:(id)sender {
    AlertTableView *modelView = [[AlertTableView alloc] init];
    modelView.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    modelView.modalTransitionStyle =  UIModalTransitionStyleCrossDissolve;

    modelView.AlertFromDirect = fromDirectBottom;
    modelView.rowHight = 60;
    modelView.AlertArray = @[@"哈哈",@"看看",@"哦哦",@"奥奥",@"1",@"2"];
    modelView.titleAndIndex = ^(NSString *titleStr,NSInteger index){
        NSLog(@"%ld",(long)index);
        self.titleLabel.text = titleStr;
    };
    [self presentViewController:modelView animated:YES completion:nil];
}
@end
