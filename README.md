# ObsidianToLogseq
A bash script to port your obsidian vault to Logseq journal.

# How it works?
You give the script the path to your obsidian vault: It will go over all the markdown files inside them (recursively) and will write a Logseq Journal based on what it finds.

# Things to keep in mind
- I created this script in a few minutes to migrate my own Obsidian Vault to Logseq. I will probably no longer update this script as I used it once.
- The script uses the modification dates of the markdown files metadata as the date to migrate them into Logseq's daily journal.

# How to use (For linux-based OSes)

1. **Backup your Obsidian vault before proceeding**
2. Download the script (clone the repository or just grab the file).
3. Give it execute permissions: `chmod +x obsidianToLS.sh`
4. Run the script and pass in the directory you want to check: `./obsidianToLS.sh /path/to/your/directory`
