//
//  AlertTableView.h
//  AlertTableView
//
//  Created by 周荣水 on 16/8/2.
//  Copyright © 2016年 周荣水. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TitleNameAndIndex)(NSString *titleName,NSInteger index);

typedef NS_ENUM(NSInteger, ViewState){
    viewStateNormal, // 默认 透明
    viewStateGray,   // 半透明灰色
    viewStateWhite,  // 半透明白色
};

typedef NS_ENUM(NSInteger, IS_cornerRadius){
    IS_cornerRadiusSide,   // 默认 提示框圆角
    IS_UncornetRaidusSide, // 提示框非圆角
};

typedef NS_ENUM(NSInteger, FromDirect){
    fromDirectCenter,      // 默认显示在中间的选择框
    fromDirectBottom,      // tabbar上方出现的选择框
    fromDirectTop,         // 从导航栏之下出现的选择框
};

@interface AlertTableView : UIViewController

#pragma mark 自定义样式
@property (nonatomic, assign) ViewState viewState;                /**< 选择框显示样式 灰色 白色 默认透明 */
@property (nonatomic, assign) IS_cornerRadius AlertcornerRaidus;  /**< 边角样式*/
@property (nonatomic, assign) FromDirect AlertFromDirect;         /**< 选择框所在位置 中心 顶部 底部    */

#pragma mark 提示框定制
@property (nonatomic, strong) NSArray *AlertArray;                /**< 传入提醒框标题数组              */
@property (nonatomic, assign) CGFloat rowHight;                   /**< 行 高度  默认为44              */
@property (nonatomic, strong) UIColor *viewColor;                 /**< 提示框颜色  默认白色            */

#pragma mark 选择 FromDirect = fromDirectCenter时候建议设置
@property (nonatomic, strong) NSString *titleString;              /**< 标题的内容                     */



/**
 *  Block 返回选择第几个标题
 */
@property (nonatomic, copy) TitleNameAndIndex titleAndIndex;


@end
