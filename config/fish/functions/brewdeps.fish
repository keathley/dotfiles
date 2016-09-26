function brewdeps
  brew list | \
  while read cask
    set_color blue
    echo -n  $cask
    set_color white
    brew deps $cask | awk '{printf(" %s ", $0)}'
    echo ""
  end
end

