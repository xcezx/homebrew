require 'formula'

class Canything < Formula
  homepage 'http://filmlang.org/soft/canything'
  url 'https://github.com/keiji0/canything/archive/0.1.zip'
  sha1 'faf023090a830f2ebe418e26471976ee6bfc8415'
  head 'https://github.com/keiji0/canything.git'

  def install
    system 'make'
    bin.install 'canything'
  end
end
