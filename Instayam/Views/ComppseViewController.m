//
//  ComppseViewController.m
//  Instayam
//
//  Created by Nkenna Aniedobe on 7/10/18.
//  Copyright © 2018 Nkenna Aniedobe. All rights reserved.
//

#import "ComppseViewController.h"
#import "Post.h"

@interface ComppseViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@end

@implementation ComppseViewController
- (IBAction)didShare:(id)sender {
    [Post postUserImage:self.image withCaption:self.captionField.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        if(error){
            NSLog(@"Error posting");
        }
        else{
            NSLog(@"Success");
            [self performSegueWithIdentifier:@"doneWithPost" sender:self];
        }
    }];
}
- (IBAction)didCancel:(id)sender {
    [self performSegueWithIdentifier:@"doneWithPost" sender:self];
}
- (IBAction)didPressSelect:(id)sender {
    [self selectPicture];
}
- (IBAction)didTakePhoto:(id)sender {
    [self takePicture];
}
- (IBAction)didTap:(id)sender {
    [self.view endEditing:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}
-(void)selectPicture{
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}
-(void)takePicture{
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    self.image = editedImage;
    self.selectedPhoto.image = self.image;
    // Do something with the images (based on your use case)
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
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
