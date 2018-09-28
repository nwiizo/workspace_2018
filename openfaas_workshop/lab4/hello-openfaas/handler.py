import os
import requests
import sys

def handle(req):
    """handle a request to the function
    Args:
        req (str): request body
    """

    gateway_hostname = os.getenv("gateway_hostname", "gateway") # gateway_hostnameという環境変数が無い場合はデフォルト値の"gateway"に設定

    test_sentence = req

    r = requests.get("http://" + gateway_hostname + ":8080/function/sentimentanalysis", data= test_sentence)

    if r.status_code != 200:
        sys.exit("Error with sentimentanalysis, expected: %d, got: %d\n" % (200, r.status_code))


    result = r.json()
    if result["polarity"] > 0.45:
        print("That was probably positive")
    else:
        print("That was neutral or negative")
