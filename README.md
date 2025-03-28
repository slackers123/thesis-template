## Installing LaTeX
### Windows
https://www.tug.org/texlive/windows.html

### MacOs
https://www.tug.org/mactex/mactex-download.html

## Running stuff
### Compile
- Windows (powershell): `build.ps1`
- MacOs (terminal): `./build.sh`

### Continuously rebuild
- Windows (powershell): `watch.ps1`
- MacOs (terminal): `./watch.sh`

adding `--open` after the command will open the file automatically with your default pdf viewer. Otherwise you can find it in ´out/main.pdf´.

## Recommendations
### Split screen
Use a split screen setup with a text editor on one side and the output pdf on the other and then run the continuously rebuild commands so you can see what the final pdf looks like while typing.
### PDF Reader
Use a pdf reader that stays on the same page after the pdf has changed (skim on macos works well for me.)
