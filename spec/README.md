# Tone.rb Audio Test Suite

This test suite verifies that the Ruby Opal wrapper for Tone.js can actually generate sound, not just create objects.

## What These Tests Do

The tests use **Tone.Meter** (from Tone.js 13.8.25) to measure actual audio signal levels and verify that:

1. **Ruby synth classes produce audible sound** - Each `Tone::Synth` class generates measurable audio signals
2. **Ruby transport methods control audio timing** - `Tone::Transport` properly schedules and plays audio
3. **Ruby wrapper methods work correctly** - Methods like `trigger_attack_release` actually trigger sound
4. **Audio flows through effect chains** - Sound can be routed and processed through effects

## Test Approach

### Audio Detection Method
- Creates a `Tone.Meter` instance to measure RMS audio levels
- Connects Ruby synth outputs to the meter
- Samples audio levels every 50ms over test duration  
- Passes test if any sample exceeds threshold (typically -50dB)
- Fails if no audio detected above threshold

### Non-Flaky Design
- Uses reasonable thresholds (-50dB to -60dB depending on expected volume)
- Samples multiple times over duration (not single point-in-time)
- Allows time for audio envelope (attack/sustain phases)
- Cleans up audio nodes after each test

## Running Tests

### Browser Test Runner
```bash
# Start a local server in the project root
python -m http.server 8000
# or
ruby -run -e httpd . -p 8000

# Open in browser
open http://localhost:8000/spec/test_runner.html
```

1. Click "Start Audio Context" to initialize Web Audio API
2. Click "Run Ruby Wrapper Tests" to execute the test suite
3. Tests run automatically and show pass/fail results

### What You'll See
- Each test triggers audio through Ruby wrapper classes
- Real-time status shows which test is running
- Final results show pass/fail count
- Failed tests include error messages (e.g., "No audio detected")

## Test Categories

### Synth Audio Generation Tests
- `Tone::Synth::Simple` - Basic oscillator sounds
- `Tone::Synth::FM` - FM synthesis audio  
- `Tone::Synth::AM` - Amplitude modulation audio
- `Tone::Synth::Poly` - Polyphonic/chord audio
- `Tone::Synth::Noise` - Noise synthesis audio

### Transport Tests  
- Scheduled audio playback via `Tone::Transport.schedule`
- Transport start/stop controlling audio timing
- Ruby block scheduling syntax

### Method Tests
- `trigger_attack_release` - Complete note envelopes
- `trigger_attack` + `trigger_release` - Manual note control
- Volume parameter effects on audio levels

## Requirements

- Modern browser with Web Audio API support
- Audio output device (speakers/headphones) 
- Tone.js 13.8.25 (included in `lib/tone/vendor.js`)
- Opal Ruby-to-JavaScript compiler

## Test Design Philosophy

These tests focus on **actual audio generation** rather than:
- ❌ Object creation and method existence
- ❌ Parameter setting and getting  
- ❌ Mock/stub verification
- ❌ Testing Tone.js itself

Instead they verify:
- ✅ Ruby wrapper methods produce measurable audio signals
- ✅ Audio levels are above noise floor when expected
- ✅ Silence when audio should be stopped
- ✅ End-to-end audio pipeline functionality

This ensures the Ruby wrapper isn't just calling JavaScript methods, but that those calls result in actual sound generation that could be heard by users.