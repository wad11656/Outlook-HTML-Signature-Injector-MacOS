--  ----------------------------------------
-- | Oᴜᴛʟᴏᴏᴋ HTML Sɪɢɴᴀᴛᴜʀᴇ Iɴᴊᴇᴄᴛᴏʀ |
--  ----------------------------------------
-- Allows pasting your own HTML markup and generating an Outlook signature with it.
-- With the right HTML/CSS, this can allow for:
-- + Preventing image scaling and images being sent as attachments.
-- + Preventing phone numbers and addresses from hyper-linking.
-- + Safely creating interesting and complex signature designs.


--    **********************************************
--  | Press the ▶️ button in the top-right to start the program |
--    **********************************************








































-- Set the script's icon
set scriptPath to quoted form of POSIX path of (path to me as text)
set assetsFolderPath to quoted form of POSIX path of ((path to me as text) & "::assets:")
set assetsFolderPath_unquoted to ((path to me as text) & "::assets:")
try
	assetsFolderPath_unquoted & "icon_set" as alias
on error
	do shell script "chmod +x " & assetsFolderPath & "fileicon"
	do shell script assetsFolderPath & "fileicon" & " set " & scriptPath & " " & assetsFolderPath & "Outlook_HTML_Injector.icns"
	do shell script "touch " & assetsFolderPath & "icon_set"
end try


-- The interactive part
set signatureName1 to ""
set signatureContent1 to ""
set signatureName2 to ""
set signatureContent2 to ""

set assetsFolderPath to (path to me as text) & "::assets:"
set numSignatures to button returned of (display dialog "How many signatures would you like to create?" buttons {"1", "2", "Cancel"} with title "Signature Creator" with icon file (assetsFolderPath & "hashtag.png"))

if numSignatures is "1" then
	display dialog "Enter Signature Name:" default answer "" buttons {"Cancel", "OK"} default button 2 ¬
		with title "Signature Name" with icon file (assetsFolderPath & "rename.png")
	set signatureName1 to text returned of result
	
	display dialog "Paste Signature HTML:" default answer "" buttons {"Cancel", "OK"} default button 2 ¬
		with title "Signature Content" with icon file (assetsFolderPath & "code-file.png")
	set signatureContent1 to text returned of result
	
	try
		tell application id "com.microsoft.Outlook"
			make new signature with properties {name:signatureName1, content:signatureContent1}
		end tell
		display dialog "Done 🎉

Signature added.

Open \"Outlook → Preferences → Signatures\" to configure your default signatures." buttons {"OK"} default button 1 with title "Signature Created" with icon file (assetsFolderPath & "ok.png")
		tell application "Script Editor"
			quit
		end tell
	on error error_message number error_number
		display dialog "Error: " & error_message & " (" & (error_number as text) & ")" buttons {"OK"} default button 1 with title "Error" with icon stop
	end try
else if numSignatures is "2" then
	display dialog "Enter Signature 1 Name:" default answer "" buttons {"Cancel", "OK"} default button 2 ¬
		with title "Signature 1 Name" with icon file (assetsFolderPath & "rename.png")
	set signatureName1 to text returned of result
	
	display dialog "Paste Signature 1 HTML:" default answer "" buttons {"Cancel", "OK"} default button 2 ¬
		with title "Signature 1 Content" with icon file (assetsFolderPath & "code-file.png")
	set signatureContent1 to text returned of result
	
	display dialog "Enter Signature 2 Name:" default answer "" buttons {"Cancel", "OK"} default button 2 ¬
		with title "Signature 2 Name" with icon file (assetsFolderPath & "rename.png")
	set signatureName2 to text returned of result
	
	display dialog "Paste Signature 2 HTML:" default answer "" buttons {"Cancel", "OK"} default button 2 ¬
		with title "Signature 2 Content" with icon file (assetsFolderPath & "code-file.png")
	set signatureContent2 to text returned of result
	
	try
		tell application id "com.microsoft.Outlook"
			make new signature with properties {name:signatureName1, content:signatureContent1}
			make new signature with properties {name:signatureName2, content:signatureContent2}
		end tell
		display dialog "Done 🎉

Signatures added.

Open \"Outlook → Preferences → Signatures\" to configure your default signatures." buttons {"OK"} default button 1 with title "Signatures Created" with icon file (assetsFolderPath & "ok.png")
		tell application "Script Editor"
			quit
		end tell
	on error error_message number error_number
		display dialog "Error: " & error_message & " (" & (error_number as text) & ")" buttons {"OK"} default button 1 with title "Error" with icon stop
	end try
else
	-- Invalid option selected
	display dialog "Invalid option selected." buttons {"OK"} default button 1 with title "Error" with icon stop
end if