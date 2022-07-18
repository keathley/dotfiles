set GOPATH $HOME/go

set java_path /Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home/

if test -d $java_path
  export JAVA_HOME=$java_path
end

set PATH /opt/homebrew/bin \
         /opt/homebrew/sbin \
         ~/.local/bin \
         ./bin \
         ~/.bin \
         ~/bin \
         ~/zls \
         /usr/local/bin \
         /usr/local/sbin \
         ./node_modules/.bin \
         ~/.cargo/bin \
         $GOPATH \
         $GOPATH/bin \
         $PATH
