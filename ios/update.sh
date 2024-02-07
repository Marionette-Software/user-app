rm Podfile.lock
rm -rf Pods
sudo arch -x86_64 gem install ffi
arch -x86_64 pod repo update
arch -x86_64 pod install