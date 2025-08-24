#!/bin/bash

# MyTime Deployment Script
# Deploys MyTime PWA to web server or prepares for local hosting

echo "🚀 MyTime Deployment Script"
echo "=========================="

# Configuration
PROJECT_NAME="MyTime"
VERSION="1.0"
BUILD_DIR="dist"
REQUIRED_FILES=("mytime.html" "config.yaml" "manifest.json" "sw.js")

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if required files exist
check_files() {
    print_status "Checking required files..."
    
    for file in "${REQUIRED_FILES[@]}"; do
        if [ -f "$file" ]; then
            print_success "✓ $file found"
        else
            print_error "✗ $file missing"
            exit 1
        fi
    done
}

# Check if icons exist
check_icons() {
    print_status "Checking app icons..."
    
    icon_count=$(find icons/ -name "icon-*.png" 2>/dev/null | wc -l)
    
    if [ $icon_count -eq 0 ]; then
        print_warning "No app icons found - PWA will use browser defaults"
        print_warning "See icons/generate-icons.md for icon generation instructions"
    else
        print_success "✓ Found $icon_count app icons"
    fi
}

# Create distribution directory
create_dist() {
    print_status "Creating distribution directory..."
    
    if [ -d "$BUILD_DIR" ]; then
        rm -rf "$BUILD_DIR"
    fi
    
    mkdir -p "$BUILD_DIR"
    mkdir -p "$BUILD_DIR/icons"
    
    print_success "✓ Distribution directory created"
}

# Copy files to distribution
copy_files() {
    print_status "Copying files to distribution..."
    
    # Copy required files
    for file in "${REQUIRED_FILES[@]}"; do
        cp "$file" "$BUILD_DIR/"
        print_success "✓ Copied $file"
    done
    
    # Copy documentation
    cp README.md "$BUILD_DIR/" 2>/dev/null && print_success "✓ Copied README.md"
    cp INSTALL_ANDROID.md "$BUILD_DIR/" 2>/dev/null && print_success "✓ Copied INSTALL_ANDROID.md"
    
    # Copy icons if they exist
    if [ -d "icons" ] && [ "$(ls -A icons)" ]; then
        cp icons/* "$BUILD_DIR/icons/" 2>/dev/null
        icon_count=$(ls "$BUILD_DIR/icons/"*.png 2>/dev/null | wc -l)
        if [ $icon_count -gt 0 ]; then
            print_success "✓ Copied $icon_count icon files"
        fi
    fi
}

# Validate deployment
validate_deployment() {
    print_status "Validating deployment..."
    
    # Check file sizes
    html_size=$(stat -c%s "$BUILD_DIR/mytime.html" 2>/dev/null || stat -f%z "$BUILD_DIR/mytime.html" 2>/dev/null)
    if [ "$html_size" -gt 0 ]; then
        print_success "✓ Main application file valid (${html_size} bytes)"
    else
        print_error "✗ Main application file invalid"
        exit 1
    fi
    
    # Check manifest
    if grep -q "MyTime" "$BUILD_DIR/manifest.json"; then
        print_success "✓ PWA manifest valid"
    else
        print_warning "⚠ PWA manifest may have issues"
    fi
    
    # Check service worker
    if grep -q "CACHE_NAME" "$BUILD_DIR/sw.js"; then
        print_success "✓ Service worker valid"
    else
        print_warning "⚠ Service worker may have issues"
    fi
}

# Display deployment info
show_deployment_info() {
    echo ""
    echo "📦 Deployment Summary"
    echo "===================="
    echo "Project: $PROJECT_NAME v$VERSION"
    echo "Build directory: $BUILD_DIR/"
    echo ""
    echo "📁 Deployment Contents:"
    ls -la "$BUILD_DIR/" | grep -v "^total" | awk '{print "  " $9 " (" $5 " bytes)"}'
    echo ""
    echo "🌐 Deployment Options:"
    echo ""
    echo "1. Local Testing:"
    echo "   cd $BUILD_DIR && npx serve ."
    echo "   Then open: http://localhost:3000/mytime.html"
    echo ""
    echo "2. Web Server Deployment:"
    echo "   Upload contents of $BUILD_DIR/ to your web server"
    echo "   Ensure HTTPS for full PWA functionality"
    echo ""
    echo "3. GitHub Pages:"
    echo "   Push $BUILD_DIR/ contents to gh-pages branch"
    echo ""
    echo "📱 After deployment:"
    echo "   - Test PWA installation on mobile"
    echo "   - Verify offline functionality"
    echo "   - Check CSV export feature"
    echo ""
}

# Main deployment process
main() {
    echo "Starting deployment for $PROJECT_NAME v$VERSION..."
    echo ""
    
    check_files
    check_icons
    create_dist
    copy_files
    validate_deployment
    show_deployment_info
    
    print_success "🎉 Deployment completed successfully!"
    print_status "Ready for web hosting or local testing"
}

# Run deployment
main "$@"
