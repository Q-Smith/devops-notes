 # PDFs in Dark Mode
 
```js
const overlay = document.createElement("div");

const css = `
    position: fixed;
    pointer-events: none;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background-color: white;
    mix-blend-mode: difference;
    z-index: 1;
`
overlay.setAttribute("style", css);

document.body.appendChild(overlay);
```

# References

- https://superuser.com/questions/1527410/how-can-i-preview-pdfs-with-google-chrome-in-dark-mode
