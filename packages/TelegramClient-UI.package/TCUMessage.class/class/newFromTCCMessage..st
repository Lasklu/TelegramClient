instance creation
newFromTCCMessage: aMessage

	^ self basicNew
		text: aMessage message;
		senderID: aMessage senderID;
		initialize