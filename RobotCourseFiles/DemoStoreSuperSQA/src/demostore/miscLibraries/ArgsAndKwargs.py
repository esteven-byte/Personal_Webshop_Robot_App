

from robot.api import logger


def example_of_args(*args):
    logger.console(f"\n#######################")
    logger.console(f"*args is {args}")
    logger.console(f"Type of args: {type(args)}")
    for i in args:
        logger.console(i)
    logger.console('#########################')


def example_of_kwargs(**kwargs):
    logger.console(f"\n#######################")
    logger.console(f"**kwargs is {kwargs}")
    logger.console(f"Type of kwargs: {type(kwargs)}")
    for i in kwargs:
        logger.console(i)
    logger.console('#########################')
