FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��
 * This is an example apple script which demonstrates how you can update the location of 
 * your device via apple script. The script is intended to be run with LocationSimulator running
 * as daemon. You can start LocationSimulator as daemon by launching it via terminal 
 * with the '--no-ui' flag.
 *
 * You can configure the speed, the device and the GPX file at the start of the run method.
 * The script automatically interpolates between the coordinates based on the speed value.
 *
      � 	 	� 
   *   T h i s   i s   a n   e x a m p l e   a p p l e   s c r i p t   w h i c h   d e m o n s t r a t e s   h o w   y o u   c a n   u p d a t e   t h e   l o c a t i o n   o f   
   *   y o u r   d e v i c e   v i a   a p p l e   s c r i p t .   T h e   s c r i p t   i s   i n t e n d e d   t o   b e   r u n   w i t h   L o c a t i o n S i m u l a t o r   r u n n i n g 
   *   a s   d a e m o n .   Y o u   c a n   s t a r t   L o c a t i o n S i m u l a t o r   a s   d a e m o n   b y   l a u n c h i n g   i t   v i a   t e r m i n a l   
   *   w i t h   t h e   ' - - n o - u i '   f l a g . 
   * 
   *   Y o u   c a n   c o n f i g u r e   t h e   s p e e d ,   t h e   d e v i c e   a n d   t h e   G P X   f i l e   a t   t h e   s t a r t   o f   t h e   r u n   m e t h o d . 
   *   T h e   s c r i p t   a u t o m a t i c a l l y   i n t e r p o l a t e s   b e t w e e n   t h e   c o o r d i n a t e s   b a s e d   o n   t h e   s p e e d   v a l u e . 
   * 
     
  
 l     ��������  ��  ��        p         ������ 	0 speed  ��        p         ������ 0 	lastcoord 	lastCoord��        l     ��������  ��  ��        i         I     ������
