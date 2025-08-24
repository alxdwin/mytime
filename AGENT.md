# MyTime Development Configuration

## 🛠️ Development Environment

### Quick Commands
```bash
# Serve locally for PWA testing
npx serve .

# Alternative local server
python -m http.server 8000

# Test in browser
# Open: http://localhost:8000/mytime.html
```

## 📁 Project Structure

```
MyTime/
├── mytime.html              # Main application (single-file SPA)
├── config.yaml              # Category definitions and settings  
├── manifest.json            # PWA manifest
├── sw.js                    # Service worker
├── README.md                # Documentation
├── INSTALL_ANDROID.md       # Installation guide
├── AGENT.md                 # This file
├── icons/                   # App icons directory
│   └── generate-icons.md    # Icon generation guide
└── package.json             # Build dependencies
```

## 🏗️ Architecture

### Single File Application
- **mytime.html**: Complete self-contained SPA
- All CSS and JavaScript embedded inline
- No external dependencies or build process
- Vanilla JavaScript ES6+ features

### Data Flow
1. **Config Loading**: YAML config parsed client-side
2. **Timer Management**: JavaScript class-based architecture
3. **Data Persistence**: Browser localStorage
4. **Export**: Client-side CSV generation

### Key Components
- `MyTimeApp` class: Main application controller
- Category/subcategory system: Hierarchical time tracking
- Progress tracking: Visual daily progress indicators
- Export system: Google Calendar compatible CSV

## 🔧 Configuration

### Categories (config.yaml)
```yaml
categories:
  - name: "Category Name"
    color: "#hexcolor"
    icon: "🚀"
    target_minutes: 240
    subcategories:
      - "Subcategory 1"
      - "Subcategory 2"
```

### App Settings
- `minimum_session_minutes`: Minimum trackable session duration
- Category targets: Daily time goals per category
- Color themes: Hex colors for visual identification

## 🧪 Testing

### Browser Testing
```bash
# Chrome DevTools
F12 → Application → Service Workers
F12 → Application → Local Storage

# Firefox
F12 → Storage → Local Storage
F12 → Application → Service Workers
```

### PWA Testing
```bash
# Lighthouse audit
F12 → Lighthouse → Progressive Web App

# Manual PWA checks
- Manifest validation
- Service worker registration
- Offline functionality
- Add to homescreen capability
```

### Mobile Testing
- Chrome DevTools device emulation
- Real device testing recommended
- Test touch interactions and responsiveness

## 🚨 Known Issues

### Red Categories Visual Bug
- Some categories may display with red styling
- Root cause: CSS specificity or color inheritance
- **Fix needed**: Review CSS cascade rules

### Icon Dependencies
- App icons not yet generated
- PWA installation works but uses browser defaults
- **Fix needed**: Generate icon set using tools

### Pause/Resume Edge Cases
- Long pause durations may need testing
- Browser sleep/wake cycle handling
- **Testing needed**: Extended session scenarios

## 📊 Performance Considerations

### Bundle Size
- Single HTML file: ~50KB
- No external dependencies
- Minimal resource usage

### Memory Usage
- Lightweight vanilla JavaScript
- localStorage for data persistence
- Efficient timer implementation

### Network
- Offline-first design
- Service worker caching
- No external API calls

## 🔒 Security Notes

### Data Privacy
- All data stored locally
- No server communication
- No user authentication required
- GDPR compliant (no data collection)

### Safe Practices
- Input sanitization for category names
- localStorage quota management
- Error handling for storage failures

## 🛠️ Maintenance Tasks

### Regular Updates
- [ ] Update version in manifest.json
- [ ] Clear service worker cache on major updates
- [ ] Test cross-browser compatibility
- [ ] Validate YAML config structure

### Icon Generation
- [ ] Create base icon design
- [ ] Generate all required sizes (72x72 to 512x512)
- [ ] Update manifest.json paths
- [ ] Test icon loading

### Code Quality
- [ ] Add error boundaries
- [ ] Improve accessibility
- [ ] Optimize mobile performance
- [ ] Add keyboard shortcuts

## 📝 Development Workflow

### Making Changes
1. Edit `mytime.html` for app functionality
2. Update `config.yaml` for categories
3. Test locally with `npx serve .`
4. Update version in manifest.json
5. Test PWA installation

### Deployment
1. Upload all files to web server
2. Ensure HTTPS for production PWA
3. Test installation on mobile devices
4. Verify offline functionality

### Debugging
- Use browser developer tools
- Check console for JavaScript errors
- Validate service worker registration
- Test localStorage data persistence

---

## 🎯 Next Development Priorities

1. **Fix visual issues** with red category styling
2. **Generate app icons** for proper PWA experience  
3. **Enhanced mobile UX** with better touch interactions
4. **Advanced analytics** and reporting features
5. **Multi-week export** capabilities

This configuration ensures consistent development practices and helps new contributors understand the project structure.
