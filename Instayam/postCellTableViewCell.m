//
//  postCellTableViewCell.m
//  Instayam
//
//  Created by Nkenna Aniedobe on 7/10/18.
//  Copyright © 2018 Nkenna Aniedobe. All rights reserved.
//

#import "postCellTableViewCell.h"
#import <ParseUI/ParseUI.h>
@implementation postCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setWithPost:(Post *)post{
    self.caption.text = post.caption;
    self.picture.file = post.image;
    [self.picture loadInBackground];
}

@end
