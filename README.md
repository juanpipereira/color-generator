## Color Generator
 Generate random colors and chose your favorites

- 🎨  Generate random colors or apply filters according to your preferences
- 🎁  Save the colors you like the most to have them in handy
- 👌  Preview the colors and copy them to clipboard with just one tap

&nbsp;

### Technical Aspects
The app makes use of [Firebase Auth](https://firebase.google.com/docs/auth) for the authentication, allowing the user to log in into its Gmail account. Thanks to that, the colors it selects will be stored in [Firestore](https://firebase.google.com/docs/firestore).
In case the user decides not to sign in, it has the chance to enter the app like visitor. Thus, the colors it selects will be saved as well but will be lost after signing out.
Some important packages that are being used are the package [Go Router](https://docs.page/csells/go_router) for navigation, and [Riverpod](https://riverpod.dev), used for the state management.

&nbsp;

### Usage
Filters can be applied to the generation of colors:
- Gray Tones: make the output to be a shade of gray that ranges from black to white.
- Material Colors: returns one of a set of 16 vivid colors that Flutter provides.
- RGB Tones: uses different shades of any of the main colors of light, red, green and blue.
If no filter is applied, the default behavior will be to generate any random color.

Colors can either be saved to the favorite colors list, removed from it, or once it is in there, the color hex code can be saved in the clipboard.

&nbsp;

![image](https://github.com/juanpipereira/color-generator/assets/52573159/73585948-98a2-464b-8ba7-45907b2a7029)
