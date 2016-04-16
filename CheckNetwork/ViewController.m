//
//  ViewController.m
//  CheckNetwork
//
//  Created by huanghy on 16/4/15.
//  Copyright © 2016年 huanghy. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textField.text = @"http://www.baidu.com";
}
- (IBAction)testNetwork:(id)sender {
    Reachability *reach = [Reachability reachabilityWithHostName:self.textField.text];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            [self showAlert:@"网络不可访问"];
            break;
        case ReachableViaWiFi:
            [self showAlert:@"当前是WiFi网络"];
            break;
        case ReachableViaWWAN:
            [self showAlert:@"当前是3G/4G网络"];
            break;
        default:
            break;
    }
    
}

-(void)showAlert:(NSString *)msg{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"网络状态" message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
