//
//  MatchDetailsViewController.m
//  IPLMatchWinner
//
//  Created by Vamsi Kallepalli on 4/8/17.
//  Copyright © 2017 Vamsi Kallepalli. All rights reserved.
//

#import "MatchDetailsViewController.h"

@interface MatchDetailsViewController ()

@end

@implementation MatchDetailsViewController

@synthesize webView;

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    //UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    //[self.view addSubview:webView];
    NSString *url = @"http://www.iplt20.com/";
    NSURL *nsUrl = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:nsUrl cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30];
    
    [webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
