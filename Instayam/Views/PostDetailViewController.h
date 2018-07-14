//
//  PostDetailViewController.h
//  Instayam
//
//  Created by Nkenna Aniedobe on 7/12/18.
//  Copyright © 2018 Nkenna Aniedobe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import <ParseUI/ParseUI.h>
@interface PostDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *commentField;
@property (weak, nonatomic) IBOutlet PFImageView *postPic;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *likesLabel;
@property (strong, nonatomic) Post *post;
@end
