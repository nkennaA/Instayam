//
//  Post.h
//  Instayam
//
//  Created by Nkenna Aniedobe on 7/10/18.
//  Copyright © 2018 Nkenna Aniedobe. All rights reserved.
//

#import "PFObject.h"
#import "Parse.h"
#import <DateTools.h>
@interface Post : PFObject<PFSubclassing>

@property (nonatomic, strong) PFUser *author;
@property (nonatomic, strong) NSString * postID;
@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) PFFile *image;
@property (nonatomic, strong) NSNumber *likeCount;
@property (nonatomic, strong) NSNumber *commentCount;
@property (nonatomic, strong) NSString *userID;

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion;
@end
