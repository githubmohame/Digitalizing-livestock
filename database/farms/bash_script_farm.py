from googletrans import Translator
def main():
	try:
			import sys
			import json
			import typesense
			#print(sys.argv)
			id=sys.argv[1]
			newname=sys.argv[2]
			newname.split(" ")
			newname="".join(newname)
			operation=sys.argv[3]
			t1=Translator( )
			
			newname=(t1.translate(newname,dist="en") ).text
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
					client.collections['farm'].documents.import_(json.dumps(farm))
					#print(90)
			else:
					client.collections['farm'].documents[id].delete( )
	except Exception as e:
			print(str(e))
			pass

main()
import sys
#print(sys.argv[1])

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
 