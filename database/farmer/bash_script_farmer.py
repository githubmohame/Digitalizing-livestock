#!/usr/bin/python3.11
def main():
	try:
			import sys
			import json
			import typesense
			ssn=sys.argv[1]
			newname=sys.argv[2]
			operation=sys.argv[3]
			print(sys.argv[3])
			farmer= {'id': ssn, 'name':newname}
			client = typesense.Client({
					'api_key': 'AA3jvgcuaEfuB3GAtWjNS3LG66404bd6KHOBK1YqstLgBTtT',
					'nodes': [{
							'host': 'localhost',
							'port': '8108',
							'protocol': 'http'
					}],
					'connection_timeout_seconds': 2
			})
			if(operation=='update'):
					client.collections['farmer'].documents[ssn].update(json.dumps(farmer),{'dirty_values': 'coerce_or_reject'})
			elif(operation=='insert'):
					#client.collections['farmer'].import_(json.dumps(farmer))
					client.collections['farmer'].documents.import_(json.dumps(farmer))
			else:
					client.collections['farmer'].documents[ssn].delete( )
	except Exception as e:
			print(e)

main()






