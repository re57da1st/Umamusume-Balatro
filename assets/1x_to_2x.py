import os,cv2
p1,p2='1x/','2x/'
def scale_image(image):
    img=cv2.imread(os.path.join(p1,image),cv2.IMREAD_UNCHANGED)
    img=cv2.resize(img,(img.shape[1]*2,img.shape[0]*2),fx=0,fy=0,interpolation=cv2.INTER_NEAREST)
    cv2.imwrite(os.path.join(p2,image),img)
directory=os.listdir(p1)
for x in directory: scale_image(x)