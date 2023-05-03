from robot.api import logger
from robot.libraries.BuiltIn import  BuiltIn


def verify_16_products_are_displayed():
    "returns:"

    selenium_lib = BuiltIn().get_library_instance('SeleniumLibrary')
    # browser = selenium_lib.current_browser()
    # get the container element that contains all products
    # all_products_element = browser.find_element_by_class_name('products')
    all_products_element = selenium_lib.find_element('css:ul.products.columns-4')

    # get all list items or products in the container
    products_elements_list = selenium_lib.find_elements('class:product', all_products_element)

    number_of_products = len(products_elements_list)
    if number_of_products != 16:
        raise Exception(f"Number of products in the page is not 12. Actual{number_of_products}")

    # step further and check if the products are visible
    logger.info("Checking if products are on page.")
    for product_element in products_elements_list:
        if not product_element.is_displayed():
            raise Exception("One more products on the page is/are not visible")
    #
    logger.console("PASS. Correct number of products are displayed")
