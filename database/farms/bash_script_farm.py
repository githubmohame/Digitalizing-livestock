#!/usr/bin/python3.11
def main():
	try:
			import sys
			import json
			import typesense
			#print(sys.argv)
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
					client.collections['farm'].documents[id].update(  farm )
			elif(operation=='insert'):
					#client.collections['farm'].import_(json.dumps(farm))
					client.collections['farm'].documents.create(json.dumps(farm))
					#print(90)
			else:
					client.collections['farm'].documents[id].delete( )
	except Exception as e:
			#print(9)
			pass

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

