schema = {
	'name': 'farmer',
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
import typesense
client = typesense.Client({
					'api_key': 'AA3jvgcuaEfuB3GAtWjNS3LG66404bd6KHOBK1YqstLgBTtT',
					'nodes': [{
							'host': 'localhost',
							'port': '8108',
							'protocol': 'http'
					}],
					'connection_timeout_seconds': 2
			})

client.collections.create(schema)
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

client.collections.create(schema)
