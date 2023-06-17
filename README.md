
# Selenium with Headless Chrome and BS4
If you need to build a quick bot using Selenium and BS4, this Dockerfile has it ready.
You can use this Dockerfile to quickly bring up a simple Ubuntu instance with the following:
- Selenium
- Headless Chrome
- BeautifulSoup with LXML

## How to run

Bring up the container
```
git clone https://www.github.com/noeltimothy/selenium-boilerplate
cd selenium-boilerplate
docker build . -t selenium-image
docker run -d --name bot selenium-image
```

Next, the container runs infinitely allowing you to exec into it using bash
```
docker exec -u root -it bot  bash
```

## Simple code to extract jobs from LinkedIn
Once you are inside the container, you can run this sample code on the python3 shell.
This code scrapes linkedin for all accounting jobs in Canada. 

```
>>> from selenium import webdriver
>>> from bs4 import BeautifulSoup
>>> jobs_to_search = 'accounting'
>>> url = F"https://www.linkedin.com/jobs/search/?f_TPR=r604800&geoId=101174742&keywords={jobs_to_search}&location=Canada&sortBy=DD"
>>> opt = webdriver.ChromeOptions()
>>> opt.add_argument('headless')
>>> opt.add_argument('--no-sandbox')
>>> driver = webdriver.Chrome(options=opt)
>>> driver.get(url)
>>> lxml_soup = BeautifulSoup(driver.page_source, 'lxml')
>>> job_container = lxml_soup.find('ul', class_ = 'jobs-search__results-list')
>>> company_names = [ job.select_one('img')['alt'] for job in job_container ]
>>> job_ids = [ job.find('a', href=True)['href'] for job in job_container ]
>>>
```
