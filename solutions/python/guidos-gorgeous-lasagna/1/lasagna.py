"""Functions used in preparing Guido's gorgeous lasagna.
"""

# Constant: total oven bake time expected
EXPECTED_BAKE_TIME = 40

# Constant: preparation time per layer (in minutes)
PREPARATION_TIME = 2


def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    Parameters:
        elapsed_bake_time (int): The baking time already elapsed.

    Returns:
        int: The remaining bake time (in minutes).
    """
    return EXPECTED_BAKE_TIME - elapsed_bake_time


def preparation_time_in_minutes(layers):
    """Calculate preparation time based on number of layers.

    Parameters:
        layers (int): Number of lasagna layers.

    Returns:
        int: Total preparation time in minutes.
    """
    return layers * PREPARATION_TIME


def elapsed_time_in_minutes(layers, elapsed_bake_time):
    """Calculate total time spent cooking.

    Parameters:
        layers (int): Number of layers prepared.
        elapsed_bake_time (int): Time already spent baking.

    Returns:
        int: Total time spent (prep + bake).
    """
    return preparation_time_in_minutes(layers) + elapsed_bake_time