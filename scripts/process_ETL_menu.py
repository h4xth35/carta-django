
import requests
import bs4

import os
import sys
sys.path.append(
    os.path.join(os.path.dirname(__file__), 'adminPanel_Django_micartafacil')
)
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "adminPanel_Django_micartafacil.settings")

from django.conf import settings
from menu.models import Menu, Restaurant


### PROCESO ETL (Extract, Transform and Load) ###

# Extract data
def extract_data(url):
    response = requests.get(url)
    return response.text.encode('iso8859-15')

# Transform data
def transform_data(data):
    menu = bs4.BeautifulSoup(data, 'lxml')

    categories_list = []
    categories = menu.find_all('ul', id='menu-flters')
    categories = categories[0].find_all('li')
    for category in categories:
        category_dict = {
            'class': category['data-filter'],
            'name': category.text,
        }
        categories_list.append(category_dict)

    menu_list = []
    menu = menu.find_all('div', class_='menu-item')
    for item in menu:
        if item.find('div', class_='menu-ingredients') is not None:
            description = item.find('div', class_='menu-ingredients').text.replace('\n', '').replace('  ', '')
        else:
            description = ""

        menu_dict = {
            'name': item.find('div', class_='menu-content').find('a').text,
            'description': description,
            'price': item.find('div', class_='menu-content').find('span').text,
            'category': "",
            'alergens': "",
        }

        menu_list.append(menu_dict)

    return menu_list


# Load data
def load_data(transformed_data):
    for item in transformed_data:
        print(item)
        # Save to database



if __name__ == '__main__':
    # url = input('Ingrese la url del menu: ')
    url = "https://heladospalma.com/"


    print("Extracting data...")
    data = extract_data(url)

    print("Transforming data...")
    transformed_data = transform_data(data)

    print("Loading data...")
    # load_data(transformed_data)
    for s in Restaurant.objects.all():
        print(s)
