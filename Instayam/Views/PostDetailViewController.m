//
//  PostDetailViewController.m
//  Instayam
//
//  Created by Nkenna Aniedobe on 7/12/18.
//  Copyright © 2018 Nkenna Aniedobe. All rights reserved.
//

#import "PostDetailViewController.h"

@interface PostDetailViewController ()

@end

@implementation PostDetailViewController
- (IBAction)didTapLike:(id)sender {
    int value = [self.post.likeCount intValue];
    self.post.likeCount = [NSNumber numberWithInt:(value+1)];
    [self.post saveInBackground];
    self.likesLabel.text = [NSString stringWithFormat:@"%@", self.post.likeCount];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.captionLabel.text = self.post.caption;
    self.postPic.file = self.post.image;
    self.likesLabel.text = [NSString stringWithFormat:@"%@", self.post.likeCount];
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
