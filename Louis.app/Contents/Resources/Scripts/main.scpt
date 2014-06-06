FasdUAS 1.101.10   ��   ��    k             l     ��������  ��  ��        l      �� 	 
��   		�	� Nik's generic URI handling scriptlet

This script snippet has a script object that handles any URI/URL using the "open location" Applescript handler. This allows custom URI schemes to activate this script. It's a great way to fire off AppleScripts from web browsers that don't have script support or from shell scripts. If it can make a URL, it can run the applet.

This script takes a URL in the format of "theURI://theMethod?Arg1&Arg2&...ArgN". It handles the parsing of the individual URL arguments and the method, and generates an object containing the results as easy-to-access properties.

The "open location" handler is deliberately simplified to just generate the URL object -- nothing more. From there you can refer to the object to get specific properties, e.g. "get description of myURLObject's args" to get the "description" argument out of the original URL.

There is no built-in validation, so you'll have to manage that after parsing the initial URL.

For this script to work, you must save it as an Application Bundle, and edit the enclosed plist as follows (copied from Apple's website):

-----------

When you save the script as an application bundle, it will contain the standard Mac OS X bundle elements including an XML property list file defining important aspects of the script application.

To access the Info.plist property list, click on the script application with the Control key held down to access the Finder Contextual Menu. Choose Show Package Contents from this menu to open the script application bundle in a new window. Open the Contents folder within the new window to reveal the Info.plist file. Open this file in a text or property list editor and add the following XML keys and values to the property list.

To identify the Application, add the following lines to the property list, replacing the net.mysite.appname text shown here with a unique bundle identifier for your application:

<key>CFBundleIdentifier</key>
<string>net.mysite.appname</string>

To identify the URL handler that triggers the applet, add the following item to the property list, replacing the App Name and theURI text with title of your URL protocol and the URL scheme of your protocol:

<key>CFBundleURLTypes</key>
<array>
	<dict>
		<key>CFBundleURLName</key>
		<string>App Name</string>
		<key>CFBundleURLSchemes</key>
		<array>
			<string>theURI</string>
		</array>
	</dict>
</array>

-----------

You can find documentation on how this works on Apple's website:

http://www.apple.com/applescript/linktrigger/index.html

    
 �  �   N i k ' s   g e n e r i c   U R I   h a n d l i n g   s c r i p t l e t 
 
 T h i s   s c r i p t   s n i p p e t   h a s   a   s c r i p t   o b j e c t   t h a t   h a n d l e s   a n y   U R I / U R L   u s i n g   t h e   " o p e n   l o c a t i o n "   A p p l e s c r i p t   h a n d l e r .   T h i s   a l l o w s   c u s t o m   U R I   s c h e m e s   t o   a c t i v a t e   t h i s   s c r i p t .   I t ' s   a   g r e a t   w a y   t o   f i r e   o f f   A p p l e S c r i p t s   f r o m   w e b   b r o w s e r s   t h a t   d o n ' t   h a v e   s c r i p t   s u p p o r t   o r   f r o m   s h e l l   s c r i p t s .   I f   i t   c a n   m a k e   a   U R L ,   i t   c a n   r u n   t h e   a p p l e t . 
 
 T h i s   s c r i p t   t a k e s   a   U R L   i n   t h e   f o r m a t   o f   " t h e U R I : / / t h e M e t h o d ? A r g 1 & A r g 2 & . . . A r g N " .   I t   h a n d l e s   t h e   p a r s i n g   o f   t h e   i n d i v i d u a l   U R L   a r g u m e n t s   a n d   t h e   m e t h o d ,   a n d   g e n e r a t e s   a n   o b j e c t   c o n t a i n i n g   t h e   r e s u l t s   a s   e a s y - t o - a c c e s s   p r o p e r t i e s . 
 
 T h e   " o p e n   l o c a t i o n "   h a n d l e r   i s   d e l i b e r a t e l y   s i m p l i f i e d   t o   j u s t   g e n e r a t e   t h e   U R L   o b j e c t   - -   n o t h i n g   m o r e .   F r o m   t h e r e   y o u   c a n   r e f e r   t o   t h e   o b j e c t   t o   g e t   s p e c i f i c   p r o p e r t i e s ,   e . g .   " g e t   d e s c r i p t i o n   o f   m y U R L O b j e c t ' s   a r g s "   t o   g e t   t h e   " d e s c r i p t i o n "   a r g u m e n t   o u t   o f   t h e   o r i g i n a l   U R L . 
 
 T h e r e   i s   n o   b u i l t - i n   v a l i d a t i o n ,   s o   y o u ' l l   h a v e   t o   m a n a g e   t h a t   a f t e r   p a r s i n g   t h e   i n i t i a l   U R L . 
 
 F o r   t h i s   s c r i p t   t o   w o r k ,   y o u   m u s t   s a v e   i t   a s   a n   A p p l i c a t i o n   B u n d l e ,   a n d   e d i t   t h e   e n c l o s e d   p l i s t   a s   f o l l o w s   ( c o p i e d   f r o m   A p p l e ' s   w e b s i t e ) : 
 
 - - - - - - - - - - - 
 
 W h e n   y o u   s a v e   t h e   s c r i p t   a s   a n   a p p l i c a t i o n   b u n d l e ,   i t   w i l l   c o n t a i n   t h e   s t a n d a r d   M a c   O S   X   b u n d l e   e l e m e n t s   i n c l u d i n g   a n   X M L   p r o p e r t y   l i s t   f i l e   d e f i n i n g   i m p o r t a n t   a s p e c t s   o f   t h e   s c r i p t   a p p l i c a t i o n . 
 
 T o   a c c e s s   t h e   I n f o . p l i s t   p r o p e r t y   l i s t ,   c l i c k   o n   t h e   s c r i p t   a p p l i c a t i o n   w i t h   t h e   C o n t r o l   k e y   h e l d   d o w n   t o   a c c e s s   t h e   F i n d e r   C o n t e x t u a l   M e n u .   C h o o s e   S h o w   P a c k a g e   C o n t e n t s   f r o m   t h i s   m e n u   t o   o p e n   t h e   s c r i p t   a p p l i c a t i o n   b u n d l e   i n   a   n e w   w i n d o w .   O p e n   t h e   C o n t e n t s   f o l d e r   w i t h i n   t h e   n e w   w i n d o w   t o   r e v e a l   t h e   I n f o . p l i s t   f i l e .   O p e n   t h i s   f i l e   i n   a   t e x t   o r   p r o p e r t y   l i s t   e d i t o r   a n d   a d d   t h e   f o l l o w i n g   X M L   k e y s   a n d   v a l u e s   t o   t h e   p r o p e r t y   l i s t . 
 
 T o   i d e n t i f y   t h e   A p p l i c a t i o n ,   a d d   t h e   f o l l o w i n g   l i n e s   t o   t h e   p r o p e r t y   l i s t ,   r e p l a c i n g   t h e   n e t . m y s i t e . a p p n a m e   t e x t   s h o w n   h e r e   w i t h   a   u n i q u e   b u n d l e   i d e n t i f i e r   f o r   y o u r   a p p l i c a t i o n : 
 
 < k e y > C F B u n d l e I d e n t i f i e r < / k e y > 
 < s t r i n g > n e t . m y s i t e . a p p n a m e < / s t r i n g > 
 
 T o   i d e n t i f y   t h e   U R L   h a n d l e r   t h a t   t r i g g e r s   t h e   a p p l e t ,   a d d   t h e   f o l l o w i n g   i t e m   t o   t h e   p r o p e r t y   l i s t ,   r e p l a c i n g   t h e   A p p   N a m e   a n d   t h e U R I   t e x t   w i t h   t i t l e   o f   y o u r   U R L   p r o t o c o l   a n d   t h e   U R L   s c h e m e   o f   y o u r   p r o t o c o l : 
 
 < k e y > C F B u n d l e U R L T y p e s < / k e y > 
 < a r r a y > 
 	 < d i c t > 
 	 	 < k e y > C F B u n d l e U R L N a m e < / k e y > 
 	 	 < s t r i n g > A p p   N a m e < / s t r i n g > 
 	 	 < k e y > C F B u n d l e U R L S c h e m e s < / k e y > 
 	 	 < a r r a y > 
 	 	 	 < s t r i n g > t h e U R I < / s t r i n g > 
 	 	 < / a r r a y > 
 	 < / d i c t > 
 < / a r r a y > 
 
 - - - - - - - - - - - 
 
 Y o u   c a n   f i n d   d o c u m e n t a t i o n   o n   h o w   t h i s   w o r k s   o n   A p p l e ' s   w e b s i t e : 
 
 h t t p : / / w w w . a p p l e . c o m / a p p l e s c r i p t / l i n k t r i g g e r / i n d e x . h t m l 
 
      l     ��������  ��  ��        l     ��  ��      Test it here     �      T e s t   i t   h e r e      l     ��������  ��  ��        i         I     ������
�� .aevtoappnull  �   � ****��  ��    k            r         I    �� ��
�� .sysorpthalis        TEXT  m        �      l o u i s . h t m l��    o      ���� 0 x     ! " ! O    # $ # I   ������
�� .miscactvnull��� ��� null��  ��   $ m    	 % %�                                                                                  sfri  alis    N  Macintosh HD               Ε�H+   \x
Safari.app                                                      }n͜,r        ����  	                Applications    Εo^      ͜��     \x  %Macintosh HD:Applications: Safari.app    
 S a f a r i . a p p    M a c i n t o s h   H D  Applications/Safari.app   / ��   "  &�� & O    ' ( ' I   �� )��
�� .aevtodocnull  �    alis ) o    ���� 0 x  ��   ( m     * *�                                                                                  sfri  alis    N  Macintosh HD               Ε�H+   \x
Safari.app                                                      }n͜,r        ����  	                Applications    Εo^      ͜��     \x  %Macintosh HD:Applications: Safari.app    
 S a f a r i . a p p    M a c i n t o s h   H D  Applications/Safari.app   / ��  ��     + , + l     ��������  ��  ��   ,  - . - i     / 0 / I     �� 1��
