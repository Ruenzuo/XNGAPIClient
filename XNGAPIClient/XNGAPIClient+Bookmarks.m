//
// Copyright (c) 2015 XING AG (http://xing.com/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "XNGAPIClient+Bookmarks.h"

@implementation XNGAPIClient (Bookmarks)

- (void)getBookmarksForUserWithID:(NSString *)userID
                       userFields:(NSString *)userFields
                            limit:(NSInteger)limit
                           offset:(NSInteger)offset
                          success:(void (^)(id JSON))success
                          failure:(void (^)(NSError *error))failure {
    if (!userID) {
        return;
    }

    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    if (userFields) {
        parameters[@"user_fields"] = userFields;
    }
    if (limit) {
        parameters[@"limit"] = @(limit);
    }
    if (offset) {
        parameters[@"offset"] = @(offset);
    }

    NSString *path = [NSString stringWithFormat:@"v1/users/%@/bookmarks", userID];
    [self getJSONPath:path parameters:parameters success:success failure:failure];
}

- (void)putCreateBookmarkForUserID:(NSString *)userID
                           success:(void (^)(id JSON))success
                           failure:(void (^)(NSError *error))failure {
    if (!userID) {
        return;
    }

    NSString *path = [NSString stringWithFormat:@"v1/users/me/bookmarks/%@", userID];
    [self putJSONPath:path parameters:nil success:success failure:failure];
}

- (void)deleteBookmarkForUserID:(NSString *)userID
                        success:(void (^)(id JSON))success
                        failure:(void (^)(NSError *error))failure {
    if (!userID) {
        return;
    }

    NSString *path = [NSString stringWithFormat:@"v1/users/me/bookmarks/%@", userID];
    [self deleteJSONPath:path parameters:nil success:success failure:failure];
}

@end
