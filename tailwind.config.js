/** @type {import('tailwindcss').Config} */
export default {
  content: ["./**/*.html"],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Roboto", "sans-serif"],
        mono: ["Ubuntu Mono", "monospace"],
        serif: ["Lemon", "serif"],
      },
    },
  },
  plugins: [require("daisyui")],
  daisyui: {
    themes: [
      {
        light: {
          ...require("daisyui/src/theming/themes")["light"],
          primary: "#5f3dc4",
          "primary-content": "white",
          secondary: "#1864ab",
          "secondary-content": "white",
          accent: "#0000ff",
        },
      },
    ],
  },
};
