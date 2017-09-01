//
//  NSFileManager+FHCategory.h
//  Pods
//
//  Created by shenfh on 2017/8/31.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (FHCategory)


/**
 Retorm Document Director Path.

 @return Path.
 */
+ (NSURL *)fh_documentDirectory;

+ (NSURL *)fh_libraryDirectory;

+ (NSURL *)fh_cacheDirectory;

+ (NSURL *)fh_tmpDirectory;
/**
 Create File if not exist.

 @param fileName The file name need to be create.
 @return TRUE for file create success.
 */
+ (BOOL)fh_createFileIfNotExist:(NSString*)fileName;


/**
 Create File Path.

 */
+ (BOOL)fh_createPathIfNotExist:(NSString*)path;


/**
 Check is file or path is Exist.

 @param fileName file or path name
 @return TRUE for file or path is exist.
 */
+ (BOOL)fh_fileExistsAtPath:(NSString*)fileName;


/**
 Delete File

 @param fileName the file to be delete
 @return Delete success for TRUE.Failure fo Success.
 */
+ (BOOL)fh_deleteFile:(NSString*)fileName;


/**
 Delete all file at path with suffix.

 */
+ (void)fh_deleteFileWithSuffix:(NSString*)path suffix:(NSString*)suffix;

+ (void)fh_deleteAllFileAtPath:(NSString*)path;
@end

NS_ASSUME_NONNULL_END
