import matplotlib.pyplot as plt                                                 
import numpy as np                                                              
from PIL import Image                                                           
import random
import os

batch_size=512
input_path="/home/alex/imagenet/val"
image_dim=113

average_image=np.zeros([image_dim,image_dim])

# select random files from input path
image_paths = []
for _ in range(batch_size):
    # get random directory
    rnd_dir = random.choice(os.listdir(input_path)) #TODO: only choose directories, not
    # get random image path
    rnd_image_path = os.path.join(input_path,rnd_dir,random.choice(os.listdir(os.path.join(input_path, rnd_dir))))
    # load an image as numpy array                                                  
    image = Image.open(rnd_image_path).convert("RGB")                                     
    image = image.resize((image_dim,image_dim),Image.ANTIALIAS)                                 
    image = np.array(image,dtype=np.float32)                                        
    image = (image - image.mean(axis=(0,1,2), keepdims=True)) / image.std(axis=(0,1,2), keepdims=True)
    # get absolute difference
    image = np.absolute(image[:,:,0]-image[int((image_dim+1)/2),int((image_dim+1)/2),0])
    # accumulate to average image
    average_image = average_image + np.divide(image,batch_size)
                                                                                    
# plot
plt.imshow(average_image,interpolation='quadric')
plt.colorbar()
plt.xticks([])
plt.yticks([])
plt.tight_layout()
plt.show() 
