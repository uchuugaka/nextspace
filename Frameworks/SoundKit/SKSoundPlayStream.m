//
// Project: SoundKit framework.
//
// Copyright (C) 2019 Sergii Stoian
//
// This application is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License as published by the Free Software Foundation; either
// version 2 of the License, or (at your option) any later version.
//
// This application is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Library General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this library; if not, write to the Free
// Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111 USA.
//

#import "PASink.h"
#import "PASinkInput.h"

#import "SKSoundOut.h"
#import "SKSoundPlayStream.h"

@implementation SKSoundPlayStream

- (void)dealloc
{
  [super dealloc];
}

static void stream_write_callback(pa_stream *stream, size_t length, void *userdata)
{
  /*  sf_count_t frames, frames_read;
      float      *data; */
  // pa_assert(s && length && snd_file);

  fprintf(stderr, "[SKSoundStream] stream_write_callback\n");
  
  /*
  data = pa_xmalloc(length);

  // pa_assert(sample_length >= length);
  frames = (sf_count_t) (length/pa_frame_size(&sample_spec));
  frames_read = sf_readf_float(snd_file, data, frames);
  fprintf(stderr, "length == %li frames == %li frames_read == %li\n",
          length, frames, frames_read);
  
  if (frames_read <= 0) {
    pa_xfree(data);
    fprintf(stderr, "End of file\n");
    pa_stream_set_write_callback(stream, NULL, NULL);
    pa_stream_disconnect(stream);
    pa_stream_unref(stream);
    return;
  }

  pa_stream_write(s, d, length, pa_xfree, 0, PA_SEEK_RELATIVE);
  */
}

- (void)activate
{
  pa_stream_connect_playback(paStream, [((SKSoundOut *)super.device).sink.name cString],
                             NULL, 0, NULL, NULL);
  pa_stream_set_write_callback(paStream, stream_write_callback, NULL);
  super.isActive = YES;
}
- (void)deactivate
{
  pa_stream_set_write_callback(paStream, NULL, NULL);
  pa_stream_disconnect(paStream);
  // pa_stream_unref(paStream);
  super.isActive = NO;
}

- (void)playBuffer:(void *)data
              size:(NSUInteger)bytes
               tag:(NSUInteger)anUInt
{
  NSLog(@"[SoundKit, SKSoundPlayStream] playBuffer:size:tag: is not implemented yes.");
}

- (NSUInteger)volume
{
  return [_sinkInput volume];
}
- (void)setVolume:(NSUInteger)volume
{
  [_sinkInput applyVolume:volume];
}
- (CGFloat)balance
{
  return _sinkInput.balance;
}
- (void)setBalance:(CGFloat)balance
{
  [_sinkInput applyBalance:balance];
}
- (void)setMute:(BOOL)isMute
{
  [_sinkInput applyMute:isMute];
}
- (BOOL)isMute
{
  return (BOOL)_sinkInput.mute;
}

@end
