# MyTime - Professional Time Tracker

A sophisticated time tracking Progressive Web App with hierarchical categories, CSV export, and offline support.

## ✨ Features

- **Hierarchical Categories**: Main categories with subcategories for detailed tracking
- **Timer Functionality**: Start, Pause, Resume, Save Session, Reset
- **Progress Tracking**: Visual progress bars showing daily targets vs actual time
- **CSV Export**: Weekly CSV generation compatible with Google Calendar
- **PWA Support**: Installable as Progressive Web App with offline support
- **Local Storage**: Session history and settings persistence
- **Mobile Responsive**: Optimized for mobile and desktop devices
- **Configuration**: User-friendly settings for category management
- **Minimum Duration**: Configurable minimum session requirement (default: 5 minutes)

## 🚀 Quick Start

1. Open `mytime.html` in your web browser
2. Click "Start" to begin a new session
3. Select a category and subcategory
4. Track your time with pause/resume capability
5. Save sessions when complete
6. View progress and export data

## 📱 Mobile Installation

### Android:
1. Open in Chrome browser
2. Tap menu (⋮) → "Add to Home Screen" 
3. App appears as standalone application

### iOS:
1. Open in Safari browser
2. Tap Share button → "Add to Home Screen"
3. App runs in fullscreen mode

## 📁 File Structure

- **mytime.html** - Main application (self-contained SPA)
- **config.yaml** - Category definitions and settings
- **manifest.json** - PWA manifest for installability
- **sw.js** - Service worker for offline functionality
- **icons/** - App icons (need to be generated)

## ⚙️ Configuration

Categories and settings are defined in `config.yaml`. Each category includes:
- Name and display icon
- Color theme
- Daily target in minutes
- Subcategories for detailed tracking

## 💾 Data Storage

All data is stored locally in browser localStorage:
- `mytime-history` - Session history
- `mytime-categories` - Category definitions
- `mytime-csv-data` - Weekly CSV data
- `mytime-settings` - App settings

## 📊 CSV Export

Weekly CSV files are generated in Google Calendar compatible format:
- Subject: Category - Subcategory
- Start/End dates and times
- Compatible with most calendar applications

## 🔧 Development

### Prerequisites
- Modern web browser
- Local web server (for PWA features)

### Local Development
```bash
# Serve locally for PWA testing
npx serve .
# or
python -m http.server 8000
```

### Building Icons
See `icons/generate-icons.md` for icon generation instructions.

## 🌐 Browser Compatibility

- Chrome/Edge: Full support
- Firefox: Full support  
- Safari: Full support
- Requires: ES6, Local Storage, Service Workers

## 📋 Current Status

**Version**: 1.0  
**Status**: Production Ready  

### ✅ Implemented
- Core timer functionality
- Hierarchical categories
- CSV export
- PWA support
- Mobile responsiveness
- Progress tracking

### 🚧 Pending
- Icon generation
- Enhanced mobile UX
- Additional export formats
- Advanced analytics

---

**Note**: This is a client-side only application with no server dependencies. All data remains on the user's device.
