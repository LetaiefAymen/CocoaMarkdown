# create folder where we place built frameworks
mkdir build
# build framework for simulators
xcodebuild clean build   -project CocoaMarkdown.xcodeproj   -scheme CocoaMarkdown-iOS   -configuration Release   -sdk iphonesimulator   -derivedDataPath derived_data
# create folder to store compiled framework for simulator
mkdir build/simulator
# copy compiled framework for simulator into our build folder
cp -r derived_data/Build/Products/Release-iphonesimulator/CocoaMarkdown.framework build/simulator
#build framework for devices
xcodebuild clean build   -project CocoaMarkdown.xcodeproj   -scheme CocoaMarkdown-iOS   -configuration Release   -sdk iphoneos   -derivedDataPath derived_data
# create folder to store compiled framework for simulator
mkdir build/devices
# copy compiled framework for simulator into our build folder
cp -r derived_data/Build/Products/Release-iphoneos/CocoaMarkdown.framework build/devices
# create folder to store compiled universal framework
mkdir build/universal
####################### Create universal framework #############################
# copy device framework into universal folder
cp -r build/devices/CocoaMarkdown.framework build/universal/
# create framework binary compatible with simulators and devices, and replace binary in unviersal framework
lipo -create   build/simulator/CocoaMarkdown.framework/CocoaMarkdown   build/devices/CocoaMarkdown.framework/CocoaMarkdown   -output build/universal/CocoaMarkdown.framework/CocoaMarkdown
# copy simulator Swift public interface to universal framework
cp build/simulator/CocoaMarkdown.framework/Modules/CocoaMarkdown.swiftmodule/* build/universal/CocoaMarkdown.framework/Modules/CocoaMarkdown.swiftmodule
