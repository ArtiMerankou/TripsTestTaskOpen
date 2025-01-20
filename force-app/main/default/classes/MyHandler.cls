global class MyHandler implements Messaging.InboundEmailHandler {
	  global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
		  Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
          String bodyText = email.plainTextBody;
          
          List<EmailMessage> allmessages = [SELECT Id, RelatedToId FROM EmailMessage];
          return result; // return Messaging.InboundEmailResult
      }
}
