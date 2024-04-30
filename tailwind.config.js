/** @type {import('tailwindcss').Config} */
export const content = ['./layouts/**/*.html']
export const theme = {
  fontFamily: {
    sans: ['Roboto', 'sans-serif'],
    mono: ['Ubuntu Mono', 'monospace']
  }
}
export const plugins = [require('daisyui')]
export const daisyui = {
  themes: [
    {
      light: {
        ...require('daisyui/src/theming/themes')['light'],
        primary: '#5f3dc4',
        'primary-content': 'white',
        secondary: '#1864ab',
        'secondary-content': 'white',
        accent: '#0000ff',
        'success-content': 'white',
        'error-content': 'white',
        '--rounded-btn': '0.5rem',
        '--rounded-box': '0.5rem'
      }
    }
  ]
}
