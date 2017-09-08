//
//  ViewController.m
//  DateTimePickerViewDemo
//
//  Created by Tanyfi on 17/6/21.
//  Copyright © 2017年 TZF. All rights reserved.
//

#import "ViewController.h"
#import "DateTimePickerView.h"
@interface ViewController ()<DateTimePickerViewDelegate>
@property (nonatomic, weak) UILabel *textL;
@property (nonatomic, strong) DateTimePickerView *datePickerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    button.frame = CGRectMake(0, 0, 200, 40);
    button.center = self.view.center;
    [button setTitle:@"点我" forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    UILabel *textL = [[UILabel alloc] init];
    [self.view addSubview:textL];
    textL.backgroundColor = [UIColor lightGrayColor];
    self.textL = textL;
    textL.textAlignment = NSTextAlignmentCenter;
    textL.frame = CGRectMake((self.view.frame.size.width-200)*0.5, CGRectGetMaxY(button.frame)+30, 200, 40);

    
}

- (void)click:(UIButton *)btn{

    DateTimePickerView *pickerView = [[DateTimePickerView alloc] init];
    self.datePickerView = pickerView;
    pickerView.delegate = self;
    pickerView.pickerViewMode = DatePickerViewDateMode;
    [self.view addSubview:pickerView];
    [pickerView showDateTimePickerView];

}

#pragma mark - delegate

- (void)didClickFinishDateTimePickerView:(NSString *)date{
    self.textL.text = date;
}



@end
