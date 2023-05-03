

from demostore.demostoreConfigs.couponConfigs import COUPONS
import random
from robot.api import logger
from robot.api.deco import keyword


class Coupons(object):
    @keyword("Get a valid coupon")
    def get_valid_coupon(self):
        """
        :return:
        """
        logger.console("Getting valid coupon")
        return random.choice(COUPONS['valid'])

    @keyword("Get an expired coupon")
    def get_expired_coupon(self):
        """
        :return:
        """
        logger.console("Getting expired coupon")
        return random.choice(COUPONS['expired'])

    @keyword("Discount should be calculated correctly")
    def discount_should_be_calculate_correctly(self, original_price, discounted_price, discount_percentage):
        """
        Given the original price, this method verifies the given percentage is applied correctly
        to the original price to get the discounted price
        :param original_price:
        :param discounted_price:
        :param discount_percentage:
        :return:
        """

        og_price = original_price.replace('€', '').replace(',', '.')
        logger.console(f"Original Price: {original_price} to  OG Price: {og_price}")
        og_price = float(og_price)

        dsc_price = discounted_price.replace('€', '').replace(',', '.')
        logger.console(f"Discounted Price: {discounted_price} to DSC Price:  {dsc_price}")
        dsc_price = float(dsc_price)
        logger.console(f"Discount Percentage: {discount_percentage}")

        discount = og_price * (discount_percentage / 100)
        expected_discounted = og_price - discount

        if expected_discounted != dsc_price:
            raise Exception(f"\nThe discounted price is not correct. Discount percentage: {discount_percentage}%"
                            f"\nOriginal price: ${original_price}, Expected discounted: ${expected_discounted}, "
                            f"Actual discounted: ${discount}")
        else:
            logger.console("Discount calculated correctly.")
