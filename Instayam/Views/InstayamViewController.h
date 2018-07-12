//
//  InstayamViewController.h
//  Instayam
//
//  Created by Nkenna Aniedobe on 7/9/18.
//  Copyright © 2018 Nkenna Aniedobe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse.h"
@interface InstayamViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *posts;
@property (strong, nonatomic) UIRefreshControl *refresher;
@end
