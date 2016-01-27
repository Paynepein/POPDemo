//
//  FacebookButtonAniamtionViewController.m
//  POPDemo
//
//  Created by lichangyuan on 16/1/26.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

#import "FacebookButtonAniamtionViewController.h"

@interface FacebookButtonAniamtionViewController ()

@property (weak, nonatomic) IBOutlet UITextField *msgTextField;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;

@end

@implementation FacebookButtonAniamtionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.msgTextField.delegate = self;
    self.sendButton.hidden = YES;
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *comment;
    
    if (range.length == 0) {
        comment = [NSString stringWithFormat:@"%@%@", textField.text, string];
    } else {
        comment = [textField.text substringToIndex:textField.text.length - range.length];
    }
    
    if (comment.length == 0) {
        [self showLikeButton];
    } else {
        [self showSendButton];
    }
    return YES;
}

- (void)showLikeButton {
    if (self.likeButton.isHidden) {
        self.sendButton.hidden = YES;
        self.likeButton.hidden = NO;
        
        POPSpringAnimation *spin = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
        spin.fromValue = @(M_PI_4);
        spin.toValue = @(0);
        spin.springBounciness = 20.f;
        spin.velocity = @(10);
        [self.likeButton.layer pop_addAnimation:spin forKey:@"likeAnimation"];
    }
}

- (void)showSendButton {
    if (self.sendButton.isHidden) {
        self.likeButton.hidden = YES;
        self.sendButton.hidden = NO;
        
        POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        springAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(8, 8)];
        springAnimation.springBounciness = 20.f;
        [self.sendButton pop_addAnimation:springAnimation forKey:@"sendAnimation"];
    }
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
