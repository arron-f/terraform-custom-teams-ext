import pymsteams
import sys, json;

def callTeams(url, title, msg):
	# You must create the connectorcard object with the Microsoft Webhook URL
	ms_teams_connector = pymsteams.connectorcard(url)

	# Add text to the message.
	#myTeamsMessage.addLinkButton("This is the button Text", "https://github.com/rveachkc/pymsteams/")
	ms_teams_connector.title(f"{title}")
	ms_teams_connector.color("#c65ee0")
	ms_teams_connector.text(f"{msg}")

	# send the message.
	try:
	        ms_teams_connector.send()
	        return({'msg': "Sent message"})
	except pymsteams.TeamsWebhookException as e:
	        return({'msg': f"Error encountered {e}"})

if __name__ == "__main__":
	input_str = sys.stdin.read()
	#with open("test.txt","w") as text_file:
	#  text_file.write(input_str)

	data = json.loads(input_str)
	ret = callTeams(data['url'],data['title'],data['msg'])
	print(json.dumps(ret))

