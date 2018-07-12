//
//  ComppseViewController.h
//  Instayam
//
//  Created by Nkenna Aniedobe on 7/10/18.
//  Copyright © 2018 Nkenna Aniedobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComppseViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *selectedPhoto;
@property (weak, nonatomic) IBOutlet UITextField *captionField;
@property (strong, nonatomic) UIImage *image;
@end
