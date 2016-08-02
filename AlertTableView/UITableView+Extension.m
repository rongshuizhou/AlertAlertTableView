//
//  UITableView+Extension.m
//  AlertTableView
//
//  Created by 周荣水 on 16/8/2.
//  Copyright © 2016年 周荣水. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)
- (void)eraseBottomSeparateLines{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 1)];
    view.backgroundColor = [UIColor clearColor];
    self.tableFooterView = view;
}
@end
