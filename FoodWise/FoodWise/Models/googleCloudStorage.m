//
//  googleCloudStorage.m
//  FoodWise
//
//  Created by dasoya on 27.03.23.
//
//
//#import <GTMSessionFetcher/GTMSessionFetcher.h>
//#import <GTMSessionFetcher/GTMSessionFetcherService.h>
//
//GTMSessionFetcherService *_fetcherService = [[GTMSessionFetcherService alloc] init];
//
//NSURL *url = [NSURL URLWithString:myURLString];
//NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//
//// Optionally specify a file URL or NSData for the request body to upload.
//request.HTTPBody = [postString dataUsingEncoding:NSUTF8StringEncoding];
//
//GTMSessionFetcher *myFetcher = [_fetcherService fetcherWithRequest:request];
//myFetcher.retryEnabled = YES;
//myFetcher.comment = @"First profile image";
//
//[myFetcher beginFetchWithCompletionHandler:^(NSData *data, NSError *error) {
//    if (error != nil) {
//        // Server status code or network error.
//        //
//        // If the domain is kGTMSessionFetcherStatusDomain then the error code
//        // is a failure status from the server.
//    } else {
//        // Fetch succeeded.
//    }
//}];
