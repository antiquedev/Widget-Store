#import "XXRootViewController.h"

@implementation XXRootViewController {
}


- (void)loadView {
	[super loadView];

//Background
self.view.backgroundColor = [UIColor whiteColor];

//Website View
UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];
webView.delegate = self;
[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://116.240.49.74"]]];
[self.view addSubview:webView];
}


//Download Euphoria
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {


    if(navigationType == UIWebViewNavigationTypeLinkClicked) {
        NSURL *theRessourcesURL = [request URL];
        NSString *fileExtension = [theRessourcesURL pathExtension];
        NSLog(@"fileExtension is: %@", fileExtension);
        if ([fileExtension isEqualToString:@".deb"] || [fileExtension isEqualToString:@"deb"]) {

            NSError *error = nil; //error setting
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
            NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:@"Downloads"];

            if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath])
                [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:&error]; //Create folder

NSString *stringURL = @"http://116.240.49.74/debs/com.dylanduff.CleanAF.deb";
NSURL  *url = [NSURL URLWithString:stringURL];
NSData *urlData = [NSData dataWithContentsOfURL:url];
if ( urlData )
{
  NSArray       *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString  *documentsDirectory = [paths objectAtIndex:0];  

  NSString  *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"filename.deb"];
  [urlData writeToFile:filePath atomically:YES];
}

                        UIAlertController * alert=   [UIAlertController
                                 alertControllerWithTitle:@"Downloading package"
                                 message:@"Please wait 5 seconds.."
                                 preferredStyle:UIAlertControllerStyleAlert];
    
   UIAlertAction* ok = [UIAlertAction
                        actionWithTitle:@"Close"
                        style:UIAlertActionStyleDestructive
                        handler:^(UIAlertAction * action)
                        {
                            [alert dismissViewControllerAnimated:YES completion:nil];
                             
                        }];
    
   [alert addAction:ok];
    
   [self presentViewController:alert animated:YES completion:nil];


            return NO;
        }       
        else{}
    }
        return YES;
}


@end
