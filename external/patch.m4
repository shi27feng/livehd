diff -uw -r a/lib/fflush.c b/lib/fflush.c
--- a/lib/fflush.c	2016-12-31 05:54:41.000000000 -0800
+++ b/lib/fflush.c	2019-10-30 10:59:35.085850664 -0700
@@ -33,7 +33,7 @@
 #undef fflush
 
 
-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
 
 /* Clear the stream's ungetc buffer, preserving the value of ftello (fp).  */
 static void
@@ -72,7 +72,7 @@
 
 #endif
 
-#if ! (defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
+#if ! (defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
 
 # if (defined __sferror || defined __DragonFly__ || defined __ANDROID__) && defined __SNPT
 /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Android */
@@ -148,7 +148,7 @@
   if (stream == NULL || ! freading (stream))
     return fflush (stream);
 
-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
 
   clear_ungetc_buffer_preserving_position (stream);
 
diff -uw -r a/lib/fpending.c b/lib/fpending.c
--- a/lib/fpending.c	2016-12-31 05:54:41.000000000 -0800
+++ b/lib/fpending.c	2019-10-30 10:59:35.085850664 -0700
@@ -32,7 +32,7 @@
   /* Most systems provide FILE as a struct and the necessary bitmask in
      <stdio.h>, because they need it for implementing getc() and putc() as
      fast macros.  */
-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
   return fp->_IO_write_ptr - fp->_IO_write_base;
 #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Android */
diff -uw -r a/lib/fpurge.c b/lib/fpurge.c
--- a/lib/fpurge.c	2016-12-31 05:54:41.000000000 -0800
+++ b/lib/fpurge.c	2019-10-30 10:59:35.085850664 -0700
@@ -62,7 +62,7 @@
   /* Most systems provide FILE as a struct and the necessary bitmask in
      <stdio.h>, because they need it for implementing getc() and putc() as
      fast macros.  */
-# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
   fp->_IO_read_end = fp->_IO_read_ptr;
   fp->_IO_write_ptr = fp->_IO_write_base;
   /* Avoid memory leak when there is an active ungetc buffer.  */
diff -uw -r a/lib/freadahead.c b/lib/freadahead.c
--- a/lib/freadahead.c	2016-12-31 05:54:41.000000000 -0800
+++ b/lib/freadahead.c	2019-10-30 10:59:35.085850664 -0700
@@ -25,7 +25,7 @@
 size_t
 freadahead (FILE *fp)
 {
-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
   if (fp->_IO_write_ptr > fp->_IO_write_base)
     return 0;
   return (fp->_IO_read_end - fp->_IO_read_ptr)
diff -uw -r a/lib/freading.c b/lib/freading.c
--- a/lib/freading.c	2016-12-31 05:54:41.000000000 -0800
+++ b/lib/freading.c	2019-10-30 10:59:35.085850664 -0700
@@ -31,7 +31,7 @@
   /* Most systems provide FILE as a struct and the necessary bitmask in
      <stdio.h>, because they need it for implementing getc() and putc() as
      fast macros.  */
-# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
   return ((fp->_flags & _IO_NO_WRITES) != 0
           || ((fp->_flags & (_IO_NO_READS | _IO_CURRENTLY_PUTTING)) == 0
               && fp->_IO_read_base != NULL));
diff -uw -r a/lib/fseeko.c b/lib/fseeko.c
--- a/lib/fseeko.c	2016-12-31 05:54:41.000000000 -0800
+++ b/lib/fseeko.c	2019-10-30 10:59:35.085850664 -0700
@@ -47,7 +47,7 @@
 #endif
 
   /* These tests are based on fpurge.c.  */
-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
   if (fp->_IO_read_end == fp->_IO_read_ptr
       && fp->_IO_write_ptr == fp->_IO_write_base
       && fp->_IO_save_base == NULL)
@@ -123,7 +123,7 @@
           return -1;
         }
 
-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
       fp->_flags &= ~_IO_EOF_SEEN;
       fp->_offset = pos;
 #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
diff -uw -r a/lib/stdio-impl.h b/lib/stdio-impl.h
--- a/lib/stdio-impl.h	2016-12-31 05:54:42.000000000 -0800
+++ b/lib/stdio-impl.h	2019-10-30 10:59:35.085850664 -0700
@@ -18,6 +18,12 @@
    the same implementation of stdio extension API, except that some fields
    have different naming conventions, or their access requires some casts.  */
 
+/* Glibc 2.28 made _IO_IN_BACKUP private.  For now, work around this
+   problem by defining it ourselves.  FIXME: Do not rely on glibc
+   internals.  */
+#if !defined _IO_IN_BACKUP && defined _IO_EOF_SEEN
+# define _IO_IN_BACKUP 0x100
+#endif
 
 /* BSD stdio derived implementations.  */
 
