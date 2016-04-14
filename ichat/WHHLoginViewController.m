//
//  WHHResigterViewController.m
//  ichat
//
//  Created by whh on 16/4/14.
//  Copyright © 2016年 王恒辉. All rights reserved.
//

#import "WHHLoginViewController.h"

@interface WHHLoginViewController ()
@property (nonatomic, strong)UITextField *accountTF;//账户
@property (nonatomic, strong)UITextField *passwordTF;//密码
@property (nonatomic, strong)UIButton *registerBtn;
@property (nonatomic, strong)UIButton *loginBtn;

@end

@implementation WHHLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    //账户
    _accountTF = [[UITextField alloc] initWithFrame:CGRectMake(SW(30), 100, SCREEN_SIZE.width - 60, SW(30))];
    _accountTF.borderStyle = UITextBorderStyleRoundedRect;
    _accountTF.placeholder = @"账户";
    [self.view addSubview:_accountTF];
    //密码
    _passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(SW(30), 140, SCREEN_SIZE.width - 60, SW(30))];
    _passwordTF.borderStyle = UITextBorderStyleRoundedRect;
    _passwordTF.placeholder = @"密码";
    [self.view addSubview:_passwordTF];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 64)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    NSLog(@"%@", view);
    
    UIView *sv = self.view;
    //登录
    _loginBtn = [UIButton new];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    _loginBtn.backgroundColor = [UIColor grayColor];
    [_loginBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _loginBtn.tag = 10;
    [self.view addSubview:_loginBtn];
    //注册
    _registerBtn= [UIButton new];
    [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    _registerBtn.backgroundColor = [UIColor grayColor];
    [_registerBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _registerBtn.tag = 11;
    [self.view addSubview:_registerBtn];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordTF.mas_bottom).with.offset(10);
        make.left.equalTo(sv.mas_left).with.offset(SW(30));
        make.right.equalTo(_registerBtn.mas_left).with.offset(-SW(30));
        make.height.mas_equalTo(30);
    }];
    
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_loginBtn.mas_top);
        make.right.equalTo(sv.mas_right).with.offset(-SW(30));
        make.left.equalTo(_loginBtn.mas_right).with.offset(SW(30));
        make.width.equalTo(_loginBtn.mas_width);
        make.height.mas_equalTo(30);
        
    }];

    
}

- (void)buttonClick:(UIButton *)btn {
    switch (btn.tag) {
        case 10:
        {
            NSLog(@"登录");
        }
            break;
        case 11:
        {
            NSLog(@"注册");
        }
            break;
            
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
