import re
import poplib
import cv2
import numpy as np
#import time
#import os
#import psutil
#from psutil import NoSuchProcess
#from autopy import mouse
#import pyscreenshot as ImageGrab
#import subprocess
#import robot.libraries.Dialogs as Dialogs

class clashroyaleUtils():

    def image_Location(self, needleImage, haystackImage, tolerance=0.9):
        """
        Return value is the central (x,y) of the first image found.
        https://github.com/asweigart/pyscreeze/blob/master/pyscreeze/__init__.py
        """
        image = cv2.imread(haystackImage)
        imgage_gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        template = cv2.imread(needleImage, 0)
        height, width = template.shape[:2]
        w, h = template.shape[::-1]
        res = cv2.matchTemplate(imgage_gray, template, cv2.TM_CCOEFF_NORMED)

        try:
            loc = np.where(res >= tolerance)
            y = loc[0][0] + height/2
            x = loc[1][0] + width/2
            return x, y
        except:
            return -1,  "failed to locate the image"

    def image_Location_Loop(self, needleImage, haystackImage, tolerance=0.9):
        """
        Return value is the central (x,y) of the first image found.
        https://github.com/asweigart/pyscreeze/blob/master/pyscreeze/__init__.py
        """
        image = cv2.imread(haystackImage)
        image_gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        img_found = 'NO'
        for needle in needleImage:
            #needle.encode('ascii', 'ignore')
            #template = cv2.imread(needle, 0)
            tmpneedle = needle.encode("utf-8")    # lista unicode
            template = cv2.imread(tmpneedle)
            height, width = template.shape[:2]
            w, h = template.shape[::-1]
            res = cv2.matchTemplate(image_gray, template, cv2.TM_CCOEFF_NORMED)
            try:
                loc = np.where(res >= tolerance)
                y = loc[0][0] + height/2
                x = loc[1][0] + width/2
                return x, y
                #img_found = 'YES'
            except:
                pass

        #if img_found == 'YES':
        #    return x, y
        #else:
        return -1,  "failed to locate the image"



    def build_index_string(self, index):

        index_string = str(index)
        while True:
            index_string = '0' + index_string
            if (len(index_string) > 3):
                break

        return index_string