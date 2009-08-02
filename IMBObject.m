/*
 iMedia Browser Framework <http://karelia.com/imedia/>
 
 Copyright (c) 2005-2009 by Karelia Software et al.
 
 iMedia Browser is based on code originally developed by Jason Terhorst,
 further developed for Sandvox by Greg Hulands, Dan Wood, and Terrence Talbot.
 The new architecture for version 2.0 was developed by Peter Baumgartner.
 Contributions have also been made by Matt Gough, Martin Wennerberg and others
 as indicated in source files.
 
 The iMedia Browser Framework is licensed under the following terms:
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in all or substantial portions of the Software without restriction, including
 without limitation the rights to use, copy, modify, merge, publish,
 distribute, sublicense, and/or sell copies of the Software, and to permit
 persons to whom the Software is furnished to do so, subject to the following
 conditions:
 
	Redistributions of source code must retain the original terms stated here,
	including this list of conditions, the disclaimer noted below, and the
	following copyright notice: Copyright (c) 2005-2009 by Karelia Software et al.
 
	Redistributions in binary form must include, in an end-user-visible manner,
	e.g., About window, Acknowledgments window, or similar, either a) the original
	terms stated here, including this list of conditions, the disclaimer noted
	below, and the aforementioned copyright notice, or b) the aforementioned
	copyright notice and a link to karelia.com/imedia.
 
	Neither the name of Karelia Software, nor Sandvox, nor the names of
	contributors to iMedia Browser may be used to endorse or promote products
	derived from the Software without prior and express written permission from
	Karelia Software or individual contributors, as appropriate.
 
 Disclaimer: THE SOFTWARE IS PROVIDED BY THE COPYRIGHT OWNER AND CONTRIBUTORS
 "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
 LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE,
 AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 LIABLE FOR ANY CLAIM, DAMAGES, OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 CONTRACT, TORT, OR OTHERWISE, ARISING FROM, OUT OF, OR IN CONNECTION WITH, THE
 SOFTWARE OR THE USE OF, OR OTHER DEALINGS IN, THE SOFTWARE.
*/


//----------------------------------------------------------------------------------------------------------------------


#pragma mark HEADERS

#import "IMBObject.h"
#import <Quartz/Quartz.h>


//----------------------------------------------------------------------------------------------------------------------


@implementation IMBObject

@synthesize value = _value;
@synthesize name = _name;
@synthesize metadata = _metadata;


- (id) copyWithZone:(NSZone*)inZone
{
	IMBObject* copy = [[IMBObject allocWithZone:inZone] init];
	
	copy.value = self.value;
	copy.name = self.name;
	copy.metadata = self.metadata;
	
	return copy;
}

// Return a small generic icon for this file. Is the icon cached by NSWorkspace, or should be provide some 
// caching ourself?

- (NSImage*) icon
{
	NSString* extension = [(NSString*)_value pathExtension];
	return [[NSWorkspace sharedWorkspace] iconForFileType:extension];
}


@end


//----------------------------------------------------------------------------------------------------------------------


@implementation IMBVisualObject

@synthesize imageRepresentation = _imageRepresentation;
@synthesize imageRepresentationType = _imageRepresentationType;
@synthesize imageVersion = _imageVersion;


// Use path as image representation type for now. IKImageBrowserView then does all the thumbnail loading and 
// caching all by itself...

- (NSString*) imageRepresentationType
{
	return IKImageBrowserPathRepresentationType;
}

- (id) imageRepresentation
{
	return _value;
}

// Use the path or URL as the unique identifier...

- (NSString *) imageUID
{
	return _value;
}

// The name of the object will be used as the title in IKIMageBrowserView...

- (NSString *) imageTitle
{
	return _name;
}


@end


//----------------------------------------------------------------------------------------------------------------------