# What is it?

Powershell script used to add canarytoken registry keys to monitor specific processes on Windows, and to snapshot registry and specific folders with regshot. Designed for ISTS 2025.

# How to use it?

Add your token keys to the folder token_keys. Then execute `addKeys.ps1` in powershell as an administrator. Notepad with launch the folders to monitor, and regshot will launch.

To take the first snapshot:
1. Make sure Plain TXT is selected
2. check "Scan dir" and paste the dirs from notepad (regshot_paths.txt)
3. make the output path where you wanna save the .hiv
4. click "1st shot" then "shot and save" and save where you want to.

To take the second snapshot:
NOTE: if it has been more than a few minutes since the last snapshot was taken, the output file will be very large and slow to use. However, you should still be able to search it in notepad or another text editor.

1. Make sure Plain TXT is selected, and **click 1st shot and load the first snapshot from the file**
2. check "Scan dir" and paste the dirs from notepad (regshot_paths.txt)
3. make the output path where you wanna save the .hiv
4. click "2st shot" then "shot and output" you don't need to save unless you want to (I recommend saving since sometimes the text editor may crash if opening a big file) It might also be useful to use grep or some Windows equivalent

### Tips for searching output:
search for:
`Folders deleted` or `Files deleted` or `Keys added` or `Values deleted`

You can also search for specific dates, registry keys, values, files, etc.
