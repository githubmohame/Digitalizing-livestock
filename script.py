import time
from selenium.webdriver.common.action_chains import ActionChains
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import StaleElementReferenceException
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support import expected_conditions as EC
from selenium import webdriver
from bs4 import BeautifulSoup
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
import pandas as pd  
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support.ui import Select
from table_location import open_file
class element_has_css_class(object):
	def __init__(self, driver,name):
		self.driver= driver
		self.name= name
	def __call__(self, driver):
		try:
			select3=self.driver.find_element(By.ID,(self.name))
			select3.click()
			return self.driver
		except:
			pass
class element_has_css_class2(object):
	def __init__(self, select):
		self.select= select
	def __call__(self, driver):
		try:
			self.select.options
			list=[i for i in self.select.options ] 
			return list,self.select,driver
		except:
			pass
def solution():
	name=[]
	gavernorate=3
	city=0
	array=[]
	driver = webdriver.Chrome(ChromeDriverManager().install()) 
	driver.get("https://alzahraa.mans.edu.eg/studentApplications")
	time.sleep(4)
	window_before = driver.window_handles[0]
	driver.switch_to.window(window_before)
	x=driver.find_elements(By.TAG_NAME,("a"))
	driver.implicitly_wait(10)
	x[8].click()
	WebDriverWait(driver, 12,poll_frequency=2 ).until(element_has_css_class(driver,"btnRegionsDwn")) 
	counter=0
	select= Select(driver.find_element(By.ID,'cmbAddress') )
	list=select.options
	len(list)
	while(7>gavernorate):
			class  fun1(object):
				def __call__(self, driver):
					select= Select(driver.find_element(By.ID,'cmbAddress') )
					list1,f,driver1=WebDriverWait(driver, 12,poll_frequency=2 ).until(element_has_css_class2(select,))
					try:
						name.append(list1[gavernorate].get_attribute("title"))
						select.select_by_index(gavernorate)
					except:
						return
					return name
			WebDriverWait(driver, 12,poll_frequency=2).until(fun1())
			time.sleep(4)
			list2,f,driver1=WebDriverWait(driver, 12,poll_frequency=2 ).until(element_has_css_class2(select,))
			time.sleep(4)
			WebDriverWait(driver, 12,poll_frequency=2 ).until(element_has_css_class(driver,"btnRegionsDwn")) 
			time.sleep(4)
			counter+=1
			class  func(object):
				def __init__(self):
					pass
				def __call__(self, driver):
					select= Select(driver.find_element(By.ID,'cmbAddress') )
					if(len(select.options)<=city):
							global max_city
							max_city=1
							list1=[i.text for i in select.options]
					else:
						select.select_by_index(city)
						list1=[i.text for i in select.options]
						name.append(list1[city])
					return list1
			time.sleep(2)
			is_end=WebDriverWait(driver, 20,poll_frequency=2 ).until(func())
			time.sleep(4)
			if(len(is_end)<=city):
				#print(counter)
				while(counter>0):        
					WebDriverWait(driver, 6,poll_frequency=2 ).until(element_has_css_class(driver,"btnRegionsUp"))
					time.sleep(4)
					counter-=1
				#print("max city")
				counter=0
				city=0
				gavernorate+=1
				print(gavernorate)
				name=[] 
				continue
			city+=1
			try:
				WebDriverWait(driver, 12,poll_frequency=2 ).until(element_has_css_class(driver,"btnRegionsDwn")) 
				time.sleep(4)
				counter+=1
			except:
				pass
			select= Select(driver.find_element(By.ID,'cmbAddress') )
			time.sleep(4)
			if(counter>=2):
				list1=[i.text for i in select.options]
				for i in list1:
					array.append([name[0],name[1],i])
			elif(counter>=1):
				array.append([name[0],name[1],name[1]])
			while(counter>0):        
				WebDriverWait(driver, 6,poll_frequency=2 ).until(element_has_css_class(driver,"btnRegionsUp"))
				time.sleep(4)
				counter-=1
			if(name in array):
				#print('Error')
				pass
			#array.append(name)
			name=[] 
			time.sleep(12)
	print(len(array))
	open_file(array)
solution()