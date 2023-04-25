#!/usr/bin/python3.11
def main():
	try:
			import sys
			import json
			import typesense
			id=sys.argv[1]
			newname=sys.argv[2]
			operation=sys.argv[3]
			farm= {'id': id, 'name':newname}
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
					client.collections['farm'].documents[id].update(json.dumps(farm),{'dirty_values': 'coerce_or_reject'})
			elif(operation=='insert'):
					#client.collections['farm'].import_(json.dumps(farm))
					print(sys.argv[3])
					client.collections['farm'].documents.import_(json.dumps(farm))
			else:
					client.collections['farm'].documents[id].delete( )
	except Exception as e:
			print(e)

main()




schema = {
	'name': 'farm',
	'fields': [
		{
			'name'  :  'id',
			'type'  :  'string'
		},
		{
			'name'  :  'name',
			'type'  :  'string',
			'facet' :  True
		},
		 
	] 
}

