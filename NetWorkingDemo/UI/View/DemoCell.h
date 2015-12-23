//
//  DemoCell.h
//  NetWorkingDemo
//
//  Created by Mac on 15/12/22.
//  Copyright © 2015年 lei.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoModel.h"
#import "Masonry.h"
static  NSString *demoIndentifier=@"demoCell";
@interface DemoCell : UITableViewCell
@property (nonatomic,strong) UIImageView * icon;
@property (nonatomic,strong) UILabel * lblTitle;
@property (nonatomic,strong) UILabel * lblContent;
@property (nonatomic,weak) UIImageView *line;  //下划线

//定义一个contentLabel文本高度的属性
@property (nonatomic,assign) CGFloat contentLabelH;
//数据模型
@property (nonatomic,strong) DemoModel *demoModel;

//我们最后得到cell的高度的方法
-(CGFloat)rowHeightWithCellModel:(DemoModel *)demoModel;
@end
