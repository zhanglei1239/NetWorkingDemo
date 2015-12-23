//
//  DemoCell.m
//  NetWorkingDemo
//
//  Created by Mac on 15/12/22.
//  Copyright © 2015年 lei.zhang. All rights reserved.
//

#import "DemoCell.h"
#import <Masonry/MASConstraintMaker.h>

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//头像的高度
#define iconW  80
#define titleW 200
#define titleH 30
//间距
#define  marginW 10
@implementation DemoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //1.添加子控件
        [self setupUI];
        
    }
    return self;
}

#pragma mark 添加子控件
-(void)setupUI
{
    //1.添加图片
    UIImageView *icon=[UIImageView new];
    icon.contentMode=UIViewContentModeScaleAspectFill;
    icon.clipsToBounds=YES;
    [self.contentView addSubview:icon];
    self.icon=icon;
    UILabel *title = [UILabel new];
    title.numberOfLines = 0;
    title.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:title];
    self.lblTitle = title;
    //2.添加label
    UILabel *content=[UILabel new];
    content.numberOfLines=0; //多行显示
    content.font=[UIFont systemFontOfSize:16];
    [self.contentView addSubview:content];
    content.lineBreakMode = NSLineBreakByCharWrapping;
    self.lblContent=content;
    //3.底部添加一条线
    UIImageView *line=[UIImageView new];
    line.backgroundColor=[UIColor grayColor];
    [self.contentView addSubview:line];
    self.line=line;
    
    //设置约束
    __weak __typeof(&*self)weakSelf = self;
    //1.设置图片的大小
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(iconW);  //头像的高度
        make.width.mas_equalTo(iconW); //头像的宽度
        make.top.equalTo(weakSelf.mas_top).offset(marginW) ; //距离顶部10的距离
        make.left.equalTo(weakSelf.mas_left).offset(marginW);
    }];
    
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(titleH);
        make.top.equalTo(weakSelf.mas_top).offset(marginW);
        make.left.equalTo(weakSelf.mas_left).offset(marginW*2+iconW);
        make.right.equalTo(weakSelf.mas_right).offset(marginW);
    }];
    //2.设置contentLabel
    [self.lblContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.lblTitle.mas_bottom).offset(marginW); //文本距离头像底部10个间距
        make.left.equalTo(weakSelf.mas_left).offset(marginW*2+iconW);  //文本距离左边的距离
        make.right.equalTo(weakSelf.mas_right).offset(-marginW);  //文本距离右边的距离
    }];
    
    //3.设置下划线的大小
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.equalTo(weakSelf.mas_left).offset(0);
        make.right.equalTo(weakSelf.mas_right).offset(0);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-.5);
    }];
    
}

//传递数据模型
-(void)setDemoModel:(DemoModel *)demoModel
{
    _demoModel=demoModel;
    
    self.icon.image=[UIImage imageNamed:demoModel.icon];  //头像
    self.lblTitle.text = demoModel.title;
    self.lblContent.text=demoModel.content; //文本内容
}

//在表格cell中 计算出高度
-(CGFloat)rowHeightWithCellModel:(DemoModel *)demoModel
{
    _demoModel=demoModel;
    __weak __typeof(&*self)weakSelf = self;
    //设置标签的高度
    [self.lblContent mas_makeConstraints:^(MASConstraintMaker *make) {
        // weakSelf.contentLabelH  这个会调用下面的懒加载方法
        make.height.mas_equalTo(weakSelf.contentLabelH);
    }];
    
    // 2. 更新约束
    [self layoutIfNeeded];
    
    //3.  视图的最大 Y 值
    CGFloat h= CGRectGetMaxY(self.lblContent.frame);
    
    return h+marginW; //最大的高度+10
}

/*
 *  懒加载的方法返回contentLabel的高度  (只会调用一次)
 */
-(CGFloat)contentLabelH
{
    if(!_contentLabelH){
        CGFloat h=[self.demoModel.content boundingRectWithSize:CGSizeMake(([UIScreen mainScreen].bounds.size.width)-2*marginW-iconW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
        
        _contentLabelH=h+marginW;  //内容距离底部下划线10的距离
    }
    return _contentLabelH;
}
@end
