/* ***** BEGIN LICENSE BLOCK *****
* Version: MPL 1.1/GPL 2.0/LGPL 2.1
*
* The contents of this file are subject to the Mozilla Public License Version
* 1.1 (the "License"); you may not use this file except in compliance with
* the License. You may obtain a copy of the License at
* http://www.mozilla.org/MPL/
*
* Software distributed under the License is distributed on an "AS IS" basis,
* WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
* for the specific language governing rights and limitations under the
* License.
*
* The Original Code is STEnum.
*
* The Initial Developer of the Original Code is
* James Tuley.
* Portions created by the Initial Developer are Copyright (C) 2004-2005
* the Initial Developer. All Rights Reserved.
*
* Contributor(s):
*           James Tuley <jbtule@mac.com> (Original Author)
*
* Alternatively, the contents of this file may be used under the terms of
* either the GNU General Public License Version 2 or later (the "GPL"), or
* the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
* in which case the provisions of the GPL or the LGPL are applicable instead
* of those above. If you wish to allow use of your version of this file only
* under the terms of either the GPL or the LGPL, and not to allow others to
* use your version of this file under the terms of the MPL, indicate your
* decision by deleting the provisions above and replace them with the notice
* and other provisions required by the GPL or the LGPL. If you do not delete
* the provisions above, a recipient may use your version of this file under
* the terms of any one of the MPL, the GPL or the LGPL.
*
* ***** END LICENSE BLOCK ***** */

//
//  NSDictionary-STEnumAdditions.m
//  STEnum
//
//  Created by James Tuley on Fri Jun 18 2004.
//  Copyright (c) 2004-2005 James Tuley. All rights reserved.
//

#import "NSDictionary-STEnumAdditions.h"


@implementation NSDictionary (STNonSharedCollectionAdditions)

-(void)doWithKeysUsingFunction:(void (*)(id, void *,BOOL*))actionFunction context:(void *)context{
    NSEnumerator *enumerator = [self keyEnumerator];
    id key;
    BOOL aBreak = false;
    while ((key = [enumerator nextObject]) && !aBreak) {
        actionFunction(key,context,&aBreak);
    }
}

@end

@interface NSDictionary (STPrivateAdditions)
-(NSEnumerator*)_STEnumerator;
-(id)_STEmptyMutableCollection;
-(id)_STObjectForObject:(id)anObject;
-(void)_STAdd:(id)anObject toCollection:(id)aCollection originalObject:anOriginalObject;
-(id)_STReturnMeFromCollection:(id)aCollection;
@end

@implementation NSDictionary (STPrivateAdditions)


-(NSEnumerator*)_STEnumerator{
    return [self keyEnumerator];
}

-(id)_STEmptyMutableCollection{
    return [NSMutableDictionary dictionaryWithCapacity:[self count]];
}

-(id)_STObjectForObject:(id)anObject{
    return [self objectForKey:anObject];
}

-(void)_STAdd:(id)anObject toCollection:(id)aCollection originalObject:anOriginalObject{
    [aCollection setObject:anObject forKey:anOriginalObject];
}

-(id)_STReturnMeFromCollection:(id)aCollection{
    return [[self classForCoder] dictionaryWithDictionary: aCollection];
}

@end

@implementation NSDictionary (STSharedCollectionAdditions)

#include "STSharedEnum.m"

@end
