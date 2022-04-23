from jsonrpcclient import parse, request
import requests
response = requests.post("https://amsterdam.skalenodes.com/v1/attractive-muscida", json=request("eth_chainId"))
print((response.json()))