// Below are some scripts I have used in the past for integrations with Google Sheets.

// @param: query - JQL query string
// @return: total number of issues (limit 1000)
function getJiraAPIQuery(query) {
	var header = {
		"Authorization" : "Basic ABCDEFGHIJKLMNOPQRSTUVWXYZ=="
	};
	
	var payload = "{ \"jql\" : " + "\"" + query + "\"" + ", \"maxResults\" : 1000 }";
	
	var options = {
		"headers" : header,
		"method" : "post",
		"payload" : payload,
		"contentType" : "application/json"
	};
	
	var endpoint = "https://jira.ABCDEFGHIJK.LMNOPQRSTUVW.XYZ/rest/api/2/search";
	var response = UrlFetchApp.fetch(endpoint, options).getContentText();
	var jsonResponse = JSON.parse(response);
	
	return jsonResponse["total"];
}

// @param: channel - Slack channel ID
// @return: messages in the conversation (limit 100)
function getSlackAPIConversation(channel) {
	var payload = {
		"token": "ABCD-EFGHIJKLMNOP-QRSTUVWXYZ",
		"channel": channel,
		"limit", 100
	};
	
	var options = {
		"method": "get",
		"payload": payload
	};
	
	var endpoint = "https://slack.com/api/conversations.history";
	var response = UrlFetchApp.fetch(endpoint, options).getContextText();
	var jsonResponse = JSON.parse(response);
	
	return jsonResponse.messages;
}
