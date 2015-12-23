//
//  DemoModel.h
//  NetWorkingDemo
//
//  Created by Mac on 15/12/22.
//  Copyright © 2015年 lei.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoModel : NSObject
@property (nonatomic,copy) NSString *icon; //图片
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *content; //内容的label
//单元格的高度
@property (nonatomic,assign) CGFloat cellHeight;
@end
