//
//  ViewController.m
//  NetWorkingDemo
//
//  Created by Mac on 15/12/16.
//  Copyright © 2015年 lei.zhang. All rights reserved.
//

#import "ViewController.h"
#import "NetServiceManager.h" 
#import <MBProgressHUD/MBProgressHUD.h>
#import "CustomURLCache.h"
#import "DemoModel.h"
#import "DemoCell.h"
@interface ViewController ()
{
    //用来测试网页本地缓存
    UIWebView * wView;
    //用来测试Masonry的uitableviewcell的高度自适应
    UITableView * tView;
    NSMutableArray * arr;
    NSMutableArray * titleArr;
    NSMutableArray * modelArr;
}
@end

@implementation ViewController

-(void)initData
{
    if(arr==nil){
        arr=[NSMutableArray array];
        [arr addObject:@"高通与小米达成专利授权协议的主要影响在于小米的海外市场，因为在国内小米并不会遇到专利问题。然而，分析小米在海外遇到的问题会发现，这远不是签订一个专利协议能解决"];
        [arr addObject:@"当年科比和乔丹的对决，那时的科比几乎无所不能，谁又会想到他会退役，说不定再过10年，我也就退役了。"];
        [arr addObject:@"高通与小米达成专利授权协议的主要影响在于小米的海外市场，因为在国内小米并不会遇到专利问题。然而，分析小米在海外遇到的问题会发现，这远不是签订一个专利协议能解决"];
        [arr addObject:@"hello 这是我的iOS学习群 519797474，欢迎加入"];
        [arr addObject:@"佛堂中，大师正在对弟子讲话：“为师为你们所起之名并非随随便便，而是为师对你们的期望，你们懂了吗？”众弟子都回答懂了。只有一名弟子默然不语。大师见状，问那名弟子道：“圆寂，你为什么不说话?"];
        [arr addObject:@"最后这个例子是老例子了最后这个例子是老例子了，我想给大家看看其实Masonry做动画也和其他的Autolayout方法一样，但是添加约束的代码却非常的少最后这个例子是老例子了，我想给大家看看其实Masonry做动画也和其他的Autolayout方法一样，但是添加约束的代码却非常的少最后这个例子是老例子了，我想给大家看看其实Masonry做动画也和其他的Autolayout方法一样，但是添加约束的代码却非常的少最后这个例子是老例子了，我想给大家看看其实Masonry做动画也和其他的Autolayout方法一样，但是添加约束的代码却非常的少最后这个例子是老例子了，"];
        titleArr = [NSMutableArray array];
        [titleArr addObject:@"标题111111"];
        [titleArr addObject:@"标题2222222222"];
        [titleArr addObject:@"标题333"];
        [titleArr addObject:@"标题44444444444444444"];
        [titleArr addObject:@"标题5555555555555555555555"];
        [titleArr addObject:@"标题6666"];
        modelArr =[NSMutableArray array];
        for(int i=0;i<arr.count;i++){
            DemoModel *m= [[DemoModel alloc]init];
            m.icon= [NSString stringWithFormat:@"%i.jpg",i];
            m.title= titleArr[i];
            m.content = arr[i];
            //把模型那存到模型数组中
            [modelArr addObject:m];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    wView = [[UIWebView alloc] initWithFrame:self.view.frame];
//    wView.delegate = self;
//    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://github.com/"]];
//    [wView loadRequest:request];
//    [self.view addSubview:wView];
    
    [self initData];
    [tView registerClass:[DemoCell class] forCellReuseIdentifier:demoIndentifier];
    tView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [tView setDataSource:self];
    [tView setDelegate:self];
    tView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
//    CustomURLCache *urlCache = (CustomURLCache *)[NSURLCache sharedURLCache];
//    [urlCache removeAllCachedResponses];
}

//- (void)webViewDidStartLoad:(UIWebView *)webView{
////    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//}
//
//-(void)webViewDidFinishLoad:(UIWebView *)webView{
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
//}
//
//-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.mode = MBProgressHUDModeIndeterminate;
//    hud.labelText = @"Loading...";
//}


#pragma mark -- TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //因为是我们自定义的数据 所以 这里写arr而不是arrModel  因为只有这样才会调用arr的懒加载犯法
    return arr.count;
}

/*
 返回表格单元
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //取出模型
    DemoModel *model=modelArr[indexPath.row];
    
    DemoCell *cell = [tableView dequeueReusableCellWithIdentifier:demoIndentifier];
    if (cell == nil) {
        cell = [[DemoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:demoIndentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //传递模型给cell
    cell.demoModel=model;
    
    return cell;
}

/*
 *  返回每一个表格单元的高度
 */

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取出模型
    DemoModel *homeModel=modelArr[indexPath.row];
    
    return    homeModel.cellHeight ;
}




@end