�� .aevtoappnull  �   � ****��  ��    k    �       l     ��  ��    + % Speed in m/s which is approx 15 km/h     �   J   S p e e d   i n   m / s   w h i c h   i s   a p p r o x   1 5   k m / h      l     ��   !��     - ' Note the speed value is not accurate !    ! � " " N   N o t e   t h e   s p e e d   v a l u e   i s   n o t   a c c u r a t e   !   # $ # r      % & % m      ' ' @�I�^ & o      ���� 	0 speed   $  ( ) ( l   �� * +��   *   Name of the device     + � , , (   N a m e   o f   t h e   d e v i c e   )  - . - r     / 0 / m     1 1 � 2 2 " i P h o n e   1 4   P r o   M a x 0 o      ���� 0 
devicename 
deviceName .  3 4 3 l   �� 5 6��   5   Path to the GPX file    6 � 7 7 *   P a t h   t o   t h e   G P X   f i l e 4  8 9 8 r     : ; : m    	 < < � = = : / U s e r s / D a v i d / D e s k t o p / t e s t . g p x ; o      ���� 0 filename fileName 9  > ? > l   ��������  ��  ��   ?  @ A @ r     B C B m    ��
�� 
msng C o      ���� 0 	lastcoord 	lastCoord A  D E D l   ��������  ��  ��   E  F�� F O   � G H G k   � I I  J K J r    # L M L 6   ! N O N 4   �� P
�� 
LSDE P m    ����  O C      Q R Q 1    ��
�� 
pnam R o    ���� 0 
devicename 
deviceName M o      ���� 0 mydevice myDevice K  S T S r   $ ) U V U n   $ ' W X W 1   % '��
�� 
pnam X o   $ %���� 0 mydevice myDevice V o      ���� 0 
devicename 
deviceName T  Y Z Y I  * 3�� [��
�� .ascrcmnt****      � **** [ l  * / \���� \ b   * / ] ^ ] b   * - _ ` _ m   * + a a � b b  P a i r   d e v i c e   ` o   + ,���� 0 
devicename 
deviceName ^ m   - . c c � d d  . . .��  ��  ��   Z  e f e O  4 > g h g I  8 =������
�� .LSpairdenull���     LSDE��  ��   h o   4 5���� 0 mydevice myDevice f  i j i I  ? H�� k��
�� .ascrcmnt****      � **** k l  ? D l���� l b   ? D m n m o   ? @���� 0 
devicename 
deviceName n m   @ C o o � p p    p a i r e d��  ��  ��   j  q r q l  I I��������  ��  ��   r  s t s l  I I�� u v��   u [ U somehow we always need an alias to access the file... seems like an apple script bug    v � w w �   s o m e h o w   w e   a l w a y s   n e e d   a n   a l i a s   t o   a c c e s s   t h e   f i l e . . .   s e e m s   l i k e   a n   a p p l e   s c r i p t   b u g t  x y x r   I R z { z n   I N | } | 1   J N��
�� 
psxp } o   I J���� 0 filename fileName { o      ���� 0 mypath myPath y  ~  ~ r   S c � � � c   S _ � � � l  S [ ����� � 4   S [�� �
�� 
psxf � o   W Z���� 0 mypath myPath��  ��   � m   [ ^��
�� 
alis � o      ���� 0 myalias myAlias   � � � l  d d��������  ��  ��   �  � � � r   d s � � � I  d o���� �
�� .LSldgpxfnull��� ��� null��   � �� ���
�� 
Lsfl � o   h k���� 0 myalias myAlias��   � o      ���� 0 gpxfile gpxFile �  � � � l  t t�� � ���   � ) #set myFilePath to (path of gpxFile)    � � � � F s e t   m y F i l e P a t h   t o   ( p a t h   o f   g p x F i l e ) �  � � � l  t t�� � ���   �  log (myFilePath)    � � � �   l o g   ( m y F i l e P a t h ) �  � � � l  t t��������  ��  ��   �  � � � l  t t�� � ���   �  
 waypoints    � � � �    w a y p o i n t s �  � � � I  t {�� ���
�� .ascrcmnt****      � **** � l  t w ����� � m   t w � � � � �   U s e   w a y p o i n t s . . .��  ��  ��   �  � � � r   | � � � � l  | � ����� � n   | � � � � 2   ���
�� 
LSWP � o   | ���� 0 gpxfile gpxFile��  ��   � o      ���� 0 mywaypoints myWaypoints �  � � � X   � � ��� � � n  � � � � � I   � ��� ����� &0 "update_location_with_interpolation   �  � � � o   � ����� 0 mydevice myDevice �  ��� � o   � ����� 0 wp  ��  ��   �  f   � ��� 0 wp   � o   � ����� 0 mywaypoints myWaypoints �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   �   tracks    � � � �    t r a c k s �  � � � I  � ��� ���
�� .ascrcmnt****      � **** � l  � � ����� � m   � � � � � � �  U s e   t r a c k s . . .��  ��  ��   �  � � � r   � � � � � l  � � ����� � n   � � � � � 2  � ���
�� 
LSTR � o   � ����� 0 gpxfile gpxFile��  ��   � o      ���� 0 mytracks myTracks �  � � � X   � ��� � � X   � ��� � � X   � ��� � � n  � � � I  �� ����� &0 "update_location_with_interpolation   �  � � � o  ���� 0 mydevice myDevice �  ��� � o  ���� 0 pt  ��  ��   �  f  �� 0 pt   � l  � � ����� � n   � � � � � 2  � ���
�� 
LSTP � o   � ����� 0 seg  ��  ��  �� 0 seg   � l  � � ����� � n   � � � � � 2  � ���
�� 
LSSG � o   � ����� 0 tr  ��  ��  �� 0 tr   � o   � ����� 0 mytracks myTracks �  � � � l ����~��  �  �~   �  � � � l �} � ��}   �   routes    � � � �    r o u t e s �  � � � I #�| ��{
�| .ascrcmnt****      � **** � l  ��z�y � m   � � � � �  U s e   r o u t e s . . .�z  �y  �{   �  � � � r  $/ � � � l $+ ��x�w � n  $+ � � � 2 '+�v
�v 
LSRO � o  $'�u�u 0 gpxfile gpxFile�x  �w   � o      �t�t 0 myroutes myRoutes �  � � � X  0o ��s � � X  Fj ��r � � n ^e � � � I  _e�q ��p�q &0 "update_location_with_interpolation   �  � � � o  _`�o�o 0 mydevice myDevice �  ��n � o  `a�m�m 0 pt  �n  �p   �  f  ^_�r 0 pt   � l IN ��l�k � n IN �  � 2 JN�j
�j 
LSRP  o  IJ�i�i 0 rt  �l  �k  �s 0 rt   � o  36�h�h 0 myroutes myRoutes �  l pp�g�f�e�g  �f  �e    l pp�d�d    	 cleanup     �    c l e a n u p   	 I pw�c
�b
�c .ascrcmnt****      � ****
 l ps�a�` m  ps �  C l e a n u p . . .�a  �`  �b  	  O x� I ~��_�^�]
�_ .LSclogpxnull���     LSGX�^  �]   o  x{�\�\ 0 gpxfile gpxFile �[ I ���Z�Y
�Z .ascrcmnt****      � **** l ���X�W m  �� �  F i n i s h e d .�X  �W  �Y  �[   H m    z                                                                                      @ alis      Macintosh HD               �H&BD ����LocationSimulator.app                                          �����*��        ����  
 cu             Debug   �/:Users:David:Library:Developer:Xcode:DerivedData:LocationSimulator-depewdcvscyvkvalvkqqdhtndlpx:Build:Products:Debug:LocationSimulator.app/  ,  L o c a t i o n S i m u l a t o r . a p p    M a c i n t o s h   H D  �Users/David/Library/Developer/Xcode/DerivedData/LocationSimulator-depewdcvscyvkvalvkqqdhtndlpx/Build/Products/Debug/LocationSimulator.app   /    ��  ��     l     �V�U�T�V  �U  �T    i     I      �S�R�S 0 heading     o      �Q�Q 
0 coord1    !�P! o      �O�O 
0 coord2  �P  �R   k     �"" #$# l     �N%&�N  %   Convert to radians   & �'' &   C o n v e r t   t o   r a d i a n s$ ()( r     
*+* l    ,�M�L, ^     -.- ]     /0/ l    1�K�J1 n     232 4   �I4
�I 
cobj4 m    �H�H 3 o     �G�G 
0 coord1  �K  �J  0 1    �F
�F 
pi  . m    �E�E ��M  �L  + o      �D�D 0 lat1  ) 565 r    787 l   9�C�B9 ^    :;: ]    <=< l   >�A�@> n    ?@? 4   �?A
�? 
cobjA m    �>�> @ o    �=�= 
0 coord1  �A  �@  = 1    �<
�< 
pi  ; m    �;�; ��C  �B  8 o      �:�: 0 lon1  6 BCB l   �9�8�7�9  �8  �7  C DED r     FGF l   H�6�5H ^    IJI ]    KLK l   M�4�3M n    NON 4   �2P
�2 
cobjP m    �1�1 O o    �0�0 
0 coord2  �4  �3  L 1    �/
�/ 
pi  J m    �.�. ��6  �5  G o      �-�- 0 lat2  E QRQ r   ! +STS l  ! )U�,�+U ^   ! )VWV ]   ! 'XYX l  ! %Z�*�)Z n   ! %[\[ 4  " %�(]
�( 
cobj] m   # $�'�' \ o   ! "�&�& 
0 coord2  �*  �)  Y 1   % &�%
�% 
pi  W m   ' (�$�$ ��,  �+  T o      �#�# 0 lon2  R ^_^ l  , ,�"�!� �"  �!  �   _ `a` O   , �bcb k   0 �dd efe r   0 5ghg \   0 3iji o   0 1�� 0 lon2  j o   1 2�� 0 lon1  h o      �� 0 dlon dLonf klk r   6 Gmnm ]   6 Eopo l  6 =q��q I  6 =��r
� .LSsinfunnull��� ��� null�  r �s�
� 
Lssis o   8 9�� 0 dlon dLon�  �  �  p l  = Dt��t I  = D��u
� .LScosfunnull��� ��� null�  u �v�
� 
Lscov o   ? @�� 0 lat2  �  �  �  n o      �� 0 yval yVall wxw r   H qyzy \   H o{|{ ]   H W}~} l  H O�� I  H O��
�
� .LScosfunnull��� ��� null�
  � �	��
