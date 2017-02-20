//
//  AppDelegate.m
//  DSBlocks
//
//  Created by Дмитрий Солоп on 12.12.16.
//  Copyright © 2016 Dimon Solop. All rights reserved.
//

#import "AppDelegate.h"
#import "DSObject.h"
#import "DSStudent.h"


typedef void (^OurTestBlock)(void);

typedef NSString* (^OurTestBlock2)(NSInteger intValue);

@interface AppDelegate ()

@property (copy, nonatomic) OurTestBlock testBlock;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    /*
     [self testMethod];
     
     [self testMethodWithParams:@"TEST STRING" value:111];
     
     NSString* result = [self testMethodReturnValueWithParams:@"TEST STRING" value:111];
     NSLog(@"%@", result);
     
     void (^testBlock) (void);
     testBlock = ^{
     NSLog(@"Test block");
     };
     
     testBlock ();
     testBlock ();
     testBlock ();
     
     void (^testBlockWithParams)(NSString*, NSInteger) = ^(NSString* string, NSInteger intValue) {
     NSLog(@"testBlockWithParams %@, %ld", string, intValue);
     };
     
     testBlockWithParams(@"TEST STRING", 111);
     
     NSString* (^testBlockReturnValueWithParams)(NSString*, NSInteger) = ^(NSString* string, NSInteger intValue) {
     return [NSString stringWithFormat:@"testBlockReturnValueWithParams %@, %ld", string, intValue] ;
     };
     
     NSString* result = testBlockReturnValueWithParams(@"TEST STRING", 111);
     NSLog(@"%@", result);
     
     
     __block NSInteger i = 0;
     
     __block NSString* testString = @"How is it possible";
     
     void (^testBlock2) (void) = ^{
     NSLog(@"Test block");
     i++;
     testString = [NSString stringWithFormat:@"How is it possible %ld", i];
     NSLog(@"%@", testString);
     };
     
     testBlock2();
     testBlock2();
     testBlock2();
     testBlock2();
     testBlock2();
     
     OurTestBlock testBlock3 = ^{
     NSLog(@"BLOCK 3 !!!");
     };
     
     OurTestBlock2 tb = ^(NSInteger intValue){
     return [NSString stringWithFormat:@"%ld", intValue];
     };
     
     NSLog(@"%@", tb(234723));
     
     
     [self testBlocksMethod:^{
     NSLog(@"BLOCK!!!");
     }];
     
     [self testBlocksMethod2:testBlock3];
     

     DSObject* object = [[DSObject alloc]init];
     object.name = @"object";
     
     OurTestBlock tb = ^{
     NSLog(@"%@", object.name);
     };
     
     self.testBlock = tb;
     
     self.testBlock ();
     
     tb();
     
    
    

//  1) --------------------------------------------------------------------------------------------
    
    void (^firstBlock)(void);
    firstBlock = ^{
        NSLog(@"This my first block");
    };
    
    firstBlock ();
//   ----------------------------------------------------------------------------------------------


//  2) --------------------------------------------------------------------------------------------
    
    NSString* (^secondBlock)(NSString*) = ^(NSString* string){
        return [NSString stringWithFormat:@"Second block is %@", string];
    };
    
    NSString* tempString = secondBlock (@"the hardest");
    
    NSLog(@"%@", tempString);
//   ----------------------------------------------------------------------------------------------
    
//  3) --------------------------------------------------------------------------------------------
    
    
    [self myFirstMethodWithBlock:secondBlock value:@"a third block"];
*/
//  STUDENT----------------------------------------------------------------------------------------
    
    DSStudent* student_1 = [[DSStudent alloc]init];
    DSStudent* student_2 = [[DSStudent alloc]init];
    DSStudent* student_3 = [[DSStudent alloc]init];
    DSStudent* student_4 = [[DSStudent alloc]init];
    DSStudent* student_5 = [[DSStudent alloc]init];
    DSStudent* student_6 = [[DSStudent alloc]init];
    DSStudent* student_7 = [[DSStudent alloc]init];
    DSStudent* student_8 = [[DSStudent alloc]init];
    DSStudent* student_9 = [[DSStudent alloc]init];
    DSStudent* student_10 = [[DSStudent alloc]init];
    
    student_1.name = @"Vasiliy";
    student_1.lastName = @"Kuzin";
    student_2.name = @"Petro";
    student_2.lastName = @"Petrenko";
    student_3.name = @"Darina";
    student_3.lastName = @"Adler";
    student_4.name = @"Darina";
    student_4.lastName = @"Volkova";
    student_5.name = @"Vasiliy";
    student_5.lastName = @"Lomachenko";
    student_6.name = @"Oleg";
    student_6.lastName = @"Petrenko";
    student_7.name = @"Dmitro";
    student_7.lastName = @"Logos";
    student_8.name = @"Nikolay";
    student_8.lastName = @"Petrenko";
    student_9.name = @"Olga";
    student_9.lastName = @"Rubinina";
    student_10.name = @"Elena";
    student_10.lastName = @"Petrenko";

    NSArray* studentsArray = [NSArray arrayWithObjects:student_1, student_2,
                              student_3, student_4, student_5, student_6,
                              student_7, student_8, student_9, student_10, nil];
    
    NSArray* sortedStudentsArray = [studentsArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        if ([(DSStudent*) obj1 lastName] && [(DSStudent*) obj2 lastName]) {
            if ([(DSStudent*) obj1 lastName] == [(DSStudent*) obj2 lastName]) {
                return [[(DSStudent*) obj1 name] compare: [(DSStudent*) obj2 name]];
            }
            return [[(DSStudent*) obj1 lastName] compare: [(DSStudent*) obj2 lastName]];
        }else{
            return NSOrderedAscending;
        }
    }];
    
    for (DSStudent* student in sortedStudentsArray) {
        NSLog(@"Student: %@, %@", student.lastName, student.name);
    }
    
    
 
    return YES;
}
/*
- (void) myFirstMethodWithBlock:(NSString*(^)(NSString*)) block value:(NSString*) string {
    NSLog(@"%@", block(string));
}

- (void) testMethod {
    NSLog(@"Test method");
}

- (void) testMethodWithParams:(NSString*) string value:(NSInteger) intValue {
    NSLog(@"Test method with params %@, %ld", string, intValue);
}

- (NSString*) testMethodReturnValueWithParams:(NSString*) string value:(NSInteger) intValue {
    return [NSString stringWithFormat:@"testMethodReturnValueWithParams %@, %ld", string, intValue];
}

- (void) testBlocksMethod:(void(^)(void)) testBlock {
    NSLog(@"testBlocksMethod");
    testBlock();
    testBlock();
    testBlock();
    testBlock();
}

- (void) testBlocksMethod2:(void(^)(void)) testBlock {
    NSLog(@"testBlocksMethod 2");
    testBlock ();
}
 */
 
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
