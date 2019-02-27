/*
   Project: Player

   Copyright (C) 2019 Sergii Stoian

   This application is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public
   License as published by the Free Software Foundation; either
   version 2 of the License, or (at your option) any later version.

   This application is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU General Public
   License along with this library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111 USA.
*/

#import <AppKit/AppKit.h>

@interface Mixer : NSObject
{
  id window;
  id serverInfo;
  id cardInfo;
  
  id streamsBrowser;
  id sreamMute;
  id streamVolume;
  
  id devicesBrowser;
  id deviceMute;

  // Advanced Sound Preferences
  id modeButton;
  id appBrowser;
  id appMute;
  id appVolume;
  id outputMute;
  id outputDevice;
  id outputDeviceProfile;
  id outputVolume;
  id outputBalance;
}

- (NSWindow *)window;

- (void)reloadBrowser:(NSBrowser *)browser;
- (void)fillOutputDeviceList;
- (void)fillOutputProfileList;

@end
