as yet unclassified
executeOn: client request: request
	<cdecl: void 'td_json_client_execute' (void* char*) module: 'libtdjson.so'>
	^self externalCallFailed.