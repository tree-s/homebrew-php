require File.join(File.dirname(__FILE__), 'abstract-php')

class Php53 < AbstractPhp
  init
  url 'http://museum.php.net/php5/php-5.3.21.tar.bz2'
  sha1 'd67d2569b4782cf2faa049f22b08819ad8b15009'
  version '5.3.21'

  depends_on 'libevent' if build.include? 'with-fpm'

  def install_args
    super + [
      "--enable-zend-multibyte",
      "--enable-sqlite-utf8",
    ]
  end

  def php_version
    5.3
  end

  def php_version_path
    53
  end

  def patches
    DATA
  end 
end 

__END__
diff --git a/configure b/configure
index d506892..51617e8 100755
--- a/configure
+++ b/configure
@@ -38277,7 +38277,7 @@ fi
   if test "$PHP_FREETYPE_DIR" != "no"; then
 
     for i in $PHP_FREETYPE_DIR /usr/local /usr; do
-      if test -f "$i/include/freetype2/freetype/freetype.h"; then
+      if test -f "$i/include/freetype2/freetype.h"; then
         FREETYPE2_DIR=$i
         FREETYPE2_INC_DIR=$i/include/freetype2
         break

