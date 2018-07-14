//
//  SignUpViewController.m
//  Instayam
//
//  Created by Nkenna Aniedobe on 7/9/18.
//  Copyright © 2018 Nkenna Aniedobe. All rights reserved.
//

#import "SignUpViewController.h"
#import "Parse.h"

@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (strong, nonatomic) IBOutlet UIView *view;

@end

@implementation SignUpViewController
- (IBAction)didSignUp:(id)sender {
    [self registerUser];
    [self performSegueWithIdentifier:@"signedUp" sender:self];
    
}
- (IBAction)didTapOut:(id)sender {
    [self.view endEditing:YES];
}
- (void)registerUser {
    // initialize a user object
    PFUser *newUser = [PFUser user];
    
    // set user properties
    newUser.username = self.usernameField.text;
    newUser.email = self.emailField.text;
    newUser.password = self.passwordField.text;
    
    // call sign up function on the object
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            NSLog(@"User registered successfully");
            
            // manually segue to logged in view
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = @[(id)[UIColor purpleColor].CGColor, (id)[UIColor orangeColor].CGColor];
    [self.view.layer insertSublayer:gradient atIndex:0];
    // Do any additional setup after loading the view.
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
