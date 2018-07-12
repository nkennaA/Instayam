//
//  postCellTableViewCell.h
//  Instayam
//
//  Created by Nkenna Aniedobe on 7/10/18.
//  Copyright © 2018 Nkenna Aniedobe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import <ParseUI/ParseUI.h>

@interface postCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet PFImageView *picture;
@property (weak, nonatomic) IBOutlet UILabel *caption;
-(void)setWithPost:(Post *)post;
@end