�	 
Lsco� o   J K�� 0 lat1  �  �  �  ~ l  O V���� I  O V���
� .LSsinfunnull��� ��� null�  � ���
� 
Lssi� o   Q R� �  0 lat2  �  �  �  | ]   W n��� ]   W f��� l  W ^������ I  W ^�����
�� .LSsinfunnull��� ��� null��  � �����
�� 
Lssi� o   Y Z���� 0 lat1  ��  ��  ��  � l  ^ e������ I  ^ e�����
�� .LScosfunnull��� ��� null��  � �����
�� 
Lsco� o   ` a���� 0 lat2  ��  ��  ��  � l  f m������ I  f m�����
�� .LScosfunnull��� ��� null��  � �����
�� 
Lsco� o   h i���� 0 dlon dLon��  ��  ��  z o      ���� 0 xval xValx ���� r   r ���� ^   r ��� ]   r }��� l  r {������ I  r {�����
�� .LSatafunnull��� ��� null��  � ����
�� 
Lsyp� o   t u���� 0 yval yVal� �����
�� 
Lsxp� o   v w���� 0 xval xVal��  ��  ��  � m   { |���� �� 1   } ~��
�� 
pi  � o      ����  0 headingdegrees headingDegrees��  c m   , -��z                                                                                      @ alis      Macintosh HD               �H&BD ����LocationSimulator.app                                          �����*��        ����  
 cu             Debug   �/:Users:David:Library:Developer:Xcode:DerivedData:LocationSimulator-depewdcvscyvkvalvkqqdhtndlpx:Build:Products:Debug:LocationSimulator.app/  ,  L o c a t i o n S i m u l a t o r . a p p    M a c i n t o s h   H D  �Users/David/Library/Developer/Xcode/DerivedData/LocationSimulator-depewdcvscyvkvalvkqqdhtndlpx/Build/Products/Debug/LocationSimulator.app   /    ��  a ��� l  � ���������  ��  ��  � ���� Z   � ������� @   � ���� o   � �����  0 headingdegrees headingDegrees� m   � �����  � L   � ��� o   � �����  0 headingdegrees headingDegrees��  � L   � ��� [   � ���� o   � �����  0 headingdegrees headingDegrees� m   � �����h��   ��� l     ��������  ��  ��  � ��� i    ��� I      ������� 0 next  � ��� o      ���� 	0 coord  � ��� o      ���� 0 heading  � ���� o      ���� 0 dis  ��  ��  � k     |�� ��� r     ��� l    ������ n     ��� 4   ���
�� 
cobj� m    ���� � o     ���� 	0 coord  ��  ��  � o      ���� 0 lat  � ��� r    ��� l   ������ n    ��� 4   ���
�� 
cobj� m   	 
���� � o    ���� 	0 coord  ��  ��  � o      ���� 0 lon  � ��� l   ��������  ��  ��  � ��� r    ��� ]    ��� ]    ��� m    ���� � 1    ��
�� 
pi  � m    �� AXM�    � o      ���� 0 earthcircle earthCircle� ��� l   ��������  ��  ��  � ��� O    v��� k    u�� ��� r    )��� ]    '��� o    ���� 0 dis  � l   &������ I   &�����
�� .LScosfunnull��� ��� null��  � �����
�� 
Lsco� l   "������ ^    "��� ]     ��� o    ���� 0 heading  � 1    ��
�� 
pi  � m     !���� ���  ��  ��  ��  ��  � o      ���� 0 latdistance latDistance� ��� r   * /��� ^   * -��� m   * +����h� o   + ,���� 0 earthcircle earthCircle� o      ���� 0 latpermeter latPerMeter� ��� r   0 5��� ]   0 3��� o   0 1���� 0 latdistance latDistance� o   1 2���� 0 latpermeter latPerMeter� o      ���� 0 latdelta latDelta� ��� r   6 ;��� [   6 9��� o   6 7���� 0 lat  � o   7 8���� 0 latdelta latDelta� o      ���� 0 newlat newLat� ��� l  < <��������  ��  ��  � ��� r   < K��� ]   < I   l  < =���� o   < =���� 0 dis  ��  ��   l  = H���� I  = H����
�� .LSsinfunnull��� ��� null��   ����
�� 
Lssi l  ? D���� ^   ? D ]   ? B	
	 o   ? @���� 0 heading  
 1   @ A��
�� 
pi   m   B C���� ���  ��  ��  ��  ��  � o      ���� 0 lngdistance lngDistance�  r   L [ ]   L Y m   L M AXM�     l  M X���� I  M X����
�� .LScosfunnull��� ��� null��   ����
�� 
Lsco l  O T���� ^   O T ]   O R o   O P���� 0 newlat newLat 1   P Q��
�� 
pi   m   R S���� ���  ��  ��  ��  ��   o      ���� $0 earthradiusatlng earthRadiusAtLng  r   \ c ]   \ a ]   \ _ !  m   \ ]���� ! 1   ] ^�
� 
pi   o   _ `�~�~ $0 earthradiusatlng earthRadiusAtLng o      �}�} $0 earthcircleatlng earthCircleAtLng "#" r   d i$%$ ^   d g&'& m   d e�|�|h' o   e f�{�{ $0 earthcircleatlng earthCircleAtLng% o      �z�z 0 lngpermeter lngPerMeter# ()( r   j o*+* ]   j m,-, o   j k�y�y 0 lngdistance lngDistance- o   k l�x�x 0 lngpermeter lngPerMeter+ o      �w�w 0 lngdelta lngDelta) .�v. r   p u/0/ [   p s121 o   p q�u�u 0 lon  2 o   q r�t�t 0 lngdelta lngDelta0 o      �s�s 0 newlng newLng�v  � m    33z                                                                                      @ alis      Macintosh HD               �H&BD ����LocationSimulator.app                                          �����*��        ����  
 cu             Debug   �/:Users:David:Library:Developer:Xcode:DerivedData:LocationSimulator-depewdcvscyvkvalvkqqdhtndlpx:Build:Products:Debug:LocationSimulator.app/  ,  L o c a t i o n S i m u l a t o r . a p p    M a c i n t o s h   H D  �Users/David/Library/Developer/Xcode/DerivedData/LocationSimulator-depewdcvscyvkvalvkqqdhtndlpx/Build/Products/Debug/LocationSimulator.app   /    ��  � 454 l  w w�r�q�p�r  �q  �p  5 6�o6 L   w |77 J   w {88 9:9 o   w x�n�n 0 newlat newLat: ;�m; o   x y�l�l 0 newlng newLng�m  �o  � <=< l     �k�j�i�k  �j  �i  = >�h> i    ?@? I      �gA�f�g &0 "update_location_with_interpolation  A BCB o      �e�e 0 mydevice myDeviceC D�dD o      �c�c 0 pt  �d  �f  @ O     �EFE k    �GG HIH r    	JKJ n    LML 1    �b
�b 
LScnM o    �a�a 0 pt  K o      �`�` 	0 coord  I NON r   
 PQP m   
 �_�_  Q o      �^�^ 0 lasttime lastTimeO RSR l   �]�\�[�]  �\  �[  S TUT l   �ZVW�Z  V C = Interpolate from the current location to the next coordinate   W �XX z   I n t e r p o l a t e   f r o m   t h e   c u r r e n t   l o c a t i o n   t o   t h e   n e x t   c o o r d i n a t eU YZY r    [\[ m    �Y�Y  \ o      �X�X 0 dis  Z ]^] r    _`_ m    �W
�W boovtrue` o      �V�V 0 con  ^ a�Ua V    �bcb k    �dd efe Z    ^gh�Tig =   jkj o    �S�S 0 	lastcoord 	lastCoordk m    �R
�R 
msngh k   " )ll mnm r   " %opo o   " #�Q�Q 	0 coord  p o      �P�P 0 nextlocation nextLocationn q�Oq r   & )rsr m   & '�N
�N boovfalss o      �M�M 0 con  �O  �T  i k   , ^tt uvu l  , ,�Lwx�L  w - ' Calculate the next location we move to   x �yy N   C a l c u l a t e   t h e   n e x t   l o c a t i o n   w e   m o v e   t ov z{z r   , 5|}| n  , 3~~ I   - 3�K��J�K 0 heading  � ��� o   - .�I�I 0 	lastcoord 	lastCoord� ��H� o   . /�G�G 	0 coord  �H  �J    f   , -} o      �F�F 0 	direction  { ��� r   6 @��� n  6 >��� I   7 >�E��D�E 0 next  � ��� o   7 8�C�C 0 	lastcoord 	lastCoord� ��� o   8 9�B�B 0 	direction  � ��A� o   9 :�@�@ 	0 speed  �A  �D  �  f   6 7� o      �?�? 0 nextlocation nextLocation� ��� r   A L��� I  A J�>�=�
�> .LSheadbenull��� ��� null�=  � �<��
�< 
Lspo� o   C D�;�; 0 nextlocation nextLocation� �:��9
�: 
Lsat� o   E F�8�8 	0 coord  �9  � o      �7�7 0 dis  � ��6� Z   M ^���5�4� A   M P��� o   M N�3�3 0 dis  � o   N O�2�2 	0 speed  � k   S Z�� ��� r   S V��� o   S T�1�1 	0 coord  � o      �0�0 0 nextlocation nextLocation� ��/� r   W Z��� m   W X�.
�. boovfals� o      �-�- 0 con  �/  �5  �4  �6  f ��� l  _ _�,�+�*�,  �+  �*  � ��� r   _ e��� n   _ c��� 4  ` c�)�
�) 
cobj� m   a b�(�( � o   _ `�'�' 0 nextlocation nextLocation� o      �&�& 0 lat  � ��� r   f l��� n   f j��� 4  g j�%�
�% 
cobj� m   h i�$�$ � o   f g�#�# 0 nextlocation nextLocation� o      �"�" 0 lng  � ��� I  m x�!�� 
�! .ascrcmnt****      � ****� l  m t���� b   m t��� b   m r��� b   m p��� m   m n�� ��� 0 U p d a t e   l o c a t i o n   t o   l a t :  � o   n o�� 0 lat  � m   p q�� ���    l o n g :  � o   r s�� 0 lng  �  �  �   � ��� l  y y����  �  �  � ��� l  y y����  � U O Wait 1 second so that we actually get approx m/s. This is not really accurate	   � ��� �   W a i t   1   s e c o n d   s o   t h a t   w e   a c t u a l l y   g e t   a p p r o x   m / s .   T h i s   i s   n o t   r e a l l y   a c c u r a t e 	� ��� l  y y����  � 8 2 time is only accurate to seconds in apple script	   � ��� d   t i m e   i s   o n l y   a c c u r a t e   t o   s e c o n d s   i n   a p p l e   s c r i p t 	� ��� Z   y ������ B   y ���� \   y ���� l  y ����� n   y ���� 1   ~ ��
� 
time� l  y ~���� I  y ~���
� .misccurdldt    ��� null�  �  �  �  �  �  � o   � ��� 0 lasttime lastTime� m   � ���  � I  � ��
��	
�
 .sysodelanull��� ��� nmbr� m   � ��� ?�      �	  �  �  � ��� l  � �����  �  �  � ��� O  � ���� I  � ����
� .LSsetlocnull���     LSDE�  � ���
� 
Lsla� o   � ��� 0 lat  � ��� 
� 
Lslo� o   � ����� 0 lng  �   � o   � ����� 0 mydevice myDevice� ��� r   � ���� l  � ������� n   � ���� 1   � ���
�� 
time� l  � ������� I  � �������
�� .misccurdldt    ��� null��  ��  ��  ��  ��  ��  � o      ���� 0 lasttime lastTime� ���� r   � ���� o   � ����� 0 nextlocation nextLocation� o      ���� 0 	lastcoord 	lastCoord��  c o    ���� 0 con  �U  F m     ��z                                                                                      @ alis      Macintosh HD               �H&BD ����LocationSimulator.app                                          �����*��        ����  
 cu             Debug   �/:Users:David:Library:Developer:Xcode:DerivedData:LocationSimulator-depewdcvscyvkvalvkqqdhtndlpx:Build:Products:Debug:LocationSimulator.app/  ,  L o c a t i o n S i m u l a t o r . a p p    M a c i n t o s h   H D  �Users/David/Library/Developer/Xcode/DerivedData/LocationSimulator-depewdcvscyvkvalvkqqdhtndlpx/Build/Products/Debug/LocationSimulator.app   /    ��  �h       ���������  � ��������
�� .aevtoappnull  �   � ****�� 0 heading  �� 0 next  �� &0 "update_location_with_interpolation  � �� ��������
�� .aevtoappnull  �   � ****��  ��  � ������������ 0 wp  �� 0 tr  �� 0 seg  �� 0 pt  �� 0 rt  � - '�� 1�� <������������� a c���� o���������������� ������������� ��������� ����������� 	0 speed  �� 0 
devicename 
deviceName�� 0 filename fileName
�� 
msng�� 0 	lastcoord 	lastCoord
�� 
LSDE�  
�� 
pnam�� 0 mydevice myDevice
�� .ascrcmnt****      � ****
�� .LSpairdenull���     LSDE
�� 
psxp�� 0 mypath myPath
�� 
psxf
�� 
alis�� 0 myalias myAlias
�� 
Lsfl
�� .LSldgpxfnull��� ��� null�� 0 gpxfile gpxFile
�� 
LSWP�� 0 mywaypoints myWaypoints
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� &0 "update_location_with_interpolation  
�� 
LSTR�� 0 mytracks myTracks
�� 
LSSG
�� 
LSTP
�� 
LSRO�� 0 myroutes myRoutes
�� 
LSRP
�� .LSclogpxnull���     LSGX����E�O�E�O�E�O�E�O�z*�k/�[�,\Z�>1E�O��,E�O��%�%j O� *j UO�a %j O�a ,E` O*a _ /a &E` O*a _ l E` Oa j O_ a -E` O !_ [a a l kh  )̠l+  [OY��Oa !j O_ a "-E` #O [_ #[a a l kh  @�a $-[a a l kh  #�a %-[a a l kh )̣l+  [OY��[OY��[OY��Oa &j O_ a '-E` (O >_ ([a a l kh  #�a )-[a a l kh )̣l+  [OY��[OY��Oa *j O_  *j +UOa ,j U� ������������ 0 heading  �� ����� �  ������ 
0 coord1  �� 
0 coord2  ��  � 
���������������������� 
0 coord1  �� 
0 coord2  �� 0 lat1  �� 0 lon1  �� 0 lat2  �� 0 lon2  �� 0 dlon dLon�� 0 yval yVal�� 0 xval xVal��  0 headingdegrees headingDegrees� �������������������������
�� 
cobj
�� 
pi  �� �
�� 
Lssi
�� .LSsinfunnull��� ��� null
�� 
Lsco
�� .LScosfunnull��� ��� null
�� 
Lsyp
�� 
Lsxp�� 
�� .LSatafunnull��� ��� null��h�� ���k/� �!E�O��l/� �!E�O��k/� �!E�O��l/� �!E�O� S��E�O*�l *�l  E�O*�l *�l  *�l *�l  *�l  E�O*��� � �!E�UO�j �Y ��� ������������� 0 next  �� �� ��    �������� 	0 coord  �� 0 heading  �� 0 dis  ��  � ���������������������������������� 	0 coord  �� 0 heading  �� 0 dis  �� 0 lat  �� 0 lon  �� 0 earthcircle earthCircle�� 0 latdistance latDistance�� 0 latpermeter latPerMeter�� 0 latdelta latDelta�� 0 newlat newLat�� 0 lngdistance lngDistance�� $0 earthradiusatlng earthRadiusAtLng�� $0 earthcircleatlng earthCircleAtLng�� 0 lngpermeter lngPerMeter�� 0 lngdelta lngDelta�� 0 newlng newLng� 
�����3������������
�� 
cobj
�� 
pi  
�� 
Lsco�� �
�� .LScosfunnull��� ��� null��h
�� 
Lssi
�� .LSsinfunnull��� ��� null�� }��k/E�O��l/E�Ol� � E�O� ]�*�� �!l  E�O�!E�O�� E�O��E�O�*�� �!l 	 E�O�*�� �!l  E�Ol� � E�O�!E�O�� E�O��E�UO��lv� ��@�������� &0 "update_location_with_interpolation  �� ����   ����� 0 mydevice myDevice� 0 pt  ��   
�~�}�|�{�z�y�x�w�v�u�~ 0 mydevice myDevice�} 0 pt  �| 	0 coord  �{ 0 lasttime lastTime�z 0 dis  �y 0 con  �x 0 nextlocation nextLocation�w 0 	direction  �v 0 lat  �u 0 lng   ��t�s�r�q�p�o�n�m�l�k�j���i�h�g��f�e�d�c
�t 
LScn�s 0 	lastcoord 	lastCoord
�r 
msng�q 0 heading  �p 	0 speed  �o 0 next  
�n 
Lspo
�m 
Lsat�l 
�k .LSheadbenull��� ��� null
�j 
cobj
�i .ascrcmnt****      � ****
�h .misccurdldt    ��� null
�g 
time
�f .sysodelanull��� ��� nmbr
�e 
Lsla
�d 
Lslo
�c .LSsetlocnull���     LSDE�� �� ���,E�OjE�OjE�OeE�O �h���  �E�OfE�Y 4)¢l+ E�O)§�m+ E�O*��� 
E�O�� �E�OfE�Y hO��k/E�O��l/E�O�%�%�%j O*j a ,�j a j Y hO� *a �a �� UO*j a ,E�O�E�[OY�`U ascr  ��ޭ