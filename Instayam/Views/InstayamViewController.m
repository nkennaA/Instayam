//
//  InstayamViewController.m
//  Instayam
//
//  Created by Nkenna Aniedobe on 7/9/18.
//  Copyright © 2018 Nkenna Aniedobe. All rights reserved.
//

#import "InstayamViewController.h"
#import "postCellTableViewCell.h"
#import "Post.h"
#import "PostDetailViewController.h"
@interface InstayamViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation InstayamViewController
- (IBAction)didHitPostButton:(id)sender {
    [self performSegueWithIdentifier:@"composeSegue" sender:self];
}
-(void)getPosts{
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    query.limit = 20;
    
    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.posts = posts;
            [self.tableView reloadData];
            [self.refresher endRefreshing];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}
- (IBAction)didLogout:(id)sender {
    [self didLogOut];
}
-(void)didLogOut{
    
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        if(error){
            NSLog(@"error");
        }
        else{
            NSLog(@"Successfully logged out");
            [self performSegueWithIdentifier:@"logoutSegue" sender:self];
        }
    }];
}
- (void)viewDidLoad {
    self.refresher = [UIRefreshControl new];
    UIRefreshControl *refresher = [[UIRefreshControl alloc]init];
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self getPosts];
    [self.refresher addTarget:self action:@selector(getPosts) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refresher atIndex:0];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.posts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    postCellTableViewCell *postCell = [tableView dequeueReusableCellWithIdentifier:@"postCell"];
    Post *post1 = self.posts[indexPath.row];
    [postCell setWithPost:post1];
    return postCell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showDetail"]){
        UITableViewCell *tapped = sender;
        NSIndexPath *indexpathh = [self.tableView indexPathForCell:tapped];
        Post *post = self.posts[indexpathh.row];
        PostDetailViewController *newView = [segue destinationViewController];
        newView.post = post;
    }
}


@end
