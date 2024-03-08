SCHEME=ios_core_swift
DESTINATION='platform=iOS Simulator,OS=17.2,name=iPhone 14 Pro'

xcodebuild build test -scheme "$SCHEME" -destination "$DESTINATION"