�� .GURLGURLnull��� ��� TEXT 1 o      ���� 0 surl sURL��   0 k      2 2  3 4 3 r      5 6 5 I     �� 7���� 0 newuri newURI 7  8�� 8 o    ���� 0 surl sURL��  ��   6 o      ���� 0 myurlobject myURLObject 4  9�� 9 I   	 �� :���� 0 writebraille writeBraille :  ;�� ; o   
 ���� 0 myurlobject myURLObject��  ��  ��   .  < = < l     ��������  ��  ��   =  > ? > i     @ A @ I      �� B���� 0 writebraille writeBraille B  C�� C o      ���� 0 myurlobject myURLObject��  ��   A k    e D D  E F E l     ��������  ��  ��   F  G H G r      I J I l     K���� K I    �� L��
�� .earsffdralis        afdr L  f     ��  ��  ��   J l      M���� M o      ���� 0 homepath  ��  ��   H  N O N r     P Q P b     R S R n     T U T 1   	 ��
�� 
psxp U o    	���� 0 homepath   S m     V V � W W � C o n t e n t s / R e s o u r c e s / B r a i l l e B l a s t e r / p r o g r a m D a t a / l i b l o u i s u t d m l / l b u _ f i l e s / t m p . c f g Q l      X���� X o      ���� 0 cfgfile  ��  ��   O  Y Z Y l   ��������  ��  ��   Z  [ \ [ l   �� ] ^��   ] % set myURLObject to newURI(sURL)    ^ � _ _ > s e t   m y U R L O b j e c t   t o   n e w U R I ( s U R L ) \  ` a ` r     b c b c     d e d b     f g f m     h h � i i $ l i t e r a r y T e x t T a b l e   g n     j k j o    ���� 0 code   k n     l m l o    ���� 0 args   m o    ���� 0 myurlobject myURLObject e m    ��
�� 
ctxt c o      ���� 0 thetable theTable a  n o n r    ' p q p c    % r s r b    # t u t m     v v � w w  c e l l s P e r L i n e   u n    " x y x o     "���� 	0 cells   y n      z { z o     ���� 0 args   { o    ���� 0 myurlobject myURLObject s m   # $��
�� 
ctxt q o      ���� 0 cpl   o  | } | r   ( 3 ~  ~ c   ( 1 � � � b   ( / � � � m   ( ) � � � � �  l i n e s P e r P a g e   � n   ) . � � � o   , .���� 0 rows   � n   ) , � � � o   * ,���� 0 args   � o   ) *���� 0 myurlobject myURLObject � m   / 0��
�� 
ctxt  o      ���� 0 lpp   }  � � � r   4 ; � � � n   4 9 � � � o   7 9���� 0 
interpoint   � n   4 7 � � � o   5 7���� 0 args   � o   4 5���� 0 myurlobject myURLObject � o      ���� 0 
interpoint   �  � � � Z   < K � ��� � � =  < ? � � � o   < =���� 0 
interpoint   � m   = > � � � � �  o n � r   B E � � � m   B C � � � � �  i n t e r p o i n t   y e s � o      ���� 0 intp  ��   � r   H K � � � m   H I � � � � �  i n t e r p o i n t   n o � o      ���� 0 intp   �  � � � r   L Y � � � c   L W � � � b   L U � � � m   L M � � � � �  p r i n t P a g e s   � n   M T � � � o   P T���� 0 
printpages 
printPages � n   M P � � � o   N P���� 0 args   � o   M N���� 0 myurlobject myURLObject � m   U V��
�� 
ctxt � o      ���� 0 
printpages 
printPages �  � � � r   Z i � � � c   Z g � � � b   Z e � � � m   Z ] � � � � � $ p r i n t P a g e N u m b e r A t   � n   ] d � � � o   ` d���� &0 printpagenumberat printPageNumberAt � n   ] ` � � � o   ^ `���� 0 args   � o   ] ^���� 0 myurlobject myURLObject � m   e f��
�� 
ctxt � o      ���� &0 printpagenumberat printPageNumberAt �  � � � r   j y � � � c   j w � � � b   j u � � � m   j m � � � � �  b r a i l l e P a g e s   � n   m t � � � o   p t���� 0 braillepages braillePages � n   m p � � � o   n p���� 0 args   � o   m n���� 0 myurlobject myURLObject � m   u v��
�� 
ctxt � o      ���� 0 braillepages braillePages �  � � � r   z � � � � c   z � � � � b   z � � � � m   z } � � � � � ( b r a i l l e P a g e N u m b e r A t   � n   } � � � � o   � ����� *0 braillepagenumberat braillePageNumberAt � n   } � � � � o   ~ ����� 0 args   � o   } ~���� 0 myurlobject myURLObject � m   � ���
�� 
ctxt � o      ���� *0 braillepagenumberat braillePageNumberAt �  � � � l  � ���������  ��  ��   �  � � � r   � � � � � m   � � � � � � �  #   T h i s   f i l e   c o n t a i n s   a l l   p o s s i b l e   c o n f i g u r a t i o n   s e t t i n g s ,   w i t h   s a m p l e   
 #   v a l u e s ,   w h e r e   a p p r o p r i a t e .   I t     i s   u s e d   b y   t h e   f i l e 2 b r l   c o m m a n d - l i n e   
 #   i n t e r f a c e   i f   n o   c o n f i g u r a t i o n   f i l e   i s   g i v e n .   I t   i s   a l s o   p a r t   o f   t h e   
 #   d o c u m e n t a t i o n . 
 
 o u t p u t F o r m a t 
 	 i n t e r p o i n t   n o 
 	 e m p h a s i s   a l l 
 	 
 
 t r a n s l a t i o n 
 	 c o m p b r l T a b l e   e n - u s - c o m p 8 . c t b 
 	 m a t h t e x t T a b l e   e n - u s - g 2 . c t b 
 	 m a t h e x p r T a b l e   n e m e t h . c t b 
 	 e d i t T a b l e   n e m e t h _ e d i t . c t b 
 	 � o      ���� 0 thecfg theCfg �  � � � l  � ���������  ��  ��   �  � � � l  � ���������  ��  ��   �  � � � r   � � � � � b   � � � � � l  � � ����� � I  � ��� ���
�� .sysontocTEXT       shor � m   � ����� ��  ��  ��   � l  � � ����� � I  � ��� ��
�� .sysontocTEXT       shor � m   � ��~�~ 
�  ��  ��   � o      �}�} 0 crlf   �  � � � r   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � �  � b   � � b   � � b   � � b   � � b   � �	
	 b   � � b   � � b   � � b   � � b   � � o   � ��|�| 0 thecfg theCfg o   � ��{�{ 0 crlf   o   � ��z�z 0 thetable theTable o   � ��y�y 0 crlf   o   � ��x�x 0 cpl   o   � ��w�w 0 crlf  
 o   � ��v�v 0 lpp   o   � ��u�u 0 crlf   o   � ��t�t 0 intp   o   � ��s�s 0 crlf   o   � ��r�r 0 
printpages 
printPages  o   � ��q�q 0 crlf   � o   � ��p�p &0 printpagenumberat printPageNumberAt � o   � ��o�o 0 crlf   � o   � ��n�n 0 braillepages braillePages � o   � ��m�m 0 crlf   � o   � ��l�l *0 braillepagenumberat braillePageNumberAt � o      �k�k 0 thecfg theCfg �  r   � � I  � ��j�i
�j .sysoexecTEXT���     TEXT b   � � b   � � b   � � m   � �   �!! 
 e c h o   l  � �"�h�g" n   � �#$# 1   � ��f
�f 
strq$ o   � ��e�e 0 thecfg theCfg�h  �g   m   � �%% �&&    >   l  � �'�d�c' n   � �()( 1   � ��b
�b 
strq) o   � ��a�a 0 cfgfile  �d  �c  �i   o      �`�` 0 x   *+* r   �,-, I  ��_�^.
�_ .sysostdfalis    ��� null�^  . �]/0
�] 
prmp/ m   � �11 �22 L S e l e c t   f i l e   t o   t r a n s l a t e   i n t o   B r a i l l e :0 �\3�[
�\ 
ftyp3 J   �	44 565 m   � �77 �88  p u b l i c . h t m l6 9:9 m   � �;; �<<  p u b l i c . r t f: =>= m   � �?? �@@ " p u b l i c . p l a i n - t e x t> ABA m   � �CC �DD  p u b l i c . d o c .B EFE m   � �GG �HH @ o r g . o a s i s - o p e n . o p e n d o c u m e n t . t e x tF IJI m   � �KK �LL , c o m . m i c r o s o f t . w o r d . d o cJ MNM m   � �OO �PP  p u b l i c . x m lN QRQ m   �SS �TT X o r g . o p e n x m l f o r m a t s . w o r d p r o c e s s i n g m l . d o c u m e n tR U�ZU m  VV �WW  c o m . a p p l e . r t f d�Z  �[  - o      �Y�Y 0 afile aFile+ XYX l �X�W�V�X  �W  �V  Y Z[Z r  \]\ n  ^_^ 1  �U
�U 
psxp_ o  �T�T 0 afile aFile] o      �S�S 0 afile aFile[ `a` l �R�Q�P�R  �Q  �P  a bcb I !�Od�N
�O .sysoexecTEXT���     TEXTd b  efe m  gg �hh � t e x t u t i l   - c o n v e r t   h t m l   - n o s t o r e   - n o l o a d   - s t r i p   - o u t p u t   / t m p / b r a i l l e . h t m l  f o  �M�M 0 afile aFile�N  c iji r  "9klk I "5�L�Km
�L .sysonwflfile    ��� null�K  m �Jno
�J 
prmtn m  &)pp �qq * S a v e   B r a i l l e   f i l e   a s :o �Ir�H
�I 
dfnmr m  ,/ss �tt  b r a i l l e . b r f�H  l o      �G�G 0 brf  j uvu r  :Cwxw l :?y�F�Ey n  :?z{z 1  =?�D
�D 
psxp{ o  :=�C�C 0 brf  �F  �E  x o      �B�B 0 brf_file  v |}| r  DO~~ l DK��A�@� n  DK��� 1  GK�?
�? 
strq� o  DG�>�> 0 brf_file  �A  �@   o      �=�= 0 brf_file  } ��� l PP�<�;�:�<  �;  �:  � ��� I Pc�9��8
�9 .sysoexecTEXT���     TEXT� b  P_��� b  P[��� b  PW��� m  PS�� ���  j a v a   - j a r  � n  SV��� 1  TV�7
�7 
psxp� o  ST�6�6 0 homepath  � m  WZ�� ��� � C o n t e n t s / R e s o u r c e s / B r a i l l e B l a s t e r / B r a i l l e B l a s t e r . j a r   - n o g u i   t r a n s l a t e   - f   t m p . c f g   - t     / t m p / b r a i l l e . h t m l  � o  [^�5�5 0 brf_file  �8  � ��4� l dd�3�2�1�3  �2  �1  �4   ? ��� l     �0�/�.�0  �/  �.  � ��� l      �-���-  � � � newURI(): URI Object Initialization Script

	This returns a URL script object, containing properties for the URL scheme, location, and arguments, as passed through an HTML-encoded URL.    � ���t   n e w U R I ( ) :   U R I   O b j e c t   I n i t i a l i z a t i o n   S c r i p t 
 
 	 T h i s   r e t u r n s   a   U R L   s c r i p t   o b j e c t ,   c o n t a i n i n g   p r o p e r t i e s   f o r   t h e   U R L   s c h e m e ,   l o c a t i o n ,   a n d   a r g u m e n t s ,   a s   p a s s e d   t h r o u g h   a n   H T M L - e n c o d e d   U R L .  � ��� l     �,�+�*�,  �+  �*  � ��)� i    ��� I      �(��'�( 0 newuri newURI� ��&� o      �%�% 0 u  �&  �'  � k     �� ��� h     �$��$ 0 	uriobject 	uriObject� k      �� ��� l     �#�"�!�#  �"  �!  � ��� j     � ��  0 rawurl rawURL� m     �
� 
msng� ��� j    ��
� 
pusc� m    �
� 
msng� ��� j    ��� 0 location  � m    �
� 
msng� ��� j   	 ��� 0 args  � J   	 ��  � ��� l     ����  �  �  � ��� l      ����  � � � initialize()		
		This handler initializes the URL object, breaking it out into its constituent parts, and assigns them to the various script object properties. It will also replace and overwrite any existing URL properties on the script object    � ����   i n i t i a l i z e ( ) 	 	 
 	 	 T h i s   h a n d l e r   i n i t i a l i z e s   t h e   U R L   o b j e c t ,   b r e a k i n g   i t   o u t   i n t o   i t s   c o n s t i t u e n t   p a r t s ,   a n d   a s s i g n s   t h e m   t o   t h e   v a r i o u s   s c r i p t   o b j e c t   p r o p e r t i e s .   I t   w i l l   a l s o   r e p l a c e   a n d   o v e r w r i t e   a n y   e x i s t i n g   U R L   p r o p e r t i e s   o n   t h e   s c r i p t   o b j e c t  � ��� l     ����  �  �  � ��� i    ��� I      ���� 0 
initialize  � ��� o      �� 0 aurl aURL�  �  � Q     ����� k    l�� ��� l   ����  �  �  � ��� r    
��� o    �
�
 0 aurl aURL� o      �	�	 0 u  � ��� l   ����  � 4 . Break out the URL into its various components   � ��� \   B r e a k   o u t   t h e   U R L   i n t o   i t s   v a r i o u s   c o m p o n e n t s� ��� r    ��� I    ���� 0 spliturl splitURL� ��� o    �� 0 aurl aURL�  �  � o      �� 0 thespliturl theSplitURL� ��� I   ���
� .ascrcmnt****      � ****� 1    � 
�  
rslt�  � ��� l   ������  � % Get the URI-Scheme from the URI   � ��� > G e t   t h e   U R I - S c h e m e   f r o m   t h e   U R I� ��� r    "��� n    ��� 4    ���
�� 
cobj� m    ���� � o    ���� 0 thespliturl theSplitURL� 1    !��
�� 
pusc� ��� l  # #������  � $  Get the location from the URI   � ��� <   G e t   t h e   l o c a t i o n   f r o m   t h e   U R I� ��� r   # 2��� l  # ,������ I   # ,������� 0 decode_text  � ���� n   $ (��� 4   % (���
�� 
cobj� m   & '���� � o   $ %���� 0 thespliturl theSplitURL��  ��  ��  ��  � o      ���� 0 location  � ��� l  3 3��������  ��  ��  � ��� l  3 3������  �   parse arguments   � ���     p a r s e   a r g u m e n t s� � � Z   3 O���� >  3 9 n   3 7 4   4 7��
�� 
cobj m   5 6����  o   3 4���� 0 thespliturl theSplitURL m   7 8��
�� 
msng r   < K	 I   < E��
���� 0 argstorecord argsToRecord
 �� n   = A 4   > A��
�� 
cobj m   ? @����  o   = >���� 0 thespliturl theSplitURL��  ��  	 o      ���� 0 args  ��  ��     l  P P��������  ��  ��    l  P P����   V P All went well, let's reset our text item delimiters and send back the arguments    � �   A l l   w e n t   w e l l ,   l e t ' s   r e s e t   o u r   t e x t   i t e m   d e l i m i t e r s   a n d   s e n d   b a c k   t h e   a r g u m e n t s  r   P U m   P Q �   n      1   R T��
�� 
txdl 1   Q R��
�� 
ascr  L   V j   K   V i!! ��"#
�� 
pusc" 1   W [��
�� 
pusc# ��$%�� 0 location  $ o   \ a���� 0 location  % ��&���� 0 args  & o   b g���� 0 args  ��   '��' l  k k��������  ��  ��  ��  � R      ��()
�� .ascrerr ****      � ****( o      ���� 0 errmsg errMsg) ��*��
�� 
errn* o      ���� 0 errnum errNum��  � k   t �++ ,-, I  t ���.��
�� .sysodisAaleR        TEXT. b   t /0/ b   t {121 b   t y343 o   t u���� 0 errmsg errMsg4 m   u x55 �66    (2 o   y z���� 0 errnum errNum0 m   { ~77 �88  )��  - 9��9 R   � �����:
�� .ascrerr ****      � ****��  : ��;��
�� 
errn; m   � ���������  ��  � <=< l     ��������  ��  ��  = >?> l     ��������  ��  ��  ? @A@ l     ��������  ��  ��  A BCB l      ��DE��  D ' ! Convert a URL into a record set    E �FF B   C o n v e r t   a   U R L   i n t o   a   r e c o r d   s e t  C GHG i    IJI I      ��K���� 0 spliturl splitURLK L��L o      ���� 0 theurl theURL��  ��  J k     �MM NON r     PQP J     ����  Q o      ���� 0 theargs theArgsO RSR r    
TUT m    VV �WW  :U 1    	��
�� 
txdlS XYX r    Z[Z n    \]\ 4    ��^
�� 
citm^ m    ���� ] o    ���� 0 theurl theURL[ o      ���� 0 theuri theURIY _`_ r    aba m    cc �dd  b 1    ��
�� 
txdl` efe l   #ghig r    #jkj [    !lml l   n����n I   ��o��
�� .corecnte****       ****o n    pqp 2   ��
�� 
cha q o    ���� 0 theuri theURI��  ��  ��  m m     ���� k o      ���� 0 urin uriNh   account for the ":"   i �rr (   a c c o u n t   f o r   t h e   " : "f sts l  $ $��uv��  u ) # Get rid of the url protocol string   v �ww F   G e t   r i d   o f   t h e   u r l   p r o t o c o l   s t r i n gt xyx l  $ $��������  ��  ��  y z{z l  $ 1|}~| r   $ 1� I  $ /�����
�� .sysooffslong    ��� null��  � ����
�� 
psof� l  & )������ b   & )��� o   & '���� 0 theuri theURI� m   ' (�� ���  : / /��  ��  � �����
�� 
psin� o   * +���� 0 theurl theURL��  � o      ���� 0 pn pN}   is it a mailto:// style?   ~ ��� 2   i s   i t   a   m a i l t o : / /   s t y l e ?{ ��� l  2 2��������  ��  ��  � ��� Z   2 e������ ?   2 5��� o   2 3���� 0 pn pN� m   3 4����  � l  8 M���� r   8 M��� n   8 K��� 7 9 K����
�� 
ctxt� l  = A������ [   = A��� o   > ?���� 0 urin uriN� m   ? @���� ��  ��  � l  B J������ I  B J�����
�� .corecnte****       ****� n   C F��� 2  D F��
�� 
cha � o   C D���� 0 theurl theURL��  ��  ��  � o   8 9���� 0 theurl theURL� o      ���� 0 theurl theURL�   a URI:// url   � ���    a   U R I : / /   u r l��  � l  P e���� r   P e��� n   P c��� 7 Q c����
�� 
ctxt� l  U Y���~� [   U Y��� o   V W�}�} 0 urin uriN� m   W X�|�| �  �~  � l  Z b��{�z� I  Z b�y��x
�y .corecnte****       ****� n   [ ^��� 2  \ ^�w
�w 
cha � o   [ \�v�v 0 theurl theURL�x  �{  �z  � o   P Q�u�u 0 theurl theURL� o      �t�t 0 theurl theURL�   or just a URI: url   � ��� &   o r   j u s t   a   U R I :   u r l� ��� l  f f�s�r�q�s  �r  �q  � ��� l  f f�p���p  � L F See if there's any arguments being passed, pass 'em back if there are   � ��� �   S e e   i f   t h e r e ' s   a n y   a r g u m e n t s   b e i n g   p a s s e d ,   p a s s   ' e m   b a c k   i f   t h e r e   a r e� ��� r   f q��� I  f o�o�n�
�o .sysooffslong    ��� null�n  � �m��
�m 
psof� m   h i�� ���  ?� �l��k
�l 
psin� o   j k�j�j 0 theurl theURL�k  � o      �i�i 0 an aN� ��� Z   r ������ =   r u��� o   r s�h�h 0 an aN� m   s t�g�g � l  x ����� L   x ��� J   x ��� ��� m   x y�f
�f 
msng� ��e� l  y ���d�c� n   y ���� 7 z ��b��
�b 
ctxt� l  ~ ���a�`� [   ~ ���� o    ��_�_ 0 an aN� m   � ��^�^ �a  �`  � l  � ���]�\� I  � ��[��Z
�[ .corecnte****       ****� n   � ���� 2  � ��Y
�Y 
cha � o   � ��X�X 0 theurl theURL�Z  �]  �\  � o   y z�W�W 0 theurl theURL�d  �c  �e  � "  no base url, just arguments   � ��� 8   n o   b a s e   u r l ,   j u s t   a r g u m e n t s� ��� ?   � ���� o   � ��V�V 0 an aN� m   � ��U�U � ��T� L   � ��� J   � ��� ��� o   � ��S�S 0 theuri theURI� ��� l  � ���R�Q� n   � ���� 7 � ��P��
�P 
ctxt� m   � ��O�O � l  � ���N�M� \   � ���� o   � ��L�L 0 an aN� m   � ��K�K �N  �M  � o   � ��J�J 0 theurl theURL�R  �Q  � ��I� l  � ���H�G� n   � ���� 7 � ��F��
�F 
ctxt� l  � ���E�D� [   � ���� o   � ��C�C 0 an aN� m   � ��B�B �E  �D  � l  � � �A�@  I  � ��?�>
�? .corecnte****       **** n   � � 2  � ��=
�= 
cha  o   � ��<�< 0 theurl theURL�>  �A  �@  � o   � ��;�; 0 theurl theURL�H  �G  �I  �T  � L   � � J   � �  o   � ��:�: 0 theuri theURI 	 o   � ��9�9 0 theurl theURL	 
�8
 o   � ��7�7 0 theargs theArgs�8  � �6 l  � ��5�4�3�5  �4  �3  �6  H  l     �2�1�0�2  �1  �0    l      �/�/   z t Splits ?key=value&key2=value2 type arguments from the URI and turns them into a {key:value,key2:value2} record set     � �   S p l i t s   ? k e y = v a l u e & k e y 2 = v a l u e 2   t y p e   a r g u m e n t s   f r o m   t h e   U R I   a n d   t u r n s   t h e m   i n t o   a   { k e y : v a l u e , k e y 2 : v a l u e 2 }   r e c o r d   s e t    i     I      �.�-�. 0 argstorecord argsToRecord �, o      �+�+ 0 	argstring 	argString�,  �-   k     h  r      J     �*�*   o      �)�) 0 rstringarray rStringArray  r    
 !  m    "" �##  &! 1    	�(
�( 
txdl $%$ r    &'& n    ()( 2   �'
�' 
citm) o    �&�& 0 	argstring 	argString' o      �%�% 0 	splitargs 	splitArgs% *+* r    ,-, m    .. �//  =- 1    �$
�$ 
txdl+ 010 l   �#�"�!�#  �"  �!  1 232 X    R4� 54 k   ' M66 787 r   ' ,9:9 n   ' *;<; 2  ( *�
� 
citm< o   ' (�� 0 a  : o      �� 0 ax  8 =>= r   - 3?@? n   - 1ABA 4   . 1�C
� 
cobjC m   / 0�� B o   - .�� 0 ax  @ o      �� 0 axkey axKey> DED r   4 ?FGF n  4 =HIH I   5 =�J�� 0 decode_text  J K�K n   5 9LML 4   6 9�N
� 
cobjN m   7 8�� M o   5 6�� 0 ax  �  �  I  f   4 5G o      �� 0 axvalue axValueE O�O r   @ MPQP b   @ KRSR o   @ A�� 0 rstringarray rStringArrayS J   A JTT U�U b   A HVWV b   A FXYX b   A DZ[Z o   A B�� 0 axkey axKey[ m   B C\\ �]]  : "Y o   D E�� 0 axvalue axValueW m   F G^^ �__  "�  Q o      �� 0 rstringarray rStringArray�  �  0 a  5 o    �� 0 	splitargs 	splitArgs3 `a` r   S Xbcb m   S Tdd �ee  ,c 1   T W�

�
 
txdla fgf I  Y d�	h�
�	 .sysodsct****        scpth b   Y `iji l  Y ^k��k c   Y ^lml b   Y \non m   Y Zpp �qq  r e t u r n   {o o   Z [�� 0 rstringarray rStringArraym m   \ ]�
� 
TEXT�  �  j m   ^ _rr �ss  }�  g t�t L   e huu 1   e g�
� 
rslt�   vwv l     �� ���  �   ��  w xyx l      ��z{��  z "  Simple HTML decode routine    { �|| 8   S i m p l e   H T M L   d e c o d e   r o u t i n e  y }��} i    ~~ I      ������� 0 decode_text  � ���� o      ���� 0 encodedstring  ��  ��   I    �����
�� .sysoexecTEXT���     TEXT� b     ��� b     ��� m     �� ��� 
 e c h o  � n    ��� 1    ��
�� 
strq� l 	  ������ o    ���� 0 encodedstring  ��  ��  � m    �� ��� �   |   / u s r / b i n / r u b y   - r   c g i   - e   " p r i n t   C G I . u n e s c a p e ( S T D I N . r e a d ) . g s u b ( ' + ' , '   ' ) "��  ��  � ��� l   ������  � U O Fire it off immediately so we have a full URL Object when all is said and done   � ��� �   F i r e   i t   o f f   i m m e d i a t e l y   s o   w e   h a v e   a   f u l l   U R L   O b j e c t   w h e n   a l l   i s   s a i d   a n d   d o n e� ��� O   ��� I    ������� 0 
initialize  � ���� o    ���� 0 u  ��  ��  � o    	���� 0 	uriobject 	uriObject� ���� L    �� o    ���� 0 	uriobject 	uriObject��  �)       ���������  � ��������
�� .aevtoappnull  �   � ****
�� .GURLGURLnull��� ��� TEXT�� 0 writebraille writeBraille�� 0 newuri newURI� �� ��������
�� .aevtoappnull  �   � ****��  ��  �  �  ���� %����
�� .sysorpthalis        TEXT�� 0 x  
�� .miscactvnull��� ��� null
�� .aevtodocnull  �    alis�� �j E�O� *j UO� �j U� �� 0��������
�� .GURLGURLnull��� ��� TEXT�� 0 surl sURL��  � ������ 0 surl sURL�� 0 myurlobject myURLObject� ������ 0 newuri newURI�� 0 writebraille writeBraille�� *�k+  E�O*�k+ � �� A���������� 0 writebraille writeBraille�� ����� �  ���� 0 myurlobject myURLObject��  � �������������������������������������� 0 myurlobject myURLObject�� 0 homepath  �� 0 cfgfile  �� 0 thetable theTable�� 0 cpl  �� 0 lpp  �� 0 
interpoint  �� 0 intp  �� 0 
printpages 
printPages�� &0 printpagenumberat printPageNumberAt�� 0 braillepages braillePages�� *0 braillepagenumberat braillePageNumberAt�� 0 thecfg theCfg�� 0 crlf  �� 0 x  �� 0 afile aFile�� 0 brf  �� 0 brf_file  � 6���� V h������ v�� ����� � � � ��� ��� ��� ��� ������� ��%����1��7;?CGKOSV������g��p��s����
�� .earsffdralis        afdr
�� 
psxp�� 0 args  �� 0 code  
�� 
ctxt�� 	0 cells  �� 0 rows  �� 0 
interpoint  �� 0 
printpages 
printPages�� &0 printpagenumberat printPageNumberAt�� 0 braillepages braillePages�� *0 braillepagenumberat braillePageNumberAt�� 
�� .sysontocTEXT       shor�� 

�� 
strq
�� .sysoexecTEXT���     TEXT
�� 
prmp
�� 
ftyp�� 	�� 
�� .sysostdfalis    ��� null
�� 
prmt
�� 
dfnm
�� .sysonwflfile    ��� null��f)j  E�O��,�%E�O��,�,%�&E�O��,�,%�&E�O��,�,%�&E�O��,�,E�O��  �E�Y �E�O��,a ,%�&E�Oa ��,a ,%�&E�Oa ��,a ,%�&E�Oa ��,a ,%�&E�Oa E�Oa j a j %E�O��%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%E�Oa �a ,%a %�a ,%j E�O*a a  a !a "a #a $a %a &a 'a (a )a *a +va , -E�O��,E�Oa .�%j O*a /a 0a 1a 2a , 3E^ O] �,E^ O] a ,E^ Oa 4��,%a 5%] %j OP� ������������� 0 newuri newURI�� ����� �  ���� 0 u  ��  � ������ 0 u  �� 0 	uriobject 	uriObject� �������� 0 	uriobject 	uriObject� �����������
�� .ascrinit****      � ****� k     �� ��� ��� ��� ��� ��� G�� �� }����  ��  ��  � ������������������ 0 rawurl rawURL
�� 
pusc�� 0 location  �� 0 args  �� 0 
initialize  �� 0 spliturl splitURL�� 0 argstorecord argsToRecord�� 0 decode_text  � 	��������������
�� 
msng�� 0 rawurl rawURL
�� 
pusc�� 0 location  �� 0 args  � ������������� 0 
initialize  �� ����� �  ���� 0 aurl aURL��  � ��������� 0 aurl aURL�� 0 thespliturl theSplitURL�� 0 errmsg errMsg� 0 errnum errNum� �~�}�|�{�z�y�x�w�v�u�t�s�r�q�57�p�o�n�~ 0 spliturl splitURL
�} 
rslt
�| .ascrcmnt****      � ****
�{ 
cobj
�z 
pusc�y 0 decode_text  
�x 
msng�w 0 argstorecord argsToRecord
�v 
ascr
�u 
txdl�t 0 location  �s 0 args  �r �q 0 errmsg errMsg� �m�l�k
�m 
errn�l 0 errnum errNum�k  
�p .sysodisAaleR        TEXT
�o 
errn�n���� � n�Ec   O*�k+  E�O�j O��k/*�,FO*��l/k+ Ec  O��l/� *��m/k+ Ec  Y hO���,FO�*�,E�b  �b  �OPW !X  �a %�%a %j O)a a lh� �jJ�i�h���g�j 0 spliturl splitURL�i �f��f �  �e�e 0 theurl theURL�h  � �d�c�b�a�`�_�d 0 theurl theURL�c 0 theargs theArgs�b 0 theuri theURI�a 0 urin uriN�` 0 pn pN�_ 0 an aN� V�^�]c�\�[�Z��Y�X�W�V��U
�^ 
txdl
�] 
citm
�\ 
cha 
�[ .corecnte****       ****
�Z 
psof
�Y 
psin�X 
�W .sysooffslong    ��� null
�V 
ctxt
�U 
msng�g �jvE�O�*�,FO��k/E�O�*�,FO��-j kE�O*��%�� 
E�O�j �[�\[Z�m\Z��-j 2E�Y �[�\[Z�k\Z��-j 2E�O*���� 
E�O�k  ��[�\[Z�k\Z��-j 2ElvY 7�k +��[�\[Zk\Z�k2E�[�\[Z�k\Z��-j 2EmvY ���mvOP� �T�S�R���Q�T 0 argstorecord argsToRecord�S �P��P �  �O�O 0 	argstring 	argString�R  � �N�M�L�K�J�I�H�N 0 	argstring 	argString�M 0 rstringarray rStringArray�L 0 	splitargs 	splitArgs�K 0 a  �J 0 ax  �I 0 axkey axKey�H 0 axvalue axValue� "�G�F.�E�D�C�B\^dp�Ar�@�?
�G 
txdl
�F 
citm
�E 
kocl
�D 
cobj
�C .corecnte****       ****�B 0 decode_text  
�A 
TEXT
�@ .sysodsct****        scpt
�? 
rslt�Q ijvE�O�*�,FO��-E�O�*�,FO :�[��l kh ��-E�O��k/E�O)��l/k+ E�O���%�%�%kv%E�[OY��O�*�,FO�%�&�%j O�E� �>�=�<���;�> 0 decode_text  �= �:��: �  �9�9 0 encodedstring  �<  � �8�8 0 encodedstring  � ��7��6
�7 
strq
�6 .sysoexecTEXT���     TEXT�; ��,%�%j �� �O�O�Ojv�OL OL OL OL �� 0 
initialize  �� ��K S�O� *�k+ UO�ascr  ��ޭ