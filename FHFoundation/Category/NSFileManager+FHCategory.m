//
//  NSFileManager+FHCategory.m
//  Pods
//
//  Created by shenfh on 2017/8/31.
//
//

#import "NSFileManager+FHCategory.h"

@implementation NSFileManager (FHCategory)

+ (NSString*)fh_documentDirectory {
    return  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString*)fh_libraryDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString*)fh_cacheDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
}

+ (NSString*)fh_tmpDirectory {
    return NSTemporaryDirectory();
   
}

+ (BOOL) fh_createFileIfNotExist:(NSString *)fileName {
    if (fileName == nil) {
        return FALSE;
    }
    if ([self fh_fileExistsAtPath:fileName]) {
        return TRUE;
    }
    NSFileManager *manager = [NSFileManager defaultManager];

    return [manager createFileAtPath:fileName contents:nil attributes:nil];
}

+ (BOOL)fh_createPathIfNotExist:(NSString *)path {
    if (path == nil) {
        return FALSE;
    }
    if ([self fh_fileExistsAtPath:path]) {
        return TRUE;
    }
    NSError *error = nil;
    BOOL success = [[NSFileManager defaultManager]createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
    
    return success;
}

+ (BOOL) fh_fileExistsAtPath:(NSString*)fileName {
    if (fileName == nil) {
        return FALSE;
    }
    return [[NSFileManager defaultManager]fileExistsAtPath:fileName];
}

+ (BOOL) fh_deleteFile:(NSString *)fileName {
    NSError *error = nil;
    BOOL success = [[NSFileManager defaultManager]removeItemAtPath:fileName error:&error];
    if (error) {
        return FALSE;
    }
    return success;
}

+ (void)fh_deleteFileWithSuffix:(NSString *)path suffix:(NSString *)suffix {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray<NSURL*> *contents = [fileManager contentsOfDirectoryAtURL:path
                                   includingPropertiesForKeys:@[]
                                                      options:NSDirectoryEnumerationSkipsHiddenFiles
                                                        error:nil];
    
    for (NSURL *fileURL in contents) {
        if ([[fileURL absoluteString]hasSuffix:suffix]) {
            [fileManager removeItemAtURL:fileURL error:nil];
        }
    }
}

+ (void)fh_deleteAllFileAtPath:(NSString *)path {
    if (path == nil) {
        return;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray<NSURL*> *contents = [fileManager contentsOfDirectoryAtURL:[NSURL URLWithString:path]
                                           includingPropertiesForKeys:@[]
                                                              options:NSDirectoryEnumerationSkipsHiddenFiles
                                                                error:nil];
    
    for (NSURL *fileURL in contents) {
        [fileManager removeItemAtURL:fileURL error:nil];
    }
}
@end
