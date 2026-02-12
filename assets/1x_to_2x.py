import os, cv2

def scale_image(image):
    p1 = '1x/' #Directory of the images we want to scale
    p2 = '2x/' #Directory of where the images should save
    img = cv2.imread(os.path.join(p1 , image), cv2.IMREAD_UNCHANGED) #Read in the image with RGBA channels
    img = cv2.resize(img,(img.shape[1] * 2,img.shape[0] * 2),fx=0, fy=0, interpolation = cv2.INTER_NEAREST) #Scale the image up
    cv2.imwrite(os.path.join(p2 , image), img) #Save the image in the new directory
    return

directory = os.listdir("1x/") #Read the 1x directory and store all file names in a list

for x in directory: #Run the scale command for each image in the list
    scale_image(x)