//
//  DemoModel.m
//  NetWorkingDemo
//
//  Created by Mac on 15/12/22.
//  Copyright © 2015年 lei.zhang. All rights reserved.
//

#import "DemoModel.h"
#import "DemoCell.h"
@implementation DemoModel
//惰性初始化是这样写的
-(CGFloat)cellHeight
{
    //只在初始化的时候调用一次就Ok
    if(!_cellHeight){
        DemoCell *cell=[[DemoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:demoIndentifier];
        // 调用cell的方法计算出高度
        _cellHeight=[cell rowHeightWithCellModel:self];
    } 
    return _cellHeight;
}
@end
