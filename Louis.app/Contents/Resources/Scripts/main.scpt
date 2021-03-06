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
�� .miscactvnull��� ��� null��  ��   $ m    	 % %�                                                                                  sfri  alis    N  Macintosh HD               �d�jH+   �6
Safari.app                                                      �,͜,r        ����  	                Applications    �e
�      ͜��     �6  %Macintosh HD:Applications: Safari.app    
 S a f a r i . a p p    M a c i n t o s h   H D  Applications/Safari.app   / ��   "  &�� & O    ' ( ' I   �� )��
�� .aevtodocnull  �    alis ) o    ���� 0 x  ��   ( m     * *�                                                                                  sfri  alis    N  Macintosh HD               �d�jH+   �6
Safari.app                                                      �,͜,r        ����  	                Applications    �e
�      ͜��     �6  %Macintosh HD:Applications: Safari.app    
 S a f a r i . a p p    M a c i n t o s h   H D  Applications/Safari.app   / ��  ��     + , + l     ��������  ��  ��   ,  - . - i     / 0 / I     �� 1��
�� .GURLGURLnull��� ��� TEXT 1 o      ���� 0 surl sURL��   0 k      2 2  3 4 3 r      5 6 5 I     �� 7���� 0 newuri newURI 7  8�� 8 o    ���� 0 surl sURL��  ��   6 o      ���� 0 myurlobject myURLObject 4  9�� 9 I   	 �� :���� 0 writebraille writeBraille :  ;�� ; o   
 ���� 0 myurlobject myURLObject��  ��  ��   .  < = < l     ��������  ��  ��   =  > ? > i     @ A @ I      �� B���� 0 writebraille writeBraille B  C�� C o      ���� 0 myurlobject myURLObject��  ��   A k     D D  E F E l     ��������  ��  ��   F  G H G r      I J I l     K���� K I    �� L��
�� .earsffdralis        afdr L  f     ��  ��  ��   J l      M���� M o      ���� 0 homepath  ��  ��   H  N O N r     P Q P b     R S R n     T U T 1   	 ��
�� 
psxp U o    	���� 0 homepath   S m     V V � W W � C o n t e n t s / R e s o u r c e s / B r a i l l e B l a s t e r / p r o g r a m D a t a / l i b l o u i s u t d m l / l b u _ f i l e s / t m p . c f g Q l      X���� X o      ���� 0 cfgfile  ��  ��   O  Y Z Y l   ��������  ��  ��   Z  [ \ [ l   �� ] ^��   ] % set myURLObject to newURI(sURL)    ^ � _ _ > s e t   m y U R L O b j e c t   t o   n e w U R I ( s U R L ) \  ` a ` l   ��������  ��  ��   a  b c b l   ��������  ��  ��   c  d e d r     f g f c     h i h b     j k j m     l l � m m $ l i t e r a r y T e x t T a b l e   k n     n o n o    ���� 0 code   o n     p q p o    ���� 0 args   q o    ���� 0 myurlobject myURLObject i m    ��
�� 
ctxt g o      ���� 0 thetable theTable e  r s r r    ' t u t c    % v w v b    # x y x m     z z � { {  c o m p b r l T a b l e   y n    " | } | o     "���� 0 compbrltable compbrlTable } n      ~  ~ o     ���� 0 args    o    ���� 0 myurlobject myURLObject w m   # $��
�� 
ctxt u o      ���� 0 compbrltable compbrlTable s  � � � r   ( 3 � � � c   ( 1 � � � b   ( / � � � m   ( ) � � � � �  c e l l s P e r L i n e   � n   ) . � � � o   , .���� 	0 cells   � n   ) , � � � o   * ,���� 0 args   � o   ) *���� 0 myurlobject myURLObject � m   / 0��
�� 
ctxt � o      ���� 0 cpl   �  � � � r   4 ? � � � c   4 = � � � b   4 ; � � � m   4 5 � � � � �  l i n e s P e r P a g e   � n   5 : � � � o   8 :���� 0 rows   � n   5 8 � � � o   6 8���� 0 args   � o   5 6���� 0 myurlobject myURLObject � m   ; <��
�� 
ctxt � o      ���� 0 lpp   �  � � � r   @ G � � � n   @ E � � � o   C E���� 0 
interpoint   � n   @ C � � � o   A C���� 0 args   � o   @ A���� 0 myurlobject myURLObject � o      ���� 0 
interpoint   �  � � � Z   H Y � ��� � � =  H K � � � o   H I���� 0 
interpoint   � m   I J � � � � �  o n � r   N Q � � � m   N O � � � � �  i n t e r p o i n t   y e s � o      ���� 0 intp  ��   � r   T Y � � � m   T W � � � � �  i n t e r p o i n t   n o � o      ���� 0 intp   �  � � � r   Z i � � � c   Z g � � � b   Z e � � � m   Z ] � � � � �  p r i n t P a g e s   � n   ] d � � � o   ` d���� 0 
printpages 
printPages � n   ] ` � � � o   ^ `���� 0 args   � o   ] ^���� 0 myurlobject myURLObject � m   e f��
�� 
ctxt � o      ���� 0 
printpages 
printPages �  � � � r   j y � � � c   j w � � � b   j u � � � m   j m � � � � � $ p r i n t P a g e N u m b e r A t   � n   m t � � � o   p t���� &0 printpagenumberat printPageNumberAt � n   m p � � � o   n p���� 0 args   � o   m n���� 0 myurlobject myURLObject � m   u v��
�� 
ctxt � o      ���� &0 printpagenumberat printPageNumberAt �  � � � r   z � � � � c   z � � � � b   z � � � � m   z } � � � � �  b r a i l l e P a g e s   � n   } � � � � o   � ����� 0 braillepages braillePages � n   } � � � � o   ~ ����� 0 args   � o   } ~���� 0 myurlobject myURLObject � m   � ���
�� 
ctxt � o      ���� 0 braillepages braillePages �  � � � r   � � � � � c   � � � � � b   � � � � � m   � � � � � � � ( b r a i l l e P a g e N u m b e r A t   � n   � � � � � o   � ����� *0 braillepagenumberat braillePageNumberAt � n   � � � � � o   � ����� 0 args   � o   � ����� 0 myurlobject myURLObject � m   � ���
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
 	 � o      ���� 0 thecfg theCfg �  � � � l  � ���������  ��  ��   �  � � � l  � ���~�}�  �~  �}   �  � � � r   � � � � � b   � � � � � l  � � ��|�{ � I  � ��z �y
�z .sysontocTEXT       shor  m   � ��x�x �y  �|  �{   � l  � ��w�v I  � ��u�t
�u .sysontocTEXT       shor m   � ��s�s 
�t  �w  �v   � o      �r�r 0 crlf   �  r   � � b   � � b   � �	
	 b   � � b   � � b   � � b   � � b   � � b   � � b   � � b   � � b   � � b   � � b   � �  b   � �!"! b   � �#$# b   � �%&% b   � �'(' b   � �)*) o   � ��q�q 0 thecfg theCfg* o   � ��p�p 0 crlf  ( o   � ��o�o 0 thetable theTable& o   � ��n�n 0 crlf  $ o   � ��m�m 0 cpl  " o   � ��l�l 0 crlf    o   � ��k�k 0 lpp   o   � ��j�j 0 crlf   o   � ��i�i 0 intp   o   � ��h�h 0 crlf   o   � ��g�g 0 
printpages 
printPages o   � ��f�f 0 crlf   o   � ��e�e &0 printpagenumberat printPageNumberAt o   � ��d�d 0 crlf   o   � ��c�c 0 braillepages braillePages o   � ��b�b 0 crlf   o   � ��a�a *0 braillepagenumberat braillePageNumberAt
 o   � ��`�` 0 crlf   o   � ��_�_ 0 compbrltable compbrlTable o      �^�^ 0 thecfg theCfg +,+ r   � �-.- I  � ��]/�\
�] .sysoexecTEXT���     TEXT/ b   � �010 b   � �232 b   � �454 m   � �66 �77 
 e c h o  5 l  � �8�[�Z8 n   � �9:9 1   � ��Y
�Y 
strq: o   � ��X�X 0 thecfg theCfg�[  �Z  3 m   � �;; �<<    >  1 l  � �=�W�V= n   � �>?> 1   � ��U
�U 
strq? o   � ��T�T 0 cfgfile  �W  �V  �\  . o      �S�S 0 x  , @A@ r   �'BCB I  �#�R�QD
�R .sysostdfalis    ��� null�Q  D �PEF
�P 
prmpE m   � �GG �HH L S e l e c t   f i l e   t o   t r a n s l a t e   i n t o   B r a i l l e :F �OI�N
�O 
ftypI J   �JJ KLK m   �MM �NN  p u b l i c . h t m lL OPO m  QQ �RR  p u b l i c . r t fP STS m  UU �VV " p u b l i c . p l a i n - t e x tT WXW m  
YY �ZZ  p u b l i c . d o c .X [\[ m  
]] �^^ @ o r g . o a s i s - o p e n . o p e n d o c u m e n t . t e x t\ _`_ m  aa �bb , c o m . m i c r o s o f t . w o r d . d o c` cdc m  ee �ff  p u b l i c . x m ld ghg m  ii �jj X o r g . o p e n x m l f o r m a t s . w o r d p r o c e s s i n g m l . d o c u m e n th k�Mk m  ll �mm  c o m . a p p l e . r t f d�M  �N  C o      �L�L 0 afile aFileA non l ((�K�J�I�K  �J  �I  o pqp r  (1rsr n  (-tut 1  +-�H
�H 
psxpu o  (+�G�G 0 afile aFiles o      �F�F 0 afile aFileq vwv l 22�E�D�C�E  �D  �C  w xyx I 2=�Bz�A
�B .sysoexecTEXT���     TEXTz b  29{|{ m  25}} �~~ � t e x t u t i l   - c o n v e r t   h t m l   - n o s t o r e   - n o l o a d   - s t r i p   - o u t p u t   / t m p / b r a i l l e . h t m l  | o  58�@�@ 0 afile aFile�A  y � r  >U��� I >Q�?�>�
�? .sysonwflfile    ��� null�>  � �=��
�= 
prmt� m  BE�� ��� * S a v e   B r a i l l e   f i l e   a s :� �<��;
�< 
dfnm� m  HK�� ���  b r a i l l e . b r f�;  � o      �:�: 0 brf  � ��� r  V_��� l V[��9�8� n  V[��� 1  Y[�7
�7 
psxp� o  VY�6�6 0 brf  �9  �8  � o      �5�5 0 brf_file  � ��� r  `k��� l `g��4�3� n  `g��� 1  cg�2
�2 
strq� o  `c�1�1 0 brf_file  �4  �3  � o      �0�0 0 brf_file  � ��� l ll�/�.�-�/  �.  �-  � ��� I l�,��+
�, .sysoexecTEXT���     TEXT� b  l{��� b  lw��� b  ls��� m  lo�� ���  j a v a   - j a r  � n  or��� 1  pr�*
�* 
psxp� o  op�)�) 0 homepath  � m  sv�� ��� � C o n t e n t s / R e s o u r c e s / B r a i l l e B l a s t e r / B r a i l l e B l a s t e r . j a r   - n o g u i   t r a n s l a t e   - f   t m p . c f g   - t     / t m p / b r a i l l e . h t m l  � o  wz�(�( 0 brf_file  �+  � ��� l ���'�&�%�'  �&  �%  � ��� r  ����� c  ����� n  ����� o  ���$�$ 0 openfile openFile� n  ����� o  ���#�# 0 args  � o  ���"�" 0 myurlobject myURLObject� m  ���!
�! 
ctxt� o      � �  0 openfile openFile� ��� Z  ������ = ����� o  ���� 0 openfile openFile� m  ���� ���  1� k  ��� ��� Q  ������ I �����
� .sysoexecTEXT���     TEXT� m  ���� ��� < l s   ~ / L i b r a r y / F o n t s / S i m B r a i l l e *�  � R      ���
� .ascrerr ****      � ****�  �  � k  ���� ��� r  ����� b  ����� n  ����� 1  ���
� 
psxp� o  ���� 0 homepath  � m  ���� ��� B C o n t e n t s / R e s o u r c e s / S i m B r a i l l e . t t f� o      �� 0 fontfile fontFile� ��� I �����
� .sysoexecTEXT���     TEXT� b  ����� b  ����� m  ���� ���  c p  � o  ���� 0 fontfile fontFile� m  ���� ��� "   ~ / L i b r a r y / F o n t s /�  � ��� O  ����� k  ���� ��� I �����
� .miscactvnull��� ��� null�  �  � ��� I �����

� .aevtquitnull��� ��� null�  �
  �  � m  �����                                                                                  ttxt  alis    V  Macintosh HD               �d�jH+   �6TextEdit.app                                                    �/�G�;        ����  	                Applications    �e
�      �H<�     �6  'Macintosh HD:Applications: TextEdit.app     T e x t E d i t . a p p    M a c i n t o s h   H D  Applications/TextEdit.app   / ��  �  � ��� l ���	���	  �  �  � ��� O  ���� k  ��� ��� I �����
� .miscactvnull��� ��� null�  �  � ��� I �����
� .aevtodocnull  �    alis� o  ��� �  0 brf  �  � ���� O  ���� k  ��� ��� r  ���� m  ���� ���  S i m B r a i l l e� n      ��� 1   ��
�� 
font� 2  � ��
�� 
cha � ���� r  ��� m  	���� � n      � � 1  ��
�� 
ptsz  2  	��
�� 
cha ��  � n  �� m  ����
�� 
ctxt 4 ����
�� 
docu m  ������ ��  � m  ���                                                                                  ttxt  alis    V  Macintosh HD               �d�jH+   �6TextEdit.app                                                    �/�G�;        ����  	                Applications    �e
�      �H<�     �6  'Macintosh HD:Applications: TextEdit.app     T e x t E d i t . a p p    M a c i n t o s h   H D  Applications/TextEdit.app   / ��  �  �  �  � �� l ��������  ��  ��  ��   ?  l     ��������  ��  ��   	 l      ��
��  
 � � newURI(): URI Object Initialization Script

	This returns a URL script object, containing properties for the URL scheme, location, and arguments, as passed through an HTML-encoded URL.     �t   n e w U R I ( ) :   U R I   O b j e c t   I n i t i a l i z a t i o n   S c r i p t 
 
 	 T h i s   r e t u r n s   a   U R L   s c r i p t   o b j e c t ,   c o n t a i n i n g   p r o p e r t i e s   f o r   t h e   U R L   s c h e m e ,   l o c a t i o n ,   a n d   a r g u m e n t s ,   a s   p a s s e d   t h r o u g h   a n   H T M L - e n c o d e d   U R L .  	  l     ��������  ��  ��   �� i     I      ������ 0 newuri newURI �� o      ���� 0 u  ��  ��   k       h     ���� 0 	uriobject 	uriObject k        l     ��������  ��  ��    j     ���� 0 rawurl rawURL m     ��
�� 
msng  j    �� 
�� 
pusc  m    ��
�� 
msng !"! j    ��#�� 0 location  # m    ��
�� 
msng" $%$ j   	 ��&�� 0 args  & J   	 ����  % '(' l     ��������  ��  ��  ( )*) l      ��+,��  + � � initialize()		
		This handler initializes the URL object, breaking it out into its constituent parts, and assigns them to the various script object properties. It will also replace and overwrite any existing URL properties on the script object    , �--�   i n i t i a l i z e ( ) 	 	 
 	 	 T h i s   h a n d l e r   i n i t i a l i z e s   t h e   U R L   o b j e c t ,   b r e a k i n g   i t   o u t   i n t o   i t s   c o n s t i t u e n t   p a r t s ,   a n d   a s s i g n s   t h e m   t o   t h e   v a r i o u s   s c r i p t   o b j e c t   p r o p e r t i e s .   I t   w i l l   a l s o   r e p l a c e   a n d   o v e r w r i t e   a n y   e x i s t i n g   U R L   p r o p e r t i e s   o n   t h e   s c r i p t   o b j e c t  * ./. l     ��������  ��  ��  / 010 i    232 I      ��4���� 0 
initialize  4 5��5 o      ���� 0 aurl aURL��  ��  3 Q     �6786 k    l99 :;: l   ��������  ��  ��  ; <=< r    
>?> o    ���� 0 aurl aURL? o      ���� 0 u  = @A@ l   ��BC��  B 4 . Break out the URL into its various components   C �DD \   B r e a k   o u t   t h e   U R L   i n t o   i t s   v a r i o u s   c o m p o n e n t sA EFE r    GHG I    ��I���� 0 spliturl splitURLI J��J o    ���� 0 aurl aURL��  ��  H o      ���� 0 thespliturl theSplitURLF KLK I   ��M��
�� .ascrcmnt****      � ****M 1    ��
�� 
rslt��  L NON l   ��PQ��  P % Get the URI-Scheme from the URI   Q �RR > G e t   t h e   U R I - S c h e m e   f r o m   t h e   U R IO STS r    "UVU n    WXW 4    ��Y
�� 
cobjY m    ���� X o    ���� 0 thespliturl theSplitURLV 1    !��
�� 
puscT Z[Z l  # #��\]��  \ $  Get the location from the URI   ] �^^ <   G e t   t h e   l o c a t i o n   f r o m   t h e   U R I[ _`_ r   # 2aba l  # ,c����c I   # ,��d���� 0 decode_text  d e��e n   $ (fgf 4   % (��h
�� 
cobjh m   & '���� g o   $ %���� 0 thespliturl theSplitURL��  ��  ��  ��  b o      ���� 0 location  ` iji l  3 3��������  ��  ��  j klk l  3 3��mn��  m   parse arguments   n �oo     p a r s e   a r g u m e n t sl pqp Z   3 Ors����r >  3 9tut n   3 7vwv 4   4 7��x
�� 
cobjx m   5 6���� w o   3 4���� 0 thespliturl theSplitURLu m   7 8��
�� 
msngs r   < Kyzy I   < E��{���� 0 argstorecord argsToRecord{ |��| n   = A}~} 4   > A��
�� 
cobj m   ? @���� ~ o   = >���� 0 thespliturl theSplitURL��  ��  z o      ���� 0 args  ��  ��  q ��� l  P P��������  ��  ��  � ��� l  P P������  � V P All went well, let's reset our text item delimiters and send back the arguments   � ��� �   A l l   w e n t   w e l l ,   l e t ' s   r e s e t   o u r   t e x t   i t e m   d e l i m i t e r s   a n d   s e n d   b a c k   t h e   a r g u m e n t s� ��� r   P U��� m   P Q�� ���  � n     ��� 1   R T��
�� 
txdl� 1   Q R��
�� 
ascr� ��� L   V j�� K   V i�� ����
�� 
pusc� 1   W [��
�� 
pusc� ������ 0 location  � o   \ a���� 0 location  � ������� 0 args  � o   b g���� 0 args  ��  � ���� l  k k��������  ��  ��  ��  7 R      ����
�� .ascrerr ****      � ****� o      ���� 0 errmsg errMsg� �����
�� 
errn� o      ���� 0 errnum errNum��  8 k   t ��� ��� I  t ������
�� .sysodisAaleR        TEXT� b   t ��� b   t {��� b   t y��� o   t u���� 0 errmsg errMsg� m   u x�� ���    (� o   y z���� 0 errnum errNum� m   { ~�� ���  )��  � ���� R   � ������
�� .ascrerr ****      � ****��  � �����
�� 
errn� m   � ���������  ��  1 ��� l     ����~��  �  �~  � ��� l     �}�|�{�}  �|  �{  � ��� l     �z�y�x�z  �y  �x  � ��� l      �w���w  � ' ! Convert a URL into a record set    � ��� B   C o n v e r t   a   U R L   i n t o   a   r e c o r d   s e t  � ��� i    ��� I      �v��u�v 0 spliturl splitURL� ��t� o      �s�s 0 theurl theURL�t  �u  � k     ��� ��� r     ��� J     �r�r  � o      �q�q 0 theargs theArgs� ��� r    
��� m    �� ���  :� 1    	�p
�p 
txdl� ��� r    ��� n    ��� 4    �o�
�o 
citm� m    �n�n � o    �m�m 0 theurl theURL� o      �l�l 0 theuri theURI� ��� r    ��� m    �� ���  � 1    �k
�k 
txdl� ��� l   #���� r    #��� [    !��� l   ��j�i� I   �h��g
�h .corecnte****       ****� n    ��� 2   �f
�f 
cha � o    �e�e 0 theuri theURI�g  �j  �i  � m     �d�d � o      �c�c 0 urin uriN�   account for the ":"   � ��� (   a c c o u n t   f o r   t h e   " : "� ��� l  $ $�b���b  � ) # Get rid of the url protocol string   � ��� F   G e t   r i d   o f   t h e   u r l   p r o t o c o l   s t r i n g� ��� l  $ $�a�`�_�a  �`  �_  � ��� l  $ 1���� r   $ 1��� I  $ /�^�]�
�^ .sysooffslong    ��� null�]  � �\��
�\ 
psof� l  & )��[�Z� b   & )��� o   & '�Y�Y 0 theuri theURI� m   ' (�� ���  : / /�[  �Z  � �X��W
�X 
psin� o   * +�V�V 0 theurl theURL�W  � o      �U�U 0 pn pN�   is it a mailto:// style?   � ��� 2   i s   i t   a   m a i l t o : / /   s t y l e ?� ��� l  2 2�T�S�R�T  �S  �R  � ��� Z   2 e �Q  ?   2 5 o   2 3�P�P 0 pn pN m   3 4�O�O   l  8 M r   8 M	 n   8 K

 7 9 K�N
�N 
ctxt l  = A�M�L [   = A o   > ?�K�K 0 urin uriN m   ? @�J�J �M  �L   l  B J�I�H I  B J�G�F
�G .corecnte****       **** n   C F 2  D F�E
�E 
cha  o   C D�D�D 0 theurl theURL�F  �I  �H   o   8 9�C�C 0 theurl theURL	 o      �B�B 0 theurl theURL   a URI:// url    �    a   U R I : / /   u r l�Q   l  P e r   P e n   P c 7 Q c�A
�A 
ctxt l  U Y�@�? [   U Y !  o   V W�>�> 0 urin uriN! m   W X�=�= �@  �?   l  Z b"�<�;" I  Z b�:#�9
�: .corecnte****       ****# n   [ ^$%$ 2  \ ^�8
�8 
cha % o   [ \�7�7 0 theurl theURL�9  �<  �;   o   P Q�6�6 0 theurl theURL o      �5�5 0 theurl theURL   or just a URI: url    �&& &   o r   j u s t   a   U R I :   u r l� '(' l  f f�4�3�2�4  �3  �2  ( )*) l  f f�1+,�1  + L F See if there's any arguments being passed, pass 'em back if there are   , �-- �   S e e   i f   t h e r e ' s   a n y   a r g u m e n t s   b e i n g   p a s s e d ,   p a s s   ' e m   b a c k   i f   t h e r e   a r e* ./. r   f q010 I  f o�0�/2
�0 .sysooffslong    ��� null�/  2 �.34
�. 
psof3 m   h i55 �66  ?4 �-7�,
�- 
psin7 o   j k�+�+ 0 theurl theURL�,  1 o      �*�* 0 an aN/ 898 Z   r �:;<=: =   r u>?> o   r s�)�) 0 an aN? m   s t�(�( ; l  x �@AB@ L   x �CC J   x �DD EFE m   x y�'
�' 
msngF G�&G l  y �H�%�$H n   y �IJI 7 z ��#KL
�# 
ctxtK l  ~ �M�"�!M [   ~ �NON o    �� �  0 an aNO m   � ��� �"  �!  L l  � �P��P I  � ��Q�
� .corecnte****       ****Q n   � �RSR 2  � ��
� 
cha S o   � ��� 0 theurl theURL�  �  �  J o   y z�� 0 theurl theURL�%  �$  �&  A "  no base url, just arguments   B �TT 8   n o   b a s e   u r l ,   j u s t   a r g u m e n t s< UVU ?   � �WXW o   � ��� 0 an aNX m   � ��� V Y�Y L   � �ZZ J   � �[[ \]\ o   � ��� 0 theuri theURI] ^_^ l  � �`��` n   � �aba 7 � ��cd
� 
ctxtc m   � ��� d l  � �e��e \   � �fgf o   � ��� 0 an aNg m   � ��� �  �  b o   � ��� 0 theurl theURL�  �  _ h�
h l  � �i�	�i n   � �jkj 7 � ��lm
� 
ctxtl l  � �n��n [   � �opo o   � ��� 0 an aNp m   � ��� �  �  m l  � �q��q I  � �� r��
�  .corecnte****       ****r n   � �sts 2  � ���
�� 
cha t o   � ����� 0 theurl theURL��  �  �  k o   � ����� 0 theurl theURL�	  �  �
  �  = L   � �uu J   � �vv wxw o   � ����� 0 theuri theURIx yzy o   � ����� 0 theurl theURLz {��{ o   � ����� 0 theargs theArgs��  9 |��| l  � ���������  ��  ��  ��  � }~} l     ��������  ��  ��  ~ � l      ������  � z t Splits ?key=value&key2=value2 type arguments from the URI and turns them into a {key:value,key2:value2} record set    � ��� �   S p l i t s   ? k e y = v a l u e & k e y 2 = v a l u e 2   t y p e   a r g u m e n t s   f r o m   t h e   U R I   a n d   t u r n s   t h e m   i n t o   a   { k e y : v a l u e , k e y 2 : v a l u e 2 }   r e c o r d   s e t  � ��� i    ��� I      ������� 0 argstorecord argsToRecord� ���� o      ���� 0 	argstring 	argString��  ��  � k     h�� ��� r     ��� J     ����  � o      ���� 0 rstringarray rStringArray� ��� r    
��� m    �� ���  &� 1    	��
�� 
txdl� ��� r    ��� n    ��� 2   ��
�� 
citm� o    ���� 0 	argstring 	argString� o      ���� 0 	splitargs 	splitArgs� ��� r    ��� m    �� ���  =� 1    ��
�� 
txdl� ��� l   ��������  ��  ��  � ��� X    R����� k   ' M�� ��� r   ' ,��� n   ' *��� 2  ( *��
�� 
citm� o   ' (���� 0 a  � o      ���� 0 ax  � ��� r   - 3��� n   - 1��� 4   . 1���
�� 
cobj� m   / 0���� � o   - .���� 0 ax  � o      ���� 0 axkey axKey� ��� r   4 ?��� n  4 =��� I   5 =������� 0 decode_text  � ���� n   5 9��� 4   6 9���
�� 
cobj� m   7 8���� � o   5 6���� 0 ax  ��  ��  �  f   4 5� o      ���� 0 axvalue axValue� ���� r   @ M��� b   @ K��� o   @ A���� 0 rstringarray rStringArray� J   A J�� ���� b   A H��� b   A F��� b   A D��� o   A B���� 0 axkey axKey� m   B C�� ���  : "� o   D E���� 0 axvalue axValue� m   F G�� ���  "��  � o      ���� 0 rstringarray rStringArray��  �� 0 a  � o    ���� 0 	splitargs 	splitArgs� ��� r   S X��� m   S T�� ���  ,� 1   T W��
�� 
txdl� ��� I  Y d�����
�� .sysodsct****        scpt� b   Y `��� l  Y ^������ c   Y ^��� b   Y \��� m   Y Z�� ���  r e t u r n   {� o   Z [���� 0 rstringarray rStringArray� m   \ ]��
�� 
TEXT��  ��  � m   ^ _�� ���  }��  � ���� L   e h�� 1   e g��
�� 
rslt��  � ��� l     ��������  ��  ��  � ��� l      ������  � "  Simple HTML decode routine    � ��� 8   S i m p l e   H T M L   d e c o d e   r o u t i n e  � ���� i    ��� I      ������� 0 decode_text  � ���� o      ���� 0 encodedstring  ��  ��  � I    �����
�� .sysoexecTEXT���     TEXT� b     ��� b     ��� m     �� ��� 
 e c h o  � n    ��� 1    ��
�� 
strq� l 	  ������ o    ���� 0 encodedstring  ��  ��  � m    �� ��� �   |   / u s r / b i n / r u b y   - r   c g i   - e   " p r i n t   C G I . u n e s c a p e ( S T D I N . r e a d ) . g s u b ( ' + ' , '   ' ) "��  ��   � � l   ����   U O Fire it off immediately so we have a full URL Object when all is said and done    � �   F i r e   i t   o f f   i m m e d i a t e l y   s o   w e   h a v e   a   f u l l   U R L   O b j e c t   w h e n   a l l   i s   s a i d   a n d   d o n e   O    I    ������ 0 
initialize   	��	 o    ���� 0 u  ��  ��   o    	���� 0 	uriobject 	uriObject 
��
 L     o    ���� 0 	uriobject 	uriObject��  ��       ����   ��������
�� .aevtoappnull  �   � ****
�� .GURLGURLnull��� ��� TEXT�� 0 writebraille writeBraille�� 0 newuri newURI �� ������
�� .aevtoappnull  �   � ****��  ��      ���� %����
�� .sysorpthalis        TEXT�� 0 x  
�� .miscactvnull��� ��� null
�� .aevtodocnull  �    alis�� �j E�O� *j UO� �j U �� 0������
�� .GURLGURLnull��� ��� TEXT�� 0 surl sURL��   ������ 0 surl sURL�� 0 myurlobject myURLObject ������ 0 newuri newURI�� 0 writebraille writeBraille�� *�k+  E�O*�k+  �� A�������� 0 writebraille writeBraille�� ����   ���� 0 myurlobject myURLObject��   ������������������������������������~�}�|�� 0 myurlobject myURLObject�� 0 homepath  �� 0 cfgfile  �� 0 thetable theTable�� 0 compbrltable compbrlTable�� 0 cpl  �� 0 lpp  �� 0 
interpoint  �� 0 intp  �� 0 
printpages 
printPages�� &0 printpagenumberat printPageNumberAt�� 0 braillepages braillePages�� *0 braillepagenumberat braillePageNumberAt�� 0 thecfg theCfg�� 0 crlf  �� 0 x  �� 0 afile aFile� 0 brf  �~ 0 brf_file  �} 0 openfile openFile�| 0 fontfile fontFile J�{�z V l�y�x�w z�v ��u ��t�s � � � ��r ��q ��p ��o ��n�m�l6�k;�j�iG�hMQUY]aeil�g�f�e}�d��c��b���a���`�_�����^�]�\�[��Z�Y�X�W
�{ .earsffdralis        afdr
�z 
psxp�y 0 args  �x 0 code  
�w 
ctxt�v 0 compbrltable compbrlTable�u 	0 cells  �t 0 rows  �s 0 
interpoint  �r 0 
printpages 
printPages�q &0 printpagenumberat printPageNumberAt�p 0 braillepages braillePages�o *0 braillepagenumberat braillePageNumberAt�n 
�m .sysontocTEXT       shor�l 

�k 
strq
�j .sysoexecTEXT���     TEXT
�i 
prmp
�h 
ftyp�g 	�f 
�e .sysostdfalis    ��� null
�d 
prmt
�c 
dfnm
�b .sysonwflfile    ��� null�a 0 openfile openFile�`  �_  
�^ .miscactvnull��� ��� null
�] .aevtquitnull��� ��� null
�\ .aevtodocnull  �    alis
�[ 
docu
�Z 
cha 
�Y 
font�X 
�W 
ptsz��)j  E�O��,�%E�O��,�,%�&E�O��,�,%�&E�O��,�,%�&E�O��,�,%�&E�O��,�,E�O��  �E�Y a E�Oa ��,a ,%�&E�Oa ��,a ,%�&E�Oa ��,a ,%�&E�Oa ��,a ,%�&E�Oa E�Oa j a j %E�O��%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%E�Oa �a ,%a %�a ,%j  E�O*a !a "a #a $a %a &a 'a (a )a *a +a ,a -va . /E^ O] �,E^ Oa 0] %j  O*a 1a 2a 3a 4a . 5E^ O] �,E^ O] a ,E^ Oa 6��,%a 7%] %j  O��,a 8,�&E^ O] a 9  � a :j  W 5X ; <��,a =%E^ Oa >] %a ?%j  Oa @ *j AO*j BUOa @ 7*j AO] j CO*a Dk/�- a E*a F-a G,FOa H*a F-a I,FUUY hOP �V�U�T�S�V 0 newuri newURI�U �R�R   �Q�Q 0 u  �T   �P�O�P 0 u  �O 0 	uriobject 	uriObject �N�M�N 0 	uriobject 	uriObject �L�K�J�I
�L .ascrinit****      � **** k         !! !"" $## 0$$ �%% �&& ��H�H  �K  �J   �G�F�E�D�C�B�A�@�G 0 rawurl rawURL
�F 
pusc�E 0 location  �D 0 args  �C 0 
initialize  �B 0 spliturl splitURL�A 0 argstorecord argsToRecord�@ 0 decode_text   	�?�>�=�<�;'()*
�? 
msng�> 0 rawurl rawURL
�= 
pusc�< 0 location  �; 0 args  ' �:3�9�8+,�7�: 0 
initialize  �9 �6-�6 -  �5�5 0 aurl aURL�8  + �4�3�2�1�4 0 aurl aURL�3 0 thespliturl theSplitURL�2 0 errmsg errMsg�1 0 errnum errNum, �0�/�.�-�,�+�*�)��(�'�&�%�$�#.���"�!� �0 0 spliturl splitURL
�/ 
rslt
�. .ascrcmnt****      � ****
�- 
cobj
�, 
pusc�+ 0 decode_text  
�* 
msng�) 0 argstorecord argsToRecord
�( 
ascr
�' 
txdl�& 0 location  �% 0 args  �$ �# 0 errmsg errMsg. ���
� 
errn� 0 errnum errNum�  
�" .sysodisAaleR        TEXT
�! 
errn� ���7 � n�Ec   O*�k+  E�O�j O��k/*�,FO*��l/k+ Ec  O��l/� *��m/k+ Ec  Y hO���,FO�*�,E�b  �b  �OPW !X  �a %�%a %j O)a a lh( ����/0�� 0 spliturl splitURL� �1� 1  �� 0 theurl theURL�  / ������� 0 theurl theURL� 0 theargs theArgs� 0 theuri theURI� 0 urin uriN� 0 pn pN� 0 an aN0 ����������
�	�5�
� 
txdl
� 
citm
� 
cha 
� .corecnte****       ****
� 
psof
� 
psin�
 
�	 .sysooffslong    ��� null
� 
ctxt
� 
msng� �jvE�O�*�,FO��k/E�O�*�,FO��-j kE�O*��%�� 
E�O�j �[�\[Z�m\Z��-j 2E�Y �[�\[Z�k\Z��-j 2E�O*���� 
E�O�k  ��[�\[Z�k\Z��-j 2ElvY 7�k +��[�\[Zk\Z�k2E�[�\[Z�k\Z��-j 2EmvY ���mvOP) ����23�� 0 argstorecord argsToRecord� �4� 4  �� 0 	argstring 	argString�  2 � �������������  0 	argstring 	argString�� 0 rstringarray rStringArray�� 0 	splitargs 	splitArgs�� 0 a  �� 0 ax  �� 0 axkey axKey�� 0 axvalue axValue3 �������������������������
�� 
txdl
�� 
citm
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� 0 decode_text  
�� 
TEXT
�� .sysodsct****        scpt
�� 
rslt� ijvE�O�*�,FO��-E�O�*�,FO :�[��l kh ��-E�O��k/E�O)��l/k+ E�O���%�%�%kv%E�[OY��O�*�,FO�%�&�%j O�E* �������56���� 0 decode_text  �� ��7�� 7  ���� 0 encodedstring  ��  5 ���� 0 encodedstring  6 ������
�� 
strq
�� .sysoexecTEXT���     TEXT�� ��,%�%j �I �O�O�Ojv�OL OL OL OL �M 0 
initialize  �S ��K S�O� *�k+ UO�ascr  ��ޭ