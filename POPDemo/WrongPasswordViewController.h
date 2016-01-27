//
//  WrongPasswordViewController.h
//  POPDemo
//
//  Created by lichangyuan on 16/1/26.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <pop/POP.h>

@interface WrongPasswordViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;

- (IBAction)LoginButtonPressed:(id)sender;
@end
